<template>
    <div>
        <v-container fluid grid-list-md>
            <v-card>
                <v-card-title>
                    <h1>Pedidos</h1>
                    <v-spacer></v-spacer>
                    <v-text-field label="Procurar" prepend-icon="search" v-model="s" clearable></v-text-field>
                    <v-card-text>
                        <Modal/>
                        <DataIterable/>
                    </v-card-text>
                </v-card-title>
            </v-card>
        </v-container>
    </div>
</template>

<script>

    import DataIterable from './Subcomponents/Pedidos/DataIterable.vue'
    import Modal from './Subcomponents/Pedidos/Modal.vue'
    import { mapGetters } from 'vuex'

    export default {
        name: "Pedidos",
        data: () => ({
            s: ""
        }),
        watch: {
            s(current){
                this.$store.commit("search",current)
            }
        },
        computed:{
            ...mapGetters([
                'search',
                'editing'
            ])
        },
        components:{
            DataIterable,
            Modal
        }
    }
</script>