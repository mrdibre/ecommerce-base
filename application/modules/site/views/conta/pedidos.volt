{% if sempedidos %}
    <div class="woocommerce-message woocommerce-message--info woocommerce-Message woocommerce-Message--info woocommerce-info">
        <a class="woocommerce-Button button" href="{{ url.getBaseUri() }}">
            Ir para Loja
        </a>
        Nenhum pedido registrado.
    </div>

{% else %}

    <h1>Pedidos</h1>

    {{ flashSession.output() }}

    {% for pedido in pedidos %}

        <a href="{{ url.getBaseUri() }}conta/pedido/{{ pedido._id }}" class="woocommerce-cart-form">

            <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents" cellspacing="0">
                <thead>
                <tr>
                    <th class="product-name">Data</th>
                    <th class="product-price">Status</th>
                    <th class="product-quantity">Frete</th>
                    <th class="product-subtotal">Total</th>
                </tr>
                </thead>
                <tbody>

                <tr class="woocommerce-cart-form__cart-item cart_item">

                    <td class="product-name" data-title="Data">
                        <a href="{{ url.getBaseUri() }}conta/pedido/{{ pedido._id }}">{{ pedido.data }}</a>
                    </td>

                    <td class="product-price" data-title="Status">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol format-status" data-status="{{ pedido.status }}">{{ pedido.status }}</span>
                        </span>
                    </td>

                    <td class="product-quantity" data-title="Frete">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">{{ pedido.frete["tipo"] }}</span>
                        </span>
                    </td>

                    <td class="product-subtotal" data-title="Total">
                        <span class="woocommerce-Price-amount amount">
                            <span class="woocommerce-Price-currencySymbol">R$</span>{{ pedido.total }}
                        </span>
                    </td>
                </tr>

                </tbody>
            </table>
        </a>
        <br><br>

    {% endfor %}

{% endif %}