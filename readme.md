# E-commerce base

## Estrutura

* ## library
    * ### Email
        * ##### Configuration
            * ###### Configuration.php
        * ##### Sender
            * ###### Sender.php    
    * ### Payment
        * ##### Exceptions
        * ##### Logs
        * ##### PagSeguro
            * ###### Config
                * ###### PagSeguroConfig.php
            * ###### Payment
                * ###### Options
                    * ###### Boleto.php
                    * ###### CreditCard.php
                * ###### CreatePayment.php
                * ###### Payment.php
            * ###### Sender
                * ###### Sender.php
            * ###### Sensitive
                * ###### App.php
            
> ###### Para implementar um novo metódo de pagamento basta criar uma nova pasta dentro de Payment e configurar a api.            
            
## Exemplos de uso - PagSeguro

> ###### Acesse cada arquivo para visualizar os exemplos de como passar os dados.

### PagSeguroConfig.php
```php
    $config = new PagSeguroConfig("email","token");
    
    | Parâmetros 	| Presença    	| Padrão  	|
    |------------	|-------------	|---------	|
    | email      	| Obrigatório 	| ---     	|
    | token      	| Obrigatório 	| ---     	|
    | mode       	| Opcional    	| Sandbox 	|
    | charset    	| Opcional    	| UTF-8   	|
```               
### CreatePayment.php

```php
     $payment = new CreatePayment();
     $response = $payment->generatePayment($produtos,$hash,$user, $card, $urls, $frete);

    | Parâmetros 	| Presença                  	| Padrão 	|
    |------------	|---------------------------	|--------	|
    | produtos   	| Obrigatório               	| ---    	|
    | hash       	| Obrigatório               	| ---    	|
    | user       	| Obrigatório               	| ---    	|
    | card       	| Obrigatório (para cartão) 	| ---    	|
    | urls       	| Obrigatório               	| ---    	|
    | frete      	| Obrigatório               	| ---    	|
    | extra      	| Opcional                  	| 0      	|
```

> Documentação completa do PagSeguro com tabela de erros e exemplos de retorno: <br> https://devs.pagseguro.uol.com.br/docs/checkout-web-usando-a-sua-tela#section--a-name-retorno-a-retorno-da-api-do-checkout-transparente <br> https://devs.pagseguro.uol.com.br/docs/checkout-web-usando-a-sua-tela#section--a-name-tabela-erros-a-tabela-de-erros

##  Exemplos de uso - Email

> ###### Requer PHPMailer

### Sender.php
```php
    $email = new Sender();
    $email->De("example@example.com","Example");
    $email->Para("example2@example.com","");
    $email->Assunto("Example");
    $email->Mensagem("<b>Example</b>",true);    
    $email->Enviar();
    
    | Parâmetros 	| Presença                  	| Padrão 	|
    |------------	|---------------------------	|--------	|
    | email      	| Obrigatório               	| ---    	|
    | nome       	| Obrigatório                   | ---    	|
    | email       	| Obrigatório               	| ---    	|
    | nome       	| Opcional (deixe em "")    	| ---    	|
    | assunto   	| Obrigatório               	| ---    	|
    | mensagem    	| Obrigatório               	| ---    	|
    | HTML      	| Obrigatório                  	| ---    	|    
    
```

