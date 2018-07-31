<template>
    <v-layout row justify-center>

        <v-snackbar v-model="loading" right top :timeout="3000">
            Pedido atualizado com sucesso
            <v-btn color="pink" flat @click="loading = false">
                Fechar
            </v-btn>
        </v-snackbar>

        <v-dialog v-model="dialog" persistent max-width="80%" scrollable>
            <v-card  v-if="editing.hasOwnProperty('_id')">
                <v-card-title>
                    <h4 class="headline" v-text="editing.referencia.toUpperCase()"></h4>
                </v-card-title>
                <v-card-text>
                    <v-flex xs12 class="px-2">
                        <v-text-field label="Rastreamento" v-model="editing.rastreamento"></v-text-field>
                    </v-flex>
                    <v-flex xs12 class="px-2">
                        <h6 class="title" v-text="formatStatus(editing.status.pagamento)"></h6>
                        <v-autocomplete :items="['Nota fiscal emitida','Em separação','Em transporte','Entregue']" :disabled="(Number.parseInt(editing.status.pagamento) !== 3) && (Number.parseInt(editing.status.pagamento) !== 4)" label="Status" v-model="editing.status.loja"></v-autocomplete>
                    </v-flex>
                    <v-divider></v-divider>
                    <v-list dense>
                        <v-list-tile>
                            <v-list-tile-content>Data:</v-list-tile-content>
                            <v-list-tile-content class="align-end" v-text="editing.data"></v-list-tile-content>
                        </v-list-tile>
                        <v-list-tile>
                            <v-list-tile-content>Cliente:</v-list-tile-content>
                            <v-list-tile-content class="align-end" v-text="editing.cliente.nome+' / '+editing.cliente.email"></v-list-tile-content>
                        </v-list-tile>
                        <v-list-tile>
                            <v-list-tile-content>Total:</v-list-tile-content>
                            <v-list-tile-content class="align-end" v-text="'R$'+editing.total"></v-list-tile-content>
                        </v-list-tile>
                    </v-list>
                    <v-expansion-panel class="elevation-0">
                        <v-expansion-panel-content>
                            <div slot="header">Pagamento</div>
                            <v-card>
                                <v-card-text>
                                    <v-list dense>
                                        <v-list-tile>
                                            <v-list-tile-content>Tipo:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="formatPaymentType(editing.pagamento.tipo)"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Parcelas:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="editing.pagamento.parcelas"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Valor da parcela:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="'R$'+editing.pagamento.valor_parcela"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Acréscimo:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="'R$'+editing.pagamento.acrescimo"></v-list-tile-content>
                                        </v-list-tile>
                                    </v-list>
                                </v-card-text>
                            </v-card>
                        </v-expansion-panel-content>
                        <v-expansion-panel-content>
                            <div slot="header">Frete</div>
                            <v-card>
                                <v-card-text>
                                    <v-list dense>
                                        <v-list-tile>
                                            <v-list-tile-content>Tipo:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="editing.frete.tipo"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Valor:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="'R$'+editing.frete.valor"></v-list-tile-content>
                                        </v-list-tile>
                                    </v-list>
                                </v-card-text>
                            </v-card>
                        </v-expansion-panel-content>
                        <v-expansion-panel-content>
                            <div slot="header">Produtos</div>
                            <v-card>
                                <v-card-text>
                                    <v-list dense v-for="produto in editing.produtos" :key="JSON.stringify(produto)">
                                        <v-list-tile>
                                            <v-list-tile-content v-text="produto.nome"></v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="produto.qtd"></v-list-tile-content>
                                        </v-list-tile>
                                    </v-list>
                                </v-card-text>
                            </v-card>
                        </v-expansion-panel-content>
                        <v-expansion-panel-content>
                            <div slot="header">Entrega</div>
                            <v-card>
                                <v-card-text>
                                    <v-list dense :key="JSON.stringify(endereco)">
                                        <v-list-tile>
                                            <v-list-tile-content>Número</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="editing.entrega.numero"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Rua</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="editing.entrega.rua"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Bairro</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="editing.entrega.bairro"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Cidade</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="editing.entrega.cidade"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Estado</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="editing.entrega.estado"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>CEP</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="editing.entrega.cep"></v-list-tile-content>
                                        </v-list-tile>
                                    </v-list>
                                </v-card-text>
                            </v-card>
                        </v-expansion-panel-content>
                    </v-expansion-panel>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" flat @click.native="close">Fechar</v-btn>
                    <v-btn color="blue darken-1" @click.native="save" :loading="loading" :disabled="loading">Salvar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-layout>
</template>

<script>

    import { mapGetters } from 'vuex'

    export default {
        name: "Modal",
        data: () => ({
            dialog: false,
            loading: false
        }),
        methods: {
            close(){
                this.$store.commit("closeEdition")
            },
            save(){
                this.$store.commit("saveEdition", () => {
                        this.loading = true
                    }
                )
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
        computed: {
            ...mapGetters([
                'editing'
            ])
        },
        watch: {
            editing(current){
                if(current === {} || !current.hasOwnProperty("_id"))
                    this.dialog = false

                else
                    this.dialog = true
            }
        }
    }
</script>