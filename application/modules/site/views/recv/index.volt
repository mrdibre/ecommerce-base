<div id="content" class="site-content" tabindex="-1">

    <div class="conj-col__full" style="display: block;">
        <nav class="woocommerce-breadcrumb">
            <a href="{{ url.getBaseUri() }}">Home</a>
            <span class="breadcrumb-separator"> / </span>Recuperar senha
        </nav>
        <div class="woocommerce"></div>
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">

                <article id="post-28" class="post-28 page type-page status-publish hentry">

                    <div class="entry-content">
                        <div class="woocommerce">

                            <div class="u-columns col2-set" id="customer_login">

                                <div class="u-column1 col-1">

                                    <h2>RECUPERAR SENHA</h2>

                                    <form class="woocommerce-form woocommerce-form-login" id="recv-form" method="post">

                                        <div style="display: none;" class="woocommerce-message woocommerce-message--info woocommerce-Message woocommerce-Message--info woocommerce-info" id="handler_info"></div>

                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                            <label for="username">Email&nbsp;<span class="required">*</span></label>
                                            <input type="email" class="woocommerce-Input woocommerce-Input--text input-text" name="email" id="recv_email" autocomplete="email" value="">
                                        </p>

                                        <p class="form-row">
                                            <button type="submit" class="woocommerce-Button button" name="login" value="Log in">Entrar</button>
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

{{ assets.outputJs() }}