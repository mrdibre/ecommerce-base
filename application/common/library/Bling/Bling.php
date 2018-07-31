<?php

namespace Icontrole\Library\Bling;


class Bling
{
    protected $apikey;

    protected $url = 'https://bling.com.br/Api/v2/';

    protected $outputType = 'json';

    public function __construct(string $apikey)
    {
        $this->apikey = $apikey;
    }

    public function getProdutos($page,$ativo = true)
    {
        return $this->executeGet('produtos', $ativo, $page);
    }

    public function getCategorias($ativo = true)
    {
        return $this->executeGet('categorias', $ativo);
    }

    protected function executeGet($value, $ativo,$page)
    {
        $curl_handle = curl_init();

        curl_setopt($curl_handle, CURLOPT_URL, $this->url . $value . '/page='. $page.'/' . $this->outputType . ($ativo ? '&filters=situacao[A]' : '') . '&apikey=' . $this->apikey."&loja=203209171&estoque=S&tipo=P&imagem=S");
        curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, TRUE);

        $response = curl_exec($curl_handle);

        curl_close($curl_handle);

        return $response;
    }
}