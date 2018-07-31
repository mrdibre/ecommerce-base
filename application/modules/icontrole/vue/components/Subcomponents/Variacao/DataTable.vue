<template>
    <v-data-table :headers="headers" :search="search" :items="variations" rows-per-page-text="Variações por página" :rows-per-page-items="['25','50','75','100',{value:-1,text:'Todos'}]">
        <template slot="items" slot-scope="props">
            <tr>
                <td @click="props.expanded = !props.expanded">{{ props.item.nome || '---'}}</td>
                <td @click="props.expanded = !props.expanded">{{ props.item.variacoes.join(",").toString() || '---'}}</td>
                <td class="text-xs-left">
                    <v-btn color="teal" small fab @click="editItem(props.item)">
                        <v-icon>edit</v-icon>
                    </v-btn>
                    <v-btn color="red" small fab @click="deleteItem(props.item)">
                        <v-icon>delete</v-icon>
                    </v-btn>
                </td>
            </tr>
        </template>
        <template slot="pageText" slot-scope="props">
            Exibindo {{ props.pageStart }} - {{ props.pageStop }} de {{ props.itemsLength }}
        </template>
        <v-alert slot="no-data" :value="true" color="warning" icon="warning">
            Nenhum registro disponível.
        </v-alert>
        <v-alert slot="no-results" :value="true" color="error" icon="warning">
            Nenhuma variação encontrado para "{{search}}"
        </v-alert>
    </v-data-table>
</template>

<script>

    import { mapGetters } from 'vuex'

    export default {
        computed: {
            ...mapGetters([
                'variations',
                'search'
            ])
        },
        data: () => ({
            headers: [
                { text: 'Nome', align: 'left', value: 'nome'},
                { text: 'Variações', align: 'left', value: 'variacoes' },
                { text: 'Opções', align: 'left', sortable: false, value: 'opcoes'},
            ]
        }),
        name: "DataTable",
        methods: {
            deleteItem(item){
                this.$store.commit("deleteVariation",item)
            },
            editItem(item){
                this.$store.commit("selectToEdit",item)
            }
        },
    }
</script>