<template>
    <v-flex xs12>
        <v-card flat color="transparent">
            <v-card-text>
                <v-container grid-list-md text-xs-center>
                    <v-layout row wrap>
                        <v-flex xs12 md6 lg4>
                            <v-card dark color="primary">
                                <v-card-text class="px-0">
                                    <h1 class="title">Clientes</h1>
                                    <h1>{{clients}}</h1>
                                </v-card-text>
                            </v-card>
                        </v-flex>
                        <v-flex xs12 md6 lg4>
                            <v-card dark color="primary">
                                <v-card-text class="px-0">
                                    <h1 class="title">Produtos</h1>
                                    <h1>{{products}}</h1>
                                </v-card-text>
                            </v-card>
                        </v-flex>
                        <v-flex xs12 md6 lg4>
                            <v-card dark color="primary">
                                <v-card-text class="px-0">
                                    <h1 class="title">Pedidos</h1>
                                    <h1>{{orders}}</h1>
                                </v-card-text>
                            </v-card>
                        </v-flex>
                    </v-layout>
                </v-container>
                <v-divider></v-divider>
            </v-card-text>
        </v-card>
    </v-flex>
</template>

<script>

    import { mapGetters } from 'vuex'

    export default {
        name: "Header",
        computed:{
            ...mapGetters([
                "clients",
                "orders",
                "products"
            ])
        }
    }
</script>