<template>
    <div class="py-2 px-2">
        <v-card>
            <v-card-title>
                <Nova/>
                <Edit/>
                <v-spacer></v-spacer>
                <v-text-field label="Procurar" v-model="s"></v-text-field>
            </v-card-title>
            <v-card-text>
                <DataTable/>
            </v-card-text>
        </v-card>
    </div>
</template>

<script>

    import DataTable from './Subcomponents/Variacao/DataTable.vue'
    import Nova from './Subcomponents/Variacao/Nova.vue'
    import Edit from './Subcomponents/Variacao/Edit.vue'
    import {mapGetters} from 'vuex'

    export default {
        name: "Variacao",
        data: () => ({
            s: ""
        }),
        computed: {
            ...mapGetters([
                'editing',
                'indexEditing'
            ])
        },
        watch:{
            s(current){
                this.$store.commit("search",current)
            }
        },
        created: function() {
            this.$store.commit("init")
        },
        components: {
            DataTable,
            Nova,
            Edit
        }
    }
</script>

<style scoped>

</style>