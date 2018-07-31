<template>
    <v-flex xs12 md6 >
        <v-card>
            <v-card-title>
                <h1 class="headline">Últimos pedidos</h1>
            </v-card-title>
            <v-card-text>
                <v-list>
                    <v-list-tile v-for="item in lastorders" :key="Math.random()+JSON.stringify(lastorders)" @click="">
                        <v-list-tile-content>
                            <v-list-tile-title v-text="item.toUpperCase()"></v-list-tile-title>
                        </v-list-tile-content>
                    </v-list-tile>
                </v-list>
            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn flat color="secondary" href="/icontrole/pedidos">Visualizar mais</v-btn>
            </v-card-actions>
        </v-card>
    </v-flex>
</template>

<script>

    import { mapGetters } from 'vuex'

    export default {
        name: "LastOrders",
        computed: {
            ...mapGetters([
                'lastorders'
            ])
        }
    }
</script>