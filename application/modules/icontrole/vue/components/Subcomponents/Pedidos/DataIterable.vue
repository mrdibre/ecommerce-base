<template>
    <v-data-table no-data-text="Nenhum pedido disponível" no-results-text="Nenhum pedido encontrado" :headers="headers" :items="pedidos" :search="search" :rows-per-page-items="[10,25,50,{text:'Todos',value:-1}]" rows-per-page-text="Pedidos por página" content-tag="v-layout" row wrap>
        <template slot="items" slot-scope="props">
            <tr>
                <td v-text="props.item.referencia.toUpperCase()"></td>
                <td v-text="(props.item.cliente.nome || props.item.cliente.email) || props.item.cliente"></td>
                <td> <b v-text="formatStatus(props.item.status.pagamento)+' / '+(props.item.status.loja || '---')"></b> </td>
                <td class="text-xs-left">
                    <v-btn color="teal" small fab @click="editItem(props.item)">
                        <v-icon>edit</v-icon>
                    </v-btn>
                </td>
            </tr>
        </template>
        <template slot="pageText" slot-scope="props">
            Exibindo {{ props.pageStart }} - {{ props.pageStop }} de {{ props.itemsLength }}
        </template>
    </v-data-table>
</template>

<script>

    import { mapGetters } from 'vuex'

    String.prototype.capitalize = function () {
        return this.charAt(0).toUpperCase()+this.substr(1)
    }

    export default {
        name: "DataIterable",
        computed:{
            ...mapGetters([
                'pedidos',
                'search'
            ])
        },
        data: () => ({
            headers: [
                { text: 'Referência', align: 'left', value: 'referencia'},
                { text: 'Cliente', value: 'cliente' },
                { text: 'Status', value: 'status' },
                { text: 'Editar', value: '', sortable : false }
            ],
        }),
        methods: {
            editItem(item){
                this.$store.commit("setItemToEdit",item)
            },
            formatStatus(status){
                switch ( parseInt(status) ){
                    case 1:
                        return 'Aguardando pagamento'
                    case 2:
                        return 'Em análise'
                    case 3:
                        return 'Paga'
                    case 4:
                        return 'Disponível'
                    case 5:
                        return 'Em disputa'
                    case 6:
                        return 'Devolvido'
                    case 7:
                        return 'Cancelado'
                    case 8:
                        return 'Debitado'
                    case 9:
                        return 'Retenção temporária'
                    default:
                        return 'Desconhecido'
                }
            },
            formatPaymentType(tipo){
                switch (tipo){
                    case 'credit_card':
                        return 'Cartão de crédito'
                    case 'boleto':
                        return tipo.capitalize()
                }
            }
        },
        created: function () {
            this.$store.commit("init")
        }
    }
</script>