<div class="woocommerce">
    <form class="woocommerce-cart-form" method="post">
        <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents" cellspacing="0">
            <thead>
            <tr>
                <th class="product-name">Produto</th>
                <th class="product-price">Preço</th>
                <th class="product-quantity">Quantidade</th>
                <th class="product-subtotal">Total</th>
            </tr>
            </thead>
            <tbody>
            {% for produto in pedido.produtos %}
                <tr class="woocommerce-cart-form__cart-item cart_item">
                    <td class="product-name" data-title="Produto">
                        <a href="{{ url.getBaseUri() }}produto/visualizacao/{{ produto["id"] }}">{{ produto["nome"] }}</a>
                    </td>
                    <td class="product-price" data-title="Preço">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">R$</span>{{ produto["preco"] }}
                        </span>
                    </td>
                    <td class="product-quantity" data-title="Quantidade">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">{{ produto["qtd"] }}</span>
                        </span>
                    </td>
                    <td class="product-subtotal" data-title="Subtotal">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">R$</span>{{ produto["qtd"] * produto["preco"] }}
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
                            <span class="woocommerce-Price-currencySymbol">R$</span>{{ pedido.total - pedido.frete["valor"] }}
                        </span>
                    </td>
                </tr>
                <tr class="shipping">
                    <th>Frete</th>
                    <td data-title="Frete">
                        <ul id="shipping_method">
                            <li>
                                <input type="radio" name="shipping_method[0]" data-index="0" id="shipping_method_0_flat_rate1" value="flat_rate:1" class="shipping_method" checked="checked">
                                <label for="shipping_method_0_flat_rate1">{{ pedido.frete["tipo"] }} : <span class="woocommerce-Price-amount amount">
                                        <span class="woocommerce-Price-currencySymbol">R$</span>{{ pedido.frete["valor"] }}</span>
                                </label>
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr class="order-total">
                    <th>Total</th>
                    <td data-title="Total">
                        <strong>
                            <span class="woocommerce-Price-amount amount">
                                <span class="woocommerce-Price-currencySymbol">R$</span>{{ pedido.total }}
                            </span>
                        </strong>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="cart_totals ">

            <h2>Pagamento</h2>

            <table cellspacing="0" class="shop_table shop_table_responsive">

                <tbody>
                <tr class="cart-subtotal">
                    <th>Metódo: </th>
                    <td data-title="Metódo: ">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol" id="format-method" data-method="{{ pedido.pagamento["tipo"] }}">{{ pedido.pagamento["tipo"] }}</span>
                        </span>
                    </td>
                </tr>
                <tr class="cart-subtotal">
                    <th>Parcelas: </th>
                    <td data-title="Parcelas: ">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">{{ pedido.pagamento["parcelas"] }}</span>
                        </span>
                    </td>
                </tr>
                <tr class="cart-subtotal">
                    <th>Valor da parcela: </th>
                    <td data-title="Valor da parcela: ">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">R${{ pedido.pagamento["valor_parcela"] }}</span>
                        </span>
                    </td>
                </tr>
                <tr class="cart-subtotal">
                    <th>Acréscimo: </th>
                    <td data-title="Acréscimo: ">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">R${{ pedido.pagamento["acrescimo"] }}</span>
                        </span>
                    </td>
                </tr>

                </tbody>
            </table>

        </div>
    </div>
    <div class="cross-sells calculated_shipping">
        <h2>Informações adicionais</h2>
        <table cellspacing="0" class="shop_table shop_table_responsive">
            <tbody>
            <tr class="cart-subtotal">
                <th>Referência</th>
                <td data-title="Referência">
                    <span class="woocommerce-Price-amount amount">
                        <span class="woocommerce-Price-currencySymbol">{{ pedido.referencia }}</span>
                    </span>
                </td>
            </tr>
            <tr class="shipping">
                <th>Rastreamento</th>
                <td data-title="Rastreamento">
                    {% if pedido.rastreamento !== 'indisponível' %}
                        <a class="woocommerce-Price-amount amount" href="{{ pedido.rastreamento }}" target="_blank">
                            Clique aqui
                        </a>
                    {% else %}
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">Indisponível</span>
                        </span>
                    {% endif %}
                </td>
            </tr>
            <tr class="order-total">
                <th>Data</th>
                <td data-title="Data">
                    <span class="woocommerce-Price-amount amount">
                        <span class="woocommerce-Price-currencySymbol">{{ pedido.data }}</span>
                    </span>
                </td>
            </tr>
            <tr class="order-total">
                <th>Status</th>
                <td data-title="Status">
                    <span class="woocommerce-Price-amount amount">
                        <span class="woocommerce-Price-currencySymbol" id="format-status" data-status="{{ pedido.status }}">{{ pedido.status }}</span>
                    </span>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>