<template>
    <v-container fluid grid-list-md>
        <v-card>
            <Edit/>
            <Title @searching="handleSearch"/>
            <v-card-text>
                <DataTable :search="search"/>
            </v-card-text>
        </v-card>
    </v-container>
</template>

<script>

    import DataTable from './Subcomponents/Produtos/DataTable.vue'
    import Title from './Subcomponents/Produtos/Title.vue'
    import Edit from './Subcomponents/Produtos/Edit.vue'

    export default {
        name: "Produtos",
        data: () => ({
            search: ""
        }),
        methods: {
            handleSearch(item){
                this.search = item
            }
        },
        watch: {},
        created: function () {},
        components:{
            DataTable,
            Title,
            Edit
        }
    }
</script>