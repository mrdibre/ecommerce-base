<template>
    <div>
        <v-container fluid grid-list-md>
            <v-card>
                <v-card-title>
                    <h1>Clientes</h1>
                    <v-spacer></v-spacer>
                    <v-text-field label="Procurar" prepend-icon="search" v-model="s" clearable></v-text-field>
                    <v-card-text>
                        <DataIterable/>
                    </v-card-text>
                </v-card-title>
            </v-card>
        </v-container>
    </div>
</template>

<script>

    import DataIterable from './Subcomponents/Clientes/DataIterable.vue'
    import { mapGetters } from 'vuex'

    export default {
        name: "Clientes",
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
                'search'
            ])
        },
        components:{
            DataIterable
        }
    }
</script>