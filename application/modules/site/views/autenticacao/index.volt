<div id="content" class="site-content" tabindex="-1">

    <div class="conj-col__full">
        <nav class="woocommerce-breadcrumb">
            <a href="{{ url.getBaseUri() }}">Home</a>
            <span class="breadcrumb-separator"> / </span>Autenticação
        </nav>
        <div class="woocommerce"></div>
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">

                <article id="post-28" class="post-28 page type-page status-publish hentry">

                    <div class="entry-content">
                        <div class="woocommerce">

                            <div class="u-columns col2-set" id="customer_login">

                                <div class="u-column1 col-1">

                                    {{ flashSession.output() }}

                                    <h2>LOGIN</h2>

                                    <form class="woocommerce-form woocommerce-form-login" id="login-form" method="post">

                                        <div style="display: none;" class="woocommerce-message woocommerce-message--error woocommerce-Message woocommerce-Message--error woocommerce-error" id="handler_error_login"></div>

                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                            <label for="username">Email&nbsp;<span class="required">*</span></label>
                                            <input type="email" class="woocommerce-Input woocommerce-Input--text input-text" name="email" id="log_email" autocomplete="email" value="">
                                        </p>
                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                            <label for="password">Senha&nbsp;<span class="required">*</span></label>
                                            <input class="woocommerce-Input woocommerce-Input--text input-text" type="password" name="password" id="log_password" autocomplete="current-password">
                                        </p>

                                        <p class="form-row">
                                            <input type="hidden" id="woocommerce-login-nonce" name="woocommerce-login-nonce" value="b45d809660">
                                            <input type="hidden" name="_wp_http_referer" value="/electronic-store/my-account/">
                                            <button type="submit" class="woocommerce-Button button" name="login" value="Log in">Entrar</button>
                                            <small id="msgForUserWait" style="display: none;">Verificando dados...</small>
                                        </p>
                                        <p class="woocommerce-LostPassword lost_password" style="background-color: transparent;">
                                            <a href="{{ url.getBaseUri() }}recv">Esqueci minha senha</a>
                                        </p>

                                    </form>

                                </div>

                                <div class="u-column2 col-2">

                                    <h2>CADASTRO</h2>

                                    <form method="post" class="woocommerce-form woocommerce-form-register register" id="register-form">

                                        <div style="display: none;" class="woocommerce-message woocommerce-message--error woocommerce-Message woocommerce-Message--error woocommerce-error" id="handler_error_register"></div>

                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                            <label for="reg_email">Email&nbsp;<span class="required">*</span></label>
                                            <input type="email" class="woocommerce-Input woocommerce-Input--text input-text" name="email" id="reg_email" autocomplete="email" value="">
                                        </p>

                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                            <label for="reg_password">Senha&nbsp;<span class="required">*</span></label>
                                            <input type="password" class="woocommerce-Input woocommerce-Input--text input-text" name="password" id="reg_password" autocomplete="new-password">
                                        </p>

                                        <p>
                                            <button type="submit" class="woocommerce-Button button" name="register" value="Register">Cadastrar</button>
                                        </p>

                                    </form>

                                </div>

                            </div>

                        </div>
                    </div>

                </article>
            </main>
        </div>

    </div>

</div>

<script>
    document.querySelector("body").className = "page-template page-template-page-templates page-template-template-fluid page-template-page-templatestemplate-fluid-php page page-id-28 custom-background woocommerce-account woocommerce-page woocommerce-demo-store woocommerce-js conj-has-social__menu conj-has-secondary__menu has-sidebar woocommerce-running conj-header-logo__left conj-social-menu__left conj-secondary-menu__right conj-primary-menu__left left-sidebar conj-copyright-content__left"
</script>

{{ assets.outputJs() }}