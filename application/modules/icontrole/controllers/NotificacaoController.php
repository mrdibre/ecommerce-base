<?php

namespace Icontrole\Icontrole\Controllers;

use Icontrole\Library\Email\Sender\Sender;
use Icontrole\Library\Payment\PagSeguro\Notification\Notification;

class NotificacaoController extends BaseController {

    public function indexAction(){

        header("access-control-allow-origin: https://sandbox.pagseguro.uol.com.br");

        $notificacao = new Notification();

        if($notificacao->isCanSendEmail()){

            $response = $notificacao->getResponse();

            $email = new Sender();
            $email->De("udipop@udipop.com.br","UDIPOP");
            $email->Para("cesar.felp982@gmail.com","César Felipe");
            $email->Assunto("UDIPOP - Atualização de status");
            $email->Mensagem($this->template($response->id,$response->status,$response->referencia),true);

            $envio = $email->Enviar();

            if($envio === "Mensagem enviada"){
                die("Atualizado com sucesso");
            }
            else{
                die($envio);
            }

        }
        else{
            die(
                print_r(
                    $notificacao->getResponse()
                )
            );
        }

    }

    /**
     * @return string
     */
    public function template($idpedido,$statuspedido,$referencia){

        $urlpedido = $this->url->getBaseUri()."conta/pedido/".$idpedido;
        $assets = $this->url->getStatic()."/icons/udipop.png";

        return "
           <div style=\"margin:0px;padding:0px;font-family:Proxima Nova,Helvetica,Arial,sans-serif\">
                <table class=\"m_6539984295528540449table-grey\" width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-top:12px;padding-bottom:12px;min-width:320px;text-align:center;\">
                    <tbody>
                    <tr>
                        <td>
                            <table border=\"0\" valign=\"top\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:600px;width:100%;border: 1px solid rgba(0,0,0,.1);\">
                                <tbody>
                                <tr>
                                    <td>
                                        <table border=\"0\" valign=\"top\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#FFFFFF\" style=\"max-width:600px;width:100%\">
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">
                                                        <tbody>
                                                        <tr>
                                                            <td class=\"m_6539984295528540449logo\" align=\"left\" style=\"display:none!important;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;max-width:0px;opacity:0;overflow:hidden\"></td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">
                                                        <tbody>
                                                        <tr>
                                                            <td class=\"m_6539984295528540449logo\" align=\"left\" style=\"padding:15px 20px 15px 14px\">
                                                                <a href=\"udipop.com.br/2018/\" target=\"_blank\">
                                                                    <img src=\"udipop.com.br/2018/assets/icons/udipop.png\" alt=\"UDIPOP logo\" height=\"36\" width=\"138\" class=\"CToWUd\">
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#0DB478\" align=\"center\">
                                                        <tbody>
                                                        <tr>
                                                            <td>
                                                                <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#652380\" align=\"center\" style=\"max-width:768px\">
                                                                    <tbody>
                                                                    <tr class=\"m_6539984295528540449title\">
                                                                        <td align=\"center\" style=\"font-family:Proxima Nova,Helvetica,Arial,sans-serif;font-weight:300;color:#ffffff;line-height:26px;font-size:22px;padding:50px 15% 50px\">
                                                                            <p>Status do pedido atualizado</p>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#FFFFFF\" style=\"color:#333;font-size:16px;line-height:21px;padding:0 20% 48px\">
                                                        <tbody>
                                                        <tr class=\"m_6539984295528540449info\">
                                                            <td class=\"m_6539984295528540449no-link\" align=\"center\" style=\"padding-top:48px\">
                                                                Informamos que o seu pedido $referencia.
                                                                <br>
                                                                <br>  Foi atualizado para \"<b>$statuspedido</b>\".
                                                                <br>
                                                                <br>
                                                                <a class=\"m_6539984295528540449ticket_number\" href=\"udipop.localhost/conta/pedido/$idpedido\" style=\"text-decoration: none;color: #652380;\" target=\"_blank\">
                                                                    Visualize seu pedido aqui
                                                                </a>
                                                                <br>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <img width=\"1\" height=\"1\" border=\"0\" style=\"display:none!important;opacity:0!important\" src=\"https://ci6.googleusercontent.com/proxy/-lxHbnEed2INWFJRy09CXH9qHh6S3WckOSdEAAG9rR9Z1ypUTfVTCR99YuuqA4dQagnby0s_2uSfhDq_Umwzf6oJozXXLh8_LnsECyOn-3yyNVADCgnrFLhY6mwUrcyHR05AKQeNkNq0I6-pcWkviOMxOwJcJmSG-nD998lt12yc8rtxUlsOFVn-k5O4uYLzG6XQ8xftSBVOkRFIutRFBwn2lS0z903RyYHiordQMi3mChUJNYJfbhVvSmFzOB6InaS2DiPmtAWY6_yVrQvA2LKelMkWz8bY5Ai7CPsHj49nb_Kg5IYkSGLo1N1hz_MH468fBUAdDsz31AfPmWlNLsPfbrK6FBoW6d38ZcmRp7rRu0f1LPwT9jCkZrQy4WpIM6SlhWGyJVBMAdVSEA=s0-d-e1-ft#https://www.mercadolibre.com.ar/gz/emails/pixel?email_id=14431764495&amp;email_template=WI_SIMPLE_EMAIL&amp;user_id=244434092&amp;email_address=cesar.felp982@gmail.com&amp;site_id=MLA&amp;sent_date=2018-07-06T18:22:14.460-04:00&amp;v=2&amp;business=mercadopago&amp;hash=0b1ad9173884efb972a7fb06a166f36d543f9d3c\" class=\"CToWUd\">
            </div>
                    ";
    }

}