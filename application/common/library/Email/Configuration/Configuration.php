<?php

namespace Icontrole\Library\Email\Configuration;

use PHPMailer\PHPMailer\PHPMailer;

class Configuration{

    /**
     * @var PHPMailer $mailer;
     */
    public $mailer;

    public function __construct(string $host, string $username, string $password, bool $smtp , string $secure = 'tls',string $charset = 'UTF-8'){

        try{

            $this->mailer = new PHPMailer(true);
            $this->mailer->Host = $host;
            $this->mailer->Username = $username;
            $this->mailer->Password = $password;
            $this->mailer->CharSet = $charset;
            $this->mailer->Port = 587;
            $this->mailer->SMTPAuth = $smtp;

            if($smtp) {
                $this->mailer->isSMTP();
                $this->mailer->SMTPSecure = $secure;
            }

        }
        catch(\Exception $exception){
            die("Mailer Error: ".$this->mailer->ErrorInfo);
        }

    }

}