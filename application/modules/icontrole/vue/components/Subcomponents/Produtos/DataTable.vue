<template>
    <v-data-table disable-initial-sort :headers="headers" :items="products" :search="search" :loading="loading" item-key="nome" rows-per-page-text="Produtos por página" :rows-per-page-items="['25','50','75','100',{value:-1,text:'Todos'}]">
        <v-progress-linear slot="progress" color="blue" indeterminate></v-progress-linear>
        <template slot="items" slot-scope="props">
            <tr :class=" !props.item.ativo ? 'blue-grey lighten-5' : '' ">
                <td @click="props.expanded = !props.expanded">{{ props.item.nome || '---'}}</td>
                <td @click="props.expanded = !props.expanded" class="text-xs-left">{{ props.item.estoque || '---'}}</td>
                <td @click="props.expanded = !props.expanded" class="text-xs-left" v-text="'R$'+parseInt(props.item.preco).toFixed(2) || '---'"></td>
                <td class="text-xs-left">

                    <v-btn color="teal" small fab @click="editing(props.item)">
                        <v-icon>edit</v-icon>
                    </v-btn>

                    <v-btn color="red" small fab @click="deleteItem(props.item)">
                        <v-icon>delete</v-icon>
                    </v-btn>

                </td>
            </tr>
        </template>
        <template slot="expand" slot-scope="props">
            <v-list dense>
                <v-list-tile>
                    <v-list-tile-content>Ativo:</v-list-tile-content>
                    <v-list-tile-content class="align-end">{{ (props.item.ativo ? 'Sim':'Não') || '---' }}</v-list-tile-content>
                </v-list-tile>
                <v-list-tile>
                    <v-list-tile-content>Descrição:</v-list-tile-content>
                    <v-list-tile-content class="align-end" v-html="props.item.descricao || '---'"></v-list-tile-content>
                </v-list-tile>
                <v-list-tile >
                    <v-list-tile-content>Marca:</v-list-tile-content>
                    <v-list-tile-content class="align-end">{{ props.item.marca || '---' }}</v-list-tile-content>
                </v-list-tile>
                <v-list-tile>
                    <v-list-tile-content>Departamento:</v-list-tile-content>
                    <v-list-tile-content class="align-end">{{ formatDept(props.item.departamento) }}</v-list-tile-content>
                </v-list-tile>
                <v-list-tile >
                    <v-list-tile-content>Peso:</v-list-tile-content>
                    <v-list-tile-content class="align-end">{{ props.item.peso || '---' }}</v-list-tile-content>
                </v-list-tile>
                <v-list-tile>
                    <v-list-tile-content>Largura:</v-list-tile-content>
                    <v-list-tile-content class="align-end">{{ props.item.dimensoes.largura || '---' }}</v-list-tile-content>
                </v-list-tile>
                <v-list-tile >
                    <v-list-tile-content>Altura:</v-list-tile-content>
                    <v-list-tile-content class="align-end">{{ props.item.dimensoes.altura || '---' }}</v-list-tile-content>
                </v-list-tile>
                <v-list-tile>
                    <v-list-tile-content>Comprimento:</v-list-tile-content>
                    <v-list-tile-content class="align-end">{{ props.item.dimensoes.comprimento || '---' }}</v-list-tile-content>
                </v-list-tile>
                <v-list-tile>
                    <v-list-tile-content>Imagens:</v-list-tile-content>
                    <v-list-tile-content class="align-end">{{ props.item.imagens.length || '---' }}</v-list-tile-content>
                </v-list-tile>
            </v-list>
        </template>
        <template slot="pageText" slot-scope="props">
            Exibindo {{ props.pageStart }} - {{ props.pageStop }} de {{ props.itemsLength }}
        </template>
        <v-alert v-if="!loading" slot="no-data" :value="true" color="warning" icon="warning">
            Nenhum registro disponível.
        </v-alert>
        <v-alert slot="no-results" :value="true" color="error" icon="warning">
            Nenhum produto encontrado para "{{ search }}"
        </v-alert>
    </v-data-table>
</template>

<script>

    import { mapGetters } from 'vuex'

    export default {
        props: {
            search: {
                type: String,
                required: true
            }
        },
        computed: {
            ...mapGetters([
                'products'
            ])
        },
        name: "DataTable",
        data: () => ({
            s: "",
            loading: true,
            headers: [
                { text: 'Nome', align: 'left', value: 'nome'},
                { text: 'Estoque', value: 'estoque' },
                { text: 'Preço', value: 'preco' },
                { text: 'Opções', align: 'left', sortable: false, value: 'opcoes'},
            ],
        }),
        methods: {
            formatDate(str){
                if(str !== ''){
                    return str.split("-").reverse().join("/")
                }
                return false
            },
            deleteItem(item){
                this.$store.dispatch("deleteProducts",item)
            },
            formatDept(item){

                let departament = item.nome,
                    category    = item.categoria.nome,
                    subcategory = item.categoria.subcategoria

                return `${departament} / ${category} / ${subcategory}`

            },
            editing(item){
                this.$store.dispatch("selectProductToEdit",item)
            }
        },
        created: function () {
            this.$store.dispatch("getProducts", {
                item: "",
                callback: () => {
                    this.loading = false
                }
            })
        },
    }
</script>