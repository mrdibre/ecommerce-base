<div id="content" class="site-content" tabindex="-1">

    <div class="conj-col__full">
        <nav class="woocommerce-breadcrumb">
            <a href="{{ url.getBaseUri() }}">Home</a>
            <span class="breadcrumb-separator"> / </span>
            <a href="{{ url.getBaseUri() }}conta">Minha conta</a>
        </nav>
        <div class="woocommerce"></div>
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">

                <article id="post-28" class="post-28 page type-page status-publish hentry">

                    <div class="entry-content">
                        <div class="woocommerce">
                            <nav class="woocommerce-MyAccount-navigation">
                                <ul>
                                    <li data-active="/conta" class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard">
                                        <a href="{{ url.getBaseUri() }}conta">Dashboard</a>
                                    </li>
                                    <li data-active="/conta/pedidos" class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
                                        <a href="{{ url.getBaseUri() }}conta/pedidos">Pedidos</a>
                                    </li>
                                    <li data-active="/conta/detalhes" class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--downloads">
                                        <a href="{{ url.getBaseUri() }}conta/detalhes">Detalhes</a>
                                    </li>
                                    <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--customer-logout">
                                        <a href="{{ url.getBaseUri() }}conta/logout">Sair</a>
                                    </li>
                                </ul>
                            </nav>

                            <div class="woocommerce-MyAccount-content">
                                {{ content() }}
                            </div>
                        </div>
                    </div>

                </article>
            </main>
        </div>

    </div>

</div>

<script>
    document.querySelector("body").className = "page-template page-template-page-templates page-template-template-fluid page-template-page-templatestemplate-fluid-php page page-id-28 logged-in custom-background woocommerce-account woocommerce-page woocommerce-demo-store woocommerce-js conj-has-social__menu conj-has-secondary__menu has-sidebar woocommerce-running conj-header-logo__left conj-social-menu__left conj-secondary-menu__right conj-primary-menu__left left-sidebar conj-copyright-content__left"

    if(window.location.pathname.indexOf("/conta/pedido/") > -1){

        let path = window.location.pathname.split("/").pop()

        let span = document.createElement("span")
        span.classList.add("breadcrumb-separator")
        span.innerHTML = "/&nbsp;&nbsp;&nbsp;&nbsp;Pedido&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;"+path

        document.querySelector(".woocommerce-breadcrumb").appendChild(span)
    }
    else{
        document.querySelectorAll("ul li").forEach(el => {
            if(el.dataset.active === window.location.pathname){
                el.classList.add("is-active")
                if(el.dataset.active !== "/conta"){

                    let path = el.dataset.active.split("/")[2]
                    path = path.charAt(0).toUpperCase()+path.substring(1)

                    let span = document.createElement("span")
                    span.classList.add("breadcrumb-separator")
                    span.innerHTML = "/ &nbsp;&nbsp;&nbsp;&nbsp;"+path

                    document.querySelector(".woocommerce-breadcrumb").appendChild(span)
                }
            }
        })
    }
</script>