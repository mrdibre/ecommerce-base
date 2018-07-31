<?php
namespace Icontrole\Library\Email\Sender;

use Icontrole\Library\Email\Configuration\Configuration;
use PHPMailer\PHPMailer\Exception;

class Sender extends Configuration {

    /**
     * Sender constructor.
     */
    public function __construct(){
        parent::__construct(
            "smtp.gmail.com",
            "udipop@udipop.com.br",
            "2018udip",
            true,
            "tls",
            "UTF-8"
        );
    }

    /**
     * @param string $email
     * @param string $nome
     */
    public function Para(string $email, string $nome){
        $this->mailer->addAddress($email,$nome);
    }

    /**
     * @param string $email
     * @param string $nome
     */
    public function De(string $email, string $nome){
        try {
            $this->mailer->setFrom($email, $nome);
        } catch (Exception $e) {
            die($e->errorMessage());
        }
    }

    /**
     * @param string $assunto
     */
    public function Assunto(string $assunto){
        $this->mailer->Subject = $assunto;
    }

    /**
     * @param string $msg
     * @param bool $HTML
     *
     */
    public function Mensagem( string $msg, bool $HTML){
        $this->mailer->Body = $msg;
        $this->mailer->isHTML($HTML);
    }

    /**
     * @return string
     */
    public function Enviar(){

        try {
            if ($this->mailer->send()) {
                return "Mensagem enviada";
            } else {
                return "Erro ao enviar mensagem: ".$this->mailer->ErrorInfo;
            }
        } catch (Exception $e) {
            return $e->errorMessage();
        }

    }

}
