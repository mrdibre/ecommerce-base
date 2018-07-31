<?php

namespace Icontrole\Site\Controllers;

use Icontrole\Library\Payment\PagSeguro\Config\PagSeguroConfig;
use Icontrole\Library\Payment\PagSeguro\Payment\CreatePayment;
use Icontrole\Models\Configpagamento;
use Icontrole\Models\Pedidos;
use Icontrole\Models\Produtos;
use Phalcon\Mvc\View;

use FlyingLuscas\Correios\Client;
use FlyingLuscas\Correios\Service;

class CheckoutController extends BaseController {

    /**
     * @var Client $frete
     */
    private $frete;

    /**
     * @var \stdClass $infofrete
     */
    private $infofrete;

    /**
     * @var Configpagamento $config
     */
    private $config;

    public function initialize(){
        parent::initialize();

        parent::checkIfUserIsComplete();

        if(!$this->session->has("usuario"))
            $this->response->redirect("autenticacao");

        $this->assets->addJs("js/custom/checkout.js");
        $this->frete = new Client();

        /**
         * @var Configpagamento $config
         */
        $this->config = Configpagamento::findFirst();
        $params = $this->config->getParametros();

        $s = new PagSeguroConfig($params["email"],$params["token"]);
        $this->view->pagsession = $s->getSession();
        $this->view->installmentsnointerest = $this->config->getOpcoes()["max_parcelas_sem_juros"];

    }

    public function indexAction(){

        /**
         * Desativa o layout do site
         */
        $this->view->disableLevel(View::LEVEL_MAIN_LAYOUT);

        /**
         * Pega os metódos de pagamento no banco de dados
         */
        $this->view->methods = $this->config->getMetodos();

        /**
         * Pega o cliente logado
         */
        $this->view->usuario = $this->cliente;

        /**
         * Caso tenha usuário calcula o frete
         */
        if($this->cliente)
            $this->view->frete = $this->infofrete = $this->calcFrete("38414-323", $this->cliente->endereco["cep"], $this->cliente->getCarrinho());

    }

    /**
     * Função responsável por realizar o checkout transparente
     * @throws \Phalcon\Mvc\Collection\Exception
     */
    public function paymentAction(){

        /**
         * Pega os dados que foram passados como parâmetros
         */
        $data = ($this->request->getJsonRawBody())->data;

        /**
         * Separa o email do usuário pelo @ e concatena com @sandbox.pagseguro.com.br
         * FIXME: APENAS PARA SANDBOX
         */
        $email = explode("@",$this->cliente->getEmail())[0]."@sandbox.pagseguro.com.br";

        /**
         * Armazena o endereço de entrega em um obj
         */
        $enderecoDeEntrega = $data->address->different ? $data->address->data : $this->cliente->getEndereco();

        /**
         * Armazena o nome e o email do cliente em um obj
         */
        $cliente = new \stdClass();
        $cliente->nome = $this->cliente->getNome()." ".$this->cliente->getSobrenome();
        $cliente->email = $email;

        /**
         * Pega os dados de parcelamento que foi enviado pelo usuário
         * total_de_parcelas:_valor_de_cada_parcela
         */
        $installments = explode(":", $data->installments->current );

        /**
         * Pega as configurações de pagamento
         */
        $this->config = Configpagamento::findFirst();

        /**
         * Cria um novo objeto para armazena o usuário
         */
        $user = new \stdClass();

        /**
         * Junta o nome e o sobrenome do usuário
         */
        $user->nome = $this->cliente->getNome()." ".$this->cliente->getSobrenome();

        /**
         * Passa o email do usuário
         * (se for sandbox passa EMAIL_DO_USUARIO@sandbox.pagseguro.com.br senão passa EMAIL_DO_USUARIO)
         */
        $user->email = $email;

        /**
         * Passa a data de nascimento do usuário
         */
        $user->nascimento = $this->cliente->getNascimento();

        /**
         * Passa o contato do usuário
         */
        $user->contato = $this->cliente->getContato();

        /**
         * Passa o documento do usuário
         */
        $user->documento =  $this->cliente->getDocumento();

        /**
         * Passa o endereço do pedido
         */
        $user->endereco =  $enderecoDeEntrega;

        /**
         * Responsável por armazenar todos os produtos
         * do carrinho
         */
        $produtos = [];

        /**
         * Guarda o total do compra
         */
        $totalcompra = 0;

        /**
         * Percorre o carrinho do usuário
         */
        foreach ( $this->cliente->getCarrinho() as $produto ){

            /**
             * Cria um objeto para o produto atual
             */
            $prod = new \stdClass();

            /**
             * Armazena o id do produto
             */
            $prod->id = $produto["_id"];

            /**
             * Armazena o nome do produto
             */
            $prod->nome = $produto["nome"];

            /**
             * Armazena a quantidade do produto
             */
            $prod->qtd = $produto["quantity"];

            /**
             * Armazena o preço do produto
             */
            $prod->preco = $produto["preco"];

            /**
             * Armazena o produto atual no array
             */
            $produtos[] = $prod;

            /**
             * Adiciona um novo valor ao total da compra
             */
            $totalcompra += $produto["preco"] * $produto["quantity"];
        }

        /**
         * Cria um novo objeto para o cartão de crédito
         */
        $card = new \stdClass();

        /**
         * Verifica se o método escolhido é cartão de crédito
         */
        if($data->method === "credit_card"){

            /**
             * Passa o token do cartão
             */
            $card->token = $data->token;

            /**
             * Cria um novo objeto para as parcelas
             */
            $card->installments = new \stdClass();

            /**
             * Passa o número total de parcelas
             */
            $card->installments->total     = $installments[0];

            /**
             * Passa o valor de cada parcela
             */
            $card->installments->valor     = $installments[1];

            /**
             * Passa o valor máximo de parcelas
             */
            $card->installments->max       = $this->config->getOpcoes()["max_parcelas"];

            /**
             * Passa o valor máximo de parcelas sem juros
             */
            $card->installments->max_juros = $this->config->getOpcoes()["max_parcelas_sem_juros"];
        }

        /**
         * Cria um novo objecto para armazenar as URLs
         */
        $urls = new \stdClass();

        /**
         * Define a URL de notificacao para atualizar o produto
         */
        $urls->notificacao = "http://udipop.com.br/2018/icontrole/notificacao";

        /**
         * Define a URL para redirecionamento do usuário
         * TODO: Remover isso da classe de pagamento, pois só é necessário o redirecionamento na tela do PagSeguro
         */
        $urls->redirecionamento = "udipop.localhost";

        /**
         * Cria um novo objeto de frete
         */
        $frete = new \stdClass();

        /**
         * Define o tipo do frete(SEDEX,PAC,...)
         */
        $frete->tipo = $data->frete->tipo;

        /**
         * Define o valor do frete
         */
        $frete->valor = $data->frete->valor;

        /**
         * Cria um novo objeto de pagamento
         */
        $payment = new CreatePayment();

        /**
         * Chama a função de gerar pagamento
         */
        $ret = $payment->generatePayment($produtos, $data->method, $data->hash, $user, $urls, $card, $frete);

        /**
         * Caso o retorno não seja um objeto, a compra não foi finalizada
         */
        if(gettype($ret) !== "object"){
            die(
                json_encode(
                    [
                        "status" => "error",
                        "reason" => $ret
                    ]
                )
            );
        }

        /**
         * @var \PagSeguro\Parsers\Transaction\Boleto\Response $ret
         */
        $pagamento = new \stdClass();

        /**
         * Define o método de pagamento
         */
        $pagamento->tipo = $data->method;

        /**
         * Caso o método seja cartão de crédito
         */
        if($data->method === "credit_card"){

            /**
             * Define o total de parcelas na compra
             */
            $pagamento->parcelas = $ret->getInstallmentCount();

            /**
             * Define o valor de cada parcela
             */
            $pagamento->valor_parcela = number_format( ($totalcompra/$ret->getInstallmentCount()) ,2,'.','');

            /**
             * Define o acrescimo
             */
            $pagamento->acrescimo = $ret->getExtraAmount();
        }

        /**
         * Cria um novo objeto de pedido
         */
        $pedido = new Pedidos();

        /**
         * Define o cliente do pedido
         */
        $pedido->setCliente($cliente);

        /**
         * Define os produtos do pedido
         */
        $pedido->setProdutos( [$produtos][0] );

        /**
         * Define a forma de pagamento
         */
        $pedido->setPagamento($pagamento);

        /**
         * Define a referência
         */
        $pedido->setReferencia($ret->getReference());

        /**
         * Define o total da compra
         */
        $pedido->setTotal( number_format($totalcompra + $frete->valor,2,'.','') );

        /**
         * Define o código de rastreio
         */
        $pedido->setRastreamento("indisponível");

        /**
         * Define o frete
         */
        $pedido->setFrete($frete);

        /**
         * Cria um novo objeto para armazenar o status
         */
        $newstatus = new \stdClass();

        /**
         * Armazena o status do pagamento
         */
        $newstatus->pagamento = $ret->getStatus();

        /**
         * Armazena o status da loja
         */
        $newstatus->loja = "";

        /**
         * Define o status
         */
        $pedido->setStatus($newstatus);

        /**
         * Define a data
         */
        $pedido->setData( date("d/m/Y H:i:s") );

        /**
         * Define o endereço de entrega
         */
        $pedido->setEntrega($enderecoDeEntrega);

        /**
         * Verifica se houve erro ao criar um novo pedido
         */
        if(!$pedido->create()){
            echo "erro ao salvar o pedido";
        }

        /**
         * Esvazia o carrinho do usuário
         */
        $this->cliente->setCarrinho([]);

        /**
         * Salva as informações do usuário
         */
        $this->cliente->save();

        /**
         * Caso o método seja boleto
         */
        if($data->method === "boleto"){

            /**
             * Retorna as informações de boleto para o front-end
             */
            die(
                json_encode(
                    [
                        "status" => "success",
                        "response" => [
                            "link" => $ret->getPaymentLink(),
                            "code" => $ret->getCode(),
                            "reference" => $ret->getReference()
                        ]
                    ]
                )
            );
        }
        /**
         * Caso o método seja cartão de crétido
         */
        else{

            /**
             * Retorna as informações de cartão de crétido para o front-end
             */
            die(
                json_encode(
                    [
                        "status" => "success",
                        "response" => [
                            "code" => $ret->getCode(),
                            "reference" => $ret->getReference()
                        ]
                    ]
                )
            );
        }

    }

    /**
     * Calcula o frete da compra
     * @param string $origin
     * @param string $destination
     * @param array $items
     * @return array
     */
    public function calcFrete(string $origin, string $destination, array $items){

        $this->frete
            ->freight()
            ->origin($origin)
            ->destination($destination)
            ->services(Service::SEDEX_CONTRATO, Service::PAC_CONTRATO)
            ->package(1)
            ->credentials("18188613","f4V07");

        foreach ($items as $item){

            /**
             * @var Produtos $product
             */
            $product = Produtos::findById($item["_id"]);

            $this->frete->freight()->item(
                $product->getDimensoes()["largura"],
                $product->getDimensoes()["altura"],
                $product->getDimensoes()["comprimento"],
                $product->getPeso() || .1,
                $item["quantity"]
            );

        }

        return $this->frete->freight()->calculate();

    }

}