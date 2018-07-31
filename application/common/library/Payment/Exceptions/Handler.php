<?php

namespace Icontrole\Library\Payment\PagSeguro\Exceptions;

use Throwable;

class Handler extends \Exception {

    public function __construct(string $message = "", int $code = 0, Throwable $previous = null)
    {
        parent::__construct($message, $code, $previous);
    }

}