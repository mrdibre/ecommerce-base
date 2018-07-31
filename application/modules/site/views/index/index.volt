<style>

    html,body{
        overflow-y: auto !important;
    }

    @media (max-width: 575.98px) {
        #primaryImage{
            max-height: 180px !important;
        }
        #secondaryImage{
            display: none;
        }
        #price{
            font-size: 20px !important;
        }
        #sectionBanners{
            height: auto !important;
        }
    }
</style>

<div id="content" class="site-content" tabindex="-1">

    <div class="woocommerce"></div>
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">

            <section id="sectionBanners" style="height: 600px;" class="site-slider-section conj-slider conj-slider-navigation-layout__group jarallax" data-speed="1" data-img-size="cover" data-img-position="50%" aria-label="Slider">
                <div class="row slides carousel" data-flickity='{ "wrapAround": true, "contain": true, "adaptiveHeight": true, "freeScroll": false, "friction": 0.3, "draggable": true, "autoPlay": 6000, "pauseAutoPlayOnHover": true, "prevNextButtons": true, "pageDots": true }'>

                    {% for banner in banners %}
                        <div id="slider-2185" class="carousel-cell">
                            <div class="col-full">
                                <div class="slider-image">
                                    <img id="primaryImage" style="max-height: 450px;" src="{{ url.getStatic() }}uploads/{{ banner.primaryImage }}" />
                                </div>
                                <div class="slider-content">
                                    <div class="content">
                                        <p id="secondaryImage">
                                           {% if banner.secondaryImage %}
                                               <img style="max-height: 150px;" src="{{ url.getStatic() }}uploads/{{ banner.secondaryImage }}" />
                                            {% endif %}
                                        </p>
                                        <h2>{{ banner.title }}
                                           {% if banner.price %}
                                               <br />Por apenas
                                               <strong id="price" style="color: #933693;font-weight: bold;font-size: 40px;">R$<?= number_format($banner->price,2,',','') ?></strong>
                                            {% endif %}
                                        </h2>
                                    </div>
                                    <div class="slider-btn">
                                        {% if banner.link %}
                                            <a href="{{ url.getBaseUri() }}{{ banner.link }}" class="button" target="_blank">Visualizar</a>
                                        {% endif %}
                                    </div>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                </div>
                <!-- .row.carousel -->
                <img src="{{ url.getStatic() }}icons/bannerprincipal.jpg" class="jarallax-img" />
            </section>

            <section class="site-wc-product-section conj-wc-top-rated-products" aria-label="Fan Favorites Products">
                <div class="col-full">
                    <h2 class="section-title">Últimos adicionados</h2>
                    <div class="row">
                        <div class="woocommerce columns-4 ">
                            <ul id="lastAdded" class="products columns-4">
                                {% for ultimo in ultimosadicionados %}
                                <li class="post-107 product type-product status-publish has-post-thumbnail product_cat-cameras product_cat-drones product_tag-mini product_tag-spark conj-wc-product__layout-default conj-hide-wc-product__categories conj-hide-wc-product__description last instock shipping-taxable purchasable product-type-variable has-default-attributes">
                                    <a href="{{ url.getBaseUri() }}produto/visualizacao/{{ ultimo._id }}" class="woocommerce-LoopProduct-link woocommerce-loop-product__link">
                                        <img class="product-image" style="max-height: 250px;" src="{{ url.getStatic() }}uploads/produtos/{{ ultimo.imagens[0] is defined ? ultimo.imagens[0] : 'sem-foto.gif' }}" />
                                        <h2 class="woocommerce-loop-product__title">{{ ultimo.nome }}</h2>
                                        <div class="conj-wc-product__flashs">
                                        </div>

                                        <span class="price">
                                            <span class="conj-wc-price__wrapper">
                                                <span class="woocommerce-Price-amount amount" style="font-weight: bold;font-size: 20px;">
                                                    <span class="woocommerce-Price-currencySymbol">R&#36;</span><?= number_format($ultimo->preco,2,',','') ?>
                                                </span>
                                            </span>
                                        </span>
                                    </a>
                                    {% if session.has("usuario") %}
                                        {% if  ultimo.estoque > 0 %}
                                            <a href="javascript:void(0);" class="button product_type_simple add_to_cart_button" data-product_quantity="1" data-product_id="{{ ultimo._id }}" data-product_name="{{ ultimo.nome }}" data-product_price="{{ ultimo.preco }}" data-product_image="{{ ultimo.imagens[0] is defined ? ultimo.imagens[0] : 'sem-foto.gif' }}" aria-label="Add &ldquo;{{ ultimo.nome }}&rdquo; to your cart" rel="nofollow">Adicionar ao carrinho</a>
                                            {% else %}
                                                <a href="javascript:void(0)" style="border-color: #933693; background-color: #FFF !important; ">
                                                    <del>Indisponível</del>
                                                </a>
                                        {% endif %}
                                    {% endif %}
                                </li>
                                {% endfor %}
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            <section class="site-wc-product-countdown-section conj-wc-product-countdown jarallax" data-jarallax="" data-speed="1" aria-label="On-Sale Product">
                <div class="col-full">
                    <div class="conj-wc-product-countdown__content">
                        <br><br>
                        <span class="conj-wc-product-countdown__badge">É SEGURO, RÁPIDO E FÁCIL</span>
                        <h3 class="conj-wc-product-countdown__heading">QUEM COMPRA COM A UDI POP DESCOBRE QUE O NOSSO NEGÓCIO É SATISFAZER NOSSOS CLIENTES.</h3>
                    </div>
                </div>
                <div id="jarallax-container-2" style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; overflow: hidden; pointer-events: none; z-index: -100;">
                    <img width="100%" height="1376" src="{{ url.getStatic() }}icons/fundo.jpg" style="object-fit: cover; object-position: 50% 50%; max-width: none; position: absolute; top: 0px; left: 0px; width: 100%; height: 591px; overflow: hidden; pointer-events: none; margin-top: 184.5px; transform: translate3d(0px, -184.5px, 0px);">
                </div>
            </section>

            <div class="conj-wc-product-countdown__product-img">
                <a href="javascript:void(0);" target="_self">
                    <img height="332" src="{{ url.getStatic() }}icons/sacolas.png" class="attachment-conj-countdown-product-image size-conj-countdown-product-image" alt="Product count down image" style="height: 300px !important;">
                </a>
            </div>

            <section class="site-product-widgets-section conj-wc-product-widgets" aria-label="Product Widgets">
                <div class="col-full">
                    <h2 class="section-title">PRODUTOS POR DEPARTAMENTO</h2>
                    <div class="row col-4">
                        {% for prod in depprods %}
                            {% if prod.produtos|length > 0 %}
                                <div class="widget woocommerce widget_products">
                                    <h2 class="widgettitle">{{ prod.nome }}</h2>
                                    <ul class="product_list_widget">
                                        {% for produto in prod.produtos %}
                                            <li>

                                                <a href="{{ url.getBaseUri() }}produto/visualizacao/{{ produto._id }}">
                                                    <img width="418" height="418" src="{{ produto.imagens[0] is defined ? url.getStatic()~'uploads/produtos/'~produto.imagens[0] : 'http://www.portoalegrow.com.br/Content/Images/sem-foto.gif' }}" />
                                                    <span class="product-title">{{ produto.nome }}</span>
                                                </a>

                                                <span class="conj-wc-price__wrapper">
                                                    <span class="woocommerce-Price-amount amount">
                                                        <span class="woocommerce-Price-currencySymbol">R&#36;</span><?= number_format($produto->preco,2,',','') ?>
                                                    </span>
                                                    <span class="price-label">Preço</span>
                                                </span>
                                            </li>
                                        {% endfor %}
                                    </ul>
                                </div>
                            {% endif %}
                        {% endfor %}
                    </div>
                </div>
            </section>

            <section class="site-services-section conj-services conj-services-layout__stacked" aria-label="Services">
                <div class="col-full">
                    <div class="row col-3">
                        <div class="service">
                            <div class="icon"><i class="feather-refresh-ccw"></i></div>
                            <div class="meta"><span>Devolução</span><span>90 Dias para devolução</span></div>
                        </div>
                        <div class="service">
                            <div class="icon"><i class="feather-credit-card"></i></div>
                            <div class="meta"><span>Pagamento seguro</span><span>SSL / Certificado de segurança</span></div>
                        </div>
                        <div class="service">
                            <div class="icon"><i class="feather-headphones"></i></div>
                            <div class="meta"><span>Suporte 24hrs</span><span>Suporte 24 h / 7 dias</span></div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="site-footer-bar jarallax" data-jarallax="" data-speed="1">
                <div class="col-full">
                    <div id="text-4" class="widget widget_text">
                        <span class="widget-title"></span>
                        <div class="textwidget">
                            <p></p>
                        </div>
                    </div>
                </div>
                <div id="jarallax-container-3" style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; overflow: hidden; pointer-events: none; z-index: -100;">
                    <img width="1200" height="659" src="{{ url.getStatic() }}icons/parallax.jpg" class="jarallax-img" alt="Footer bar Background" style="object-fit: cover; object-position: 50% 50%; max-width: none; position: absolute; top: 0px; left: 0px; width: 1353px; height: 510px; overflow: hidden; pointer-events: none; margin-top: 225px; transform: translate3d(0px, -225px, 0px);">
                </div>
            </section>

        </main>
    </div>

</div>

<style>
    .amp{
        height: 250px !important;
    }
</style>

<script>
    let imgs = document.querySelectorAll(".product-image")

    imgs.forEach(img => {
        if(img.height < 250){
            img.classList.add("amp")
        }
    })

</script>