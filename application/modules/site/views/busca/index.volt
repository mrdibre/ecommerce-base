<div id="content" class="site-content" tabindex="-1">

    <div class="conj-col__full">
        <nav class="woocommerce-breadcrumb">
            <a href="{{ url.getBaseUri() }}">Home</a>
            <span class="breadcrumb-separator"> / </span>
            <a href="javascript:void(0);">busca</a>
            <span class="breadcrumb-separator"> / </span>Resultados para "{{ busca }}"
        </nav>
        <div class="woocommerce"></div>
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">
                <header class="woocommerce-products-header"></header>

                {% if produtos|length === 0 %}
                    <hgroup>
                        <h1>Nenhum produto encontrado</h1>
                        <h3>Voltar a <a href="{{ url.getBaseUri() }}">loja.</a></h3>
                    </hgroup>
                    {% else %}
                        <div class="conj-wc-product-columns archive-columns-3">
                            <ul class="products columns-3">
                                {% for produto in produtos %}
                                    <li class="post-110 product type-product status-publish has-post-thumbnail product_cat-laptops product_cat-gaming product_tag-gaming product_tag-windows conj-wc-product__layout-default conj-hide-wc-product__categories conj-hide-wc-product__description first outofstock shipping-taxable purchasable product-type-simple" style="float: left;">
                                        <a href="{{ url.getBaseUri() }}produto/visualizacao/{{ produto._id }}" class="woocommerce-LoopProduct-link woocommerce-loop-product__link">
                                            <img class="product-image"
                                                 src="{{ url.getStatic() }}uploads/produtos/{{ produto.imagens[0] is defined ? produto.imagens[0] : 'sem-foto.gif' }}" style="max-height: 250px;">
                                            <h2 class="woocommerce-loop-product__title">{{ produto.nome }}</h2>
                                            <div class="star-rating">
                                                <span style="width:{{ (produto.avaliacao * 100) / 5 }}%">Avaliado em
                                                    <strong class="rating">{{ produto.avaliacao }}</strong> de 5
                                                </span>
                                            </div>
                                            <span class="price">
                                                <span class="conj-wc-price__wrapper">
                                                    <span class="woocommerce-Price-amount amount">
                                                        <span class="woocommerce-Price-currencySymbol">R$</span><?= number_format($produto->preco,2,',','') ?>
                                                    </span>
                                                    <span class="price-label">Preço</span>
                                                </span>
                                            </span>
                                        </a>
                                        <a href="{{ url.getBaseUri() }}produto/visualizacao/{{ produto._id }}" class="button product_type_simple add_to_cart_button ajax_add_to_cart" data-product_id="{{ produto._id }}" aria-label="{{ produto.nome }}”" rel="nofollow">Add to cart</a>
                                    </li>
                                {% endfor %}
                            </ul>
                        </div>
                {% endif %}

            </main>
        </div>

        <aside id="secondary" class="widget-area" role="complementary" itemscope="itemscope" itemtype="https://schema.org/WPSideBar">
            <div class="conj-secondary-widget-area__wrapper conj-secondary-widget-area__sticky">
                <div id="woocommerce_product_categories-2" class="widget woocommerce widget_product_categories"><span class="widget-title">DEPARTAMENTOS</span>
                    <ul class="product-categories" style="">
                        {% for departamento in (departamentosfiltro is defined ? departamentosfiltro : departamentos) %}
                            <li class="cat-item cat-item-156 cat-parent">
                                <a href="{{ url.getBaseUri() }}busca?departamento={{ departamento.nome }}">{{ departamento.nome }}</a>
                                {% if departamento.categorias %}
                                    <ul class="children">
                                        {% for categoria in departamento.categorias %}
                                            <li class="cat-item cat-item-157">
                                                <a href="{{ url.getBaseUri() }}busca?departamento={{ departamento.nome }}&categoria={{ categoria["nome"] }}">{{ categoria["nome"] }}</a>
                                                {% if categoria["subcategorias"] %}
                                                    <ul class="children">
                                                        {% for subcategoria in categoria["subcategorias"] %}
                                                            <li>
                                                                <a href="{{ url.getBaseUri() }}busca?departamento={{ departamento.nome }}&categoria={{ categoria["nome"] }}&subcategoria={{ subcategoria }}">{{ subcategoria }}</a>
                                                            </li>
                                                        {% endfor %}
                                                    </ul>
                                                {% endif %}
                                            </li>
                                        {% endfor %}
                                    </ul>
                                {% endif %}
                            </li>
                        {% endfor %}
                    </ul>
                </div>
                <div id="woocommerce_product_tag_cloud-2" class="widget woocommerce widget_product_tag_cloud">
                    <span class="widget-title">TAGS</span>
                    <div class="tagcloud" style="">
                        {% for index,t in tags %}
                            <a href="javascript:void(0);" data-tag="{{ t.nome }}" class="tags tag-cloud-link tag-link-153 tag-link-position-21" style="font-size: 15pt;" aria-label="{{ t.nome }}">{{ t.nome }}</a>
                        {% endfor %}
                    </div>
                </div>
            </div>
        </aside>
    </div>
</div>

<style>
    .in-url{
        background-color: #00000087 !important;
        color: #FFF !important;
    }
    .conj-col__full{
        max-width: 90% !important;
    }
    .amp{
        height: 250px !important;
    }
</style>

<script>

    window.onload = function(){

        let tags = document.querySelectorAll(".tags");

        tags.forEach(tag => {

            tag = checkIfInUrl(tag)

            tag.addEventListener("click",function(){

                if(tag.classList.contains("in-url")){

                    let foundtags = window.location.search.split("&")
                    let nottags = foundtags.filter(x => x.indexOf("tag") === -1).join("&")

                    foundtags = foundtags.filter(x => {

                        let reg = new RegExp(`tag([0-9]|)=${tag.dataset.tag}`);

                        if(reg.test(x)){}

                        return x.replace(reg,"")

                    }).join("&")

                    window.location = foundtags
                }
                else{
                    let foundtags = window.location.search.split("&")
                    let nottags = foundtags.filter(x => x.indexOf("tag") === -1).join("&")
                    let i = 0

                    foundtags = foundtags.filter(x => x.indexOf("tag") >= 0)

                    foundtags = foundtags.map((ftag,index) => {
                        i = index+1
                        let split = ftag.split("=")

                        return `&${[(split[0])]}=${split[1]}`
                    }).join("")

                    let search = nottags+foundtags+`&tag${ i+1 }=`+tag.dataset.tag
                    window.location = window.location.pathname+search
                }

            },false)
        })

        let imgs = document.querySelectorAll(".product-image")

        imgs.forEach((img,index) => {
            let h = img.height
            if(h < 250){
                img.classList.add("amp")
            }
        })

        function checkIfInUrl(tag){
            let inUrl = window.location.search.indexOf("="+tag.dataset.tag)
            if(inUrl >= 0){
                tag.classList.add("in-url")
            }

            return tag

        }

    }

</script>