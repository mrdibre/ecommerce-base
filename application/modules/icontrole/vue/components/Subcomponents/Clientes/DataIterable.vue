<template>
    <v-data-iterator no-data-text="Nenhum cliente disponível" no-results-text="Nenhum clientes encontrado" :items="clients" :search="search" :rows-per-page-items="[10,25,50,{text:'Todos',value:-1}]" rows-per-page-text="Items por página" content-tag="v-layout" row wrap>
        <v-flex slot="item" slot-scope="props" xs12 sm6 md4 lg3>
            <v-card>
                <v-card-title><h4 v-text="props.item.nome+' '+props.item.sobrenome"></h4></v-card-title>
                <v-divider></v-divider>
                <v-card-text>
                    <v-list dense>
                        <v-list-tile>
                            <v-list-tile-content>Nascimento:</v-list-tile-content>
                            <v-list-tile-content class="align-end" v-text="props.item.nascimento"></v-list-tile-content>
                        </v-list-tile>
                        <v-list-tile>
                            <v-list-tile-content>Email:</v-list-tile-content>
                            <v-list-tile-content class="align-end" v-text="props.item.email"></v-list-tile-content>
                        </v-list-tile>
                        <v-list-tile v-if="props.item.documento.tipo">
                            <v-list-tile-content v-text="props.item.documento.tipo+':'"></v-list-tile-content>
                            <v-list-tile-content class="align-end" v-text="props.item.documento.valor"></v-list-tile-content>
                        </v-list-tile>
                        <v-list-tile v-if="props.item.contato.ddd">
                            <v-list-tile-content>Contato:</v-list-tile-content>
                            <v-list-tile-content class="align-end" v-text="props.item.contato.ddd+' '+props.item.contato.telefone"></v-list-tile-content>
                        </v-list-tile>
                    </v-list>
                    <v-expansion-panel class="elevation-0" v-if="Object.values(props.item.endereco).reduce((c,n) => c+n) !== ''">
                        <v-expansion-panel-content>
                            <div slot="header">Endereço</div>
                            <v-card>
                                <v-card-text>
                                    <v-list dense>
                                        <v-list-tile>
                                            <v-list-tile-content>Bairro:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="props.item.endereco.bairro"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Rua:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="props.item.endereco.rua"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Complemento:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="props.item.endereco.complemento || '---'"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Número:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="props.item.endereco.numero"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>CEP:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="props.item.endereco.cep"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Cidade:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="props.item.endereco.cidade"></v-list-tile-content>
                                        </v-list-tile>
                                        <v-list-tile>
                                            <v-list-tile-content>Estado:</v-list-tile-content>
                                            <v-list-tile-content class="align-end" v-text="props.item.endereco.estado"></v-list-tile-content>
                                        </v-list-tile>
                                    </v-list>
                                </v-card-text>
                            </v-card>
                        </v-expansion-panel-content>
                    </v-expansion-panel>
                </v-card-text>
            </v-card>
        </v-flex>
        <template slot="pageText" slot-scope="props">
            Exibindo {{ props.pageStart }} - {{ props.pageStop }} de {{ props.itemsLength }}
        </template>
    </v-data-iterator>
</template>

<script>

    import { mapGetters } from 'vuex'

    String.prototype.capitalize = function () {
        return this.charAt(0).toUpperCase()+this.substr(1)
    };

    export default {
        name: "DataIterable",
        computed:{
            ...mapGetters([
                'clients',
                'search'
            ])
        },
        methods: {
        },
        created: function () {
            this.$store.commit("init")
        }
    }
</script>