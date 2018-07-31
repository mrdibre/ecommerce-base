<style>
    input[type=number]::-webkit-inner-spin-button,
    input[type=number]::-webkit-outer-spin-button {
        width: 80% !important;
        -webkit-appearance: default-button;
    }
</style>

<div id="content" class="site-content" tabindex="-1">
    <div class="conj-col__full">
        <nav class="woocommerce-breadcrumb">
            <a href="{{ url.getBaseUri() }}">Home</a>
            {% if produto.departamento["nome"] %}
                <span class="breadcrumb-separator"> / </span>
                <a href="{{ url.getBaseUri() }}busca?departamento={{ produto.departamento["nome"] }}">{{ produto.departamento["nome"] }}</a>
                {% if produto.departamento["categoria"]["nome"] %}
                    <span class="breadcrumb-separator"> / </span>
                    <a href="{{ url.getBaseUri() }}busca?departamento={{ produto.departamento["nome"] }}&categoria={{ produto.departamento["categoria"]["nome"] }}">{{ produto.departamento["categoria"]["nome"] }}</a>
                    {% if produto.departamento["categoria"]["subcategoria"] %}
                        <span class="breadcrumb-separator"> / </span>
                        <a href="{{ url.getBaseUri() }}busca?departamento={{ produto.departamento["nome"] }}&categoria={{ produto.departamento["categoria"]["nome"] }}&subcategoria={{ produto.departamento["categoria"]["subcategoria"] }}">{{ produto.departamento["categoria"]["subcategoria"] }}</a>
                    {% endif %}
                {% endif %}
            {% endif %}
            <span class="breadcrumb-separator"> / </span> {{ produto.nome }}
        </nav>
        <div class="woocommerce"></div>
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">
                <div class="post-99 product type-product status-publish has-post-thumbnail product_cat-tvs product_cat-refurbished-tvs product_tag-hdr product_tag-hdtv
                product_tag-refurbished conj-wc-product__layout-default conj-hide-wc-product__categories conj-hide-wc-product__description first instock sale shipping-taxable purchasable
                product-type-simple">
                    <div id="productImages" class="woocommerce-product-gallery woocommerce-product-gallery--with-images woocommerce-product-gallery--columns-5 images" data-columns="5" style="opacity: 1; transition: opacity 0.25s ease-in-out;">
                        <div class="flex-viewport" style="overflow: hidden; position: relative; height: 626px;">
                            <figure class="woocommerce-product-gallery__wrapper" style="width: 1000%; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                <div class="woocommerce-product-gallery__image flex-active-slide" data-thumb-alt="" style="width: 576px; margin-right: 0px; float: left; display: block; position: relative; overflow: hidden;">
                                    {% if produto.imagens|length > 0 %}
                                        <a href="javascript:void(0);">
                                            <img id="mainimageproduct" width="670" height="670" src="{{ url.getStatic()~'uploads/produtos/'~produto.imagens[0] }}" class="wp-post-image" alt="Imagem de {{ produto.nome }}" title="{{ produto.nome }}" draggable="false">
                                        </a>
                                    {% else %}
                                        <a href="javascript:void(0);">
                                            <img id="mainimageproduct" width="670" height="670" src="{{ url.getStatic() }}uploads/produtos/sem-foto.gif" class="wp-post-image" alt="Imagem de {{ produto.nome }}" title="{{ produto.nome }}" draggable="false">
                                        </a>
                                    {% endif %}
                                </div>
                            </figure>
                        </div>
                        {% if produto.imagens|length > 0 %}
                            <ol class="flex-control-nav flex-control-thumbs">
                                {% for imagem in produto.imagens %}
                                    <li>
                                        <img src="{{ url.getStatic()~'uploads/produtos/'~ imagem }}" class="flex-active image-thumb" draggable="false">
                                    </li>
                                {% endfor %}
                            </ol>
                        {% endif %}
                    </div>
                    <div class="summary entry-summary" id="receiveHeight">
                        <h1 class="product_title entry-title">{{ produto.nome }}</h1>
                        <div class="woocommerce-product-rating">
                            <div class="star-rating">
                                <span style="width:{{ (produto.avaliacao * 100) / 5 }}%">Avaliado em
                                    <strong class="rating">{{ produto.avaliacao }}</strong> de 5
                                </span>
                            </div>
                        </div>
                        <p class="price">
							<span class="conj-wc-price__wrapper">
									<b style="color: #333333;font-size: 40px !important;">
                                        <span class="woocommerce-Price">
										    <span class="woocommerce-Price-currencySymbol">R$</span><?= number_format($produto->preco,2,',','') ?>
									    </span>
                                    </b>
								<span class="price-label">Preço</span>
							</span>
                        </p>
                        <div class="woocommerce-product-details__short-description">

                            <legend>Simule o frete</legend>

                            <form id="calculateFreight" data-id="{{ produto._id }}">

                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label for="cep_user">CEP<span class="required">*</span></label>
                                    <input required type="text" maxlength="9" class="woocommerce-Input woocommerce-Input--password input-text" name="cep_user" id="cep_user" autocomplete="off">
                                </p>

                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label for="quantity_selected">Quantidade<span class="required">*</span></label>
                                    <input required type="number" step="1" min="1" value="1" class="woocommerce-Input woocommerce-Input--password input-text" name="quantity_selected" id="quantity_selected" autocomplete="off">
                                </p>

                                <p>
                                    <button type="submit" id="calculate" class="button" name="save_account_details" value="Calculate">Calcular</button>
                                    <small><a href="http://www.buscacep.correios.com.br/sistemas/buscacep/" target="_blank">Não sei meu CEP</a></small>
                                    <p id="log_calculate"></p>
                                </p>

                            </form>

                            <ul id="append_freight"></ul>

                        </div>

                        {% if produto.estoque === 0 %}
                            <h1 class="stock in-stock" style="color: #d02828d6;text-align: center;">Produto indisponível</h1>
                        {% else %}
                            {% if session.has("usuario") %}
                                <p class="stock in-stock" id="max_stock" data-stock="{{ produto.estoque }}">{{ produto.estoque }} em estoque</p>
                                <form class="cart">
                                    <div class="quantity">
                                        <label class="screen-reader-text" for="quantity_5b46377fb262a">Quantidade</label>
                                        <input type="number" class="input-text qty" step="1" min="1" max="{{ produto.estoque }}" name="quantity" value="1" title="Quantidade" size="4"
                                               pattern="[0-9]*" inputmode="numeric" aria-labelledby="" id="qtd_cart">
                                    </div>
                                    <button type="submit" id="addToCart" name="add-to-cart" value="1" data-product_quantity="1" data-product_id="{{ produto._id }}" class="add_to_cart_button button alt">COMPRAR</button>
                                {% else %}
                                    <form action="" class="cart">
                                        <a href="{{ url.getBaseUri() }}autenticacao?redirect=produto/visualizacao/{{ produto._id }}" class="button alt">COMPRAR</a>
                                    </form>
                                {% endif %}
                                </form>
                        {% endif %}
                        {% if produto.tags|length > 0 %}
                            <div class="product_meta">
                                <span class="tagged_as">Tags:
                                    {% for tag in produto.tags%}
                                        <a href="javascript:void(0);" rel="tag">{{ tag }}</a>
                                    {% endfor %}
                                </span>
                            </div>
                        {% endif %}
                    </div>

                    <div class="conj-wc-product-sharing">
                        <aside style="">
                            <p>
                                {{ produto.descricao ? produto.descricao : "" }}
                            </p>
                        </aside>
                    </div>

                    {% if produto.fichatecnica|length > 0 %}
                        <div class="woocommerce-tabs wc-tabs-wrapper">
                            <ul class="tabs wc-tabs" role="tablist">
                                <li class="description_tab active" id="tab-title-description" role="tab" aria-controls="tab-description">
                                    <a href="#fichatecnica">Ficha técnica</a>
                                </li>
                            </ul>
                            <div class="woocommerce-Tabs-panel woocommerce-Tabs-panel--description panel entry-content wc-tab" id="tab-description" role="tabpanel" aria-labelledby="tab-title-description" style="display: block;">

                                {% if produto.fichatecnica|length > 0 %}
                                   <?php if( gettype($produto->fichatecnica) !== "array" ){ ?>
                                        <dl>
                                            {% for item in produto.fichatecnica %}
                                                {% for especificacao,valor in item %}
                                                    <dt>{{ especificacao }}</dt>
                                                    <dd>{{ valor }}</dd>
                                                {% endfor %}
                                            {% endfor %}
                                        </dl>
                                   <?php } else{ ?>
                                        <dl>
                                            {% for especificacao,valor in produto.fichatecnica %}
                                                <dt>{{ especificacao }}</dt>
                                                <dd>{{ valor }}</dd>
                                            {% endfor %}
                                        </dl>
                                   <?php } ?>
                                {% endif %}

                            </div>
                        </div>
                    {% endif %}

                    {% if vinculados["produtos"]|length > 0%}
                        <section class="related products">
                            <h2>Compre também</h2>
                            <ul class="products columns-4">
                                {% for vinculado in vinculados["produtos"] %}
                                    <li class="post-104 product type-product status-publish has-post-thumbnail product_cat-tablets-ipads product_cat-android product_tag-healthcare product_tag-navigator product_tag-refurbished conj-wc-product__layout-default conj-hide-wc-product__categories conj-hide-wc-product__description first instock sale shipping-taxable purchasable product-type-simple">
                                        <a href="{{ url.getBaseUri() }}produto/visualizacao/{{ vinculado.id }}" class="woocommerce-LoopProduct-link woocommerce-loop-product__link">
                                            <img width="418" height="418" src="{{ vinculado.imagem }}">
                                            <h2 class="woocommerce-loop-product__title">{{ vinculado.nome }}</h2>
                                            <span class="price">
												<span class="conj-wc-price__wrapper">
													<ins>
														<span class="woocommerce-Price-amount amount">
															<span class="woocommerce-Price-currencySymbol">R$</span>{{ vinculado.preco }}
														</span>
													</ins>
													<span class="price-label">Preço</span>
												</span>
											</span>
                                            {% if session.has("usuario") %}
                                                <a href="javascript:void(0);" class="button product_type_simple add_to_cart_button" data-product_quantity="1" data-product_id="{{ vinculado.id }}" aria-label="Add &ldquo;{{ vinculado.nome }}&rdquo; to your cart" rel="nofollow">Adicionar ao carrinho</a>
                                            {% endif %}
                                        </a>
                                    </li>
                                {% endfor %}
                            </ul>
                        </section>
                    {% endif %}

                    <nav class="conj-wc-single-product-pagination" id="cart-nav" aria-label="Carrinho" style="display: none;">
                        <a href="{{ url.getBaseUri() }}carrinho" rel="next">
                            <img src="{{ url.getStatic() }}icons/bag.png" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="Carrinho" style="width: 50px;">
                            <span class="title">Carrinho</span>
                        </a>
                    </nav>

                </div>
            </main>
        </div>
    </div>
</div>

<script>
    document.querySelector("body").className = "product-template-default single single-product postid-99 logged-in custom-background woocommerce woocommerce-page woocommerce-demo-store woocommerce-js conj-has-social__menu conj-has-secondary__menu has-sidebar woocommerce-running conj-header-logo__left conj-social-menu__left conj-secondary-menu__right conj-primary-menu__left left-sidebar conj-copyright-content__left conj-wc-details-no-sidebar"

    let images = document.querySelectorAll(".image-thumb")

    images.forEach(image => {
        image.classList.remove("flex-active")
        image.addEventListener("click",function(){
            removeClass(images)
            preview( image.getAttribute("src") )
            image.classList.add("flex-active")
        })
    })

    function preview(image) {
        document.getElementById("mainimageproduct").setAttribute("src",image)
    }

    function removeClass(els) {
        els.forEach(el => el.classList.remove("flex-active"))
    }

</script>

<style>

    html,body{
        overflow-y: auto !important;
    }

    @media (max-width: 575.98px) {
        .flex-viewport{
            height: auto !important;
        }
        #mainimageproduct{
            width: 50%;
            float: left;
        }
        #receiveHeight{
            height: auto;
        }
        html,body{
            overflow-y: auto !important;
        }
    }
</style>