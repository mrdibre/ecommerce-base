<div id="content" class="site-content" tabindex="-1">
    <div class="conj-col__full">
        <nav class="woocommerce-breadcrumb">
            <a href="{{ url.getBaseUri() }}">Home</a>
            <span class="breadcrumb-separator"> / </span>Carrinho
        </nav>
        <div class="woocommerce"></div>
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">
                <article id="post-26" class="post-26 page type-page status-publish hentry">
                    <div class="entry-content">
                        <div class="woocommerce">
                            <form class="woocommerce-cart-form" method="post">
                                <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th class="product-remove">&nbsp;</th>
                                        <th class="product-thumbnail">&nbsp;</th>
                                        <th class="product-name">Produto</th>
                                        <th class="product-price">Preço</th>
                                        <th class="product-quantity">Quantidade</th>
                                        <th class="product-subtotal">Total</th>
                                    </tr>
                                    </thead>
                                    <tbody id="rans3d">
                                    {% for item in carrinho %}
                                        <tr class="woocommerce-cart-form__cart-item cart_item tr-item-{{ item['_id'] }}">
                                            <td class="product-remove">
                                                <a href="javascript:void(0);" class="remove removeItemFromCart" aria-label="Remover item" data-id="{{ item["_id"] }}">×</a>
                                            </td>
                                            <td class="product-thumbnail">
                                                <a href="{{ url.getBaseUri() }}produto/visualizacao/{{ item["_id"] }}">
                                                    <img width="418" height="418" src="{{ url.getStatic() }}uploads/produtos/{{ item["imagem"] }}" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail wp-post-image" alt="{{ item["nome"] }}">
                                                </a>
                                            </td>
                                            <td class="product-name" data-title="Produto">
                                                <a href="{{ url.getBaseUri() }}produto/visualizacao/{{ item["_id"] }}">{{ item["nome"] }}</a>
                                            </td>
                                            <td class="product-price" data-title="Preço">
                                            <span class="woocommerce-Price-amount amount">
                                                R$<span class="woocommerce-Price-currencySymbol">
                                                    <?= number_format($item['preco'],2,',','') ?>
                                                </span>
                                            </span>
                                            </td>
                                            <td class="product-quantity" data-title="Quantidade">
                                                <div class="quantity buttons_added">
                                                    <input type="button" value="-" data-target="{{ item["_id"] }}" class="conj-wc-qty-btn__minus ctrl-btn">
                                                    <label class="screen-reader-text" for="quantity_{{ item["quantity"] }}">Quantidade</label>
                                                    <input type="number" id="quantity_{{ item["_id"] }}" class="input-text qty text" step="1" min="1" value="{{ item["quantity"] }}" title="Qty" size="4" pattern="[0-9]*" inputmode="numeric" aria-labelledby="{{ item["quantity"] }}">
                                                    <input type="button" value="+" data-target="{{ item["_id"] }}" class="conj-wc-qty-btn__plus ctrl-btn">
                                                </div>
                                            </td>
                                            <td class="product-subtotal" data-title="Total">
                                            <span class="woocommerce-Price-amount amount">
                                                R$<span class="woocommerce-Price-currencySymbol">
                                                    <?= number_format($item["preco"] * $item["quantity"],2,',','') ?>
                                                </span>
                                            </span>
                                            </td>
                                        </tr>
                                    {% endfor %}
                                    </tbody>
                                </table>
                            </form>
                            <div class="cart-collaterals">

                                <div class="cross-sells calculated_shipping">
                                    <h2>Total da compra</h2>
                                    <table cellspacing="0" class="shop_table shop_table_responsive">
                                        <tbody>
                                        <tr class="cart-subtotal">
                                            <th>Subtotal</th>
                                            <td data-title="Subtotal">
                                                <span class="woocommerce-Price-amount amount">
                                                    R$<span class="woocommerce-Price-currencySymbol" id="subTotalPurc">
                                                        <?= number_format($totalcarrinho->total,2,',','') ?>
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr class="shipping">
                                            <th>Frete</th>
                                            <td data-title="Frete">
                                                <ul id="shipping_method">
                                                    {% for f in frete %}
                                                        <li>
                                                            <input data-ship="{{ f['name']~':'~f['price'] }}" type="radio" name="shipping_method[0]" data-index="0" id="shipping_method_0_flat_rate1" value="flat_rate:1"
                                                                   class="shipping_method"  checked='checked' />
                                                            <label for="shipping_method_0_flat_rate1">{{ f["name"] }} ( {{ f["deadline"] }} dias úteis) : <span class="woocommerce-Price-amount amount">
                                                                    <span class="woocommerce-Price-currencySymbol">R&#36;</span>{{ f["price"] }}</span>
                                                            </label>
                                                        </li>
                                                    {% endfor %}
                                                </ul>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="cart_totals ">

                                    <table cellspacing="0" class="shop_table shop_table_responsive">

                                        <tbody>

                                            <tr class="order-total">
                                                <th>Total</th>
                                                <td data-title="Total">
                                                    <strong>
                                                        <span class="woocommerce-Price-amount amount">R$
                                                            <span class="woocommerce-Price-currencySymbol" id="totalPurc">
                                                                <?= number_format($totalcarrinho->total + $frete[1]["price"],2,',','') ?>
                                                            </span>
                                                        </span>
                                                    </strong>
                                            </td>

                                        </tbody>
                                    </table>
                                    <div class="wc-proceed-to-checkout">
                                        <a href="{{ url.getBaseUri() }}checkout" class="checkout-button button alt wc-forward" data-total="<?= number_format($totalcarrinho->total + $frete[1]['price'],2,',','') ?>" id="proceedToCheckout">
                                            Finalizar
                                        </a>
                                    </div>
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
    document.body.className = "page-template page-template-page-templates page-template-template-fluid page-template-page-templatestemplate-fluid-php page page-id-26 logged-in custom-background woocommerce-cart woocommerce-page woocommerce-demo-store woocommerce-js conj-has-social__menu conj-has-secondary__menu has-sidebar woocommerce-running conj-header-logo__left conj-social-menu__left conj-secondary-menu__right conj-primary-menu__left left-sidebar conj-copyright-content__left"
</script>