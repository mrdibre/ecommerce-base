<template>
    <v-container grid-list-md>
        <v-layout row wrap align-center justify-space-around fill-height>
            <v-flex xs12 md4>
                <Purcharses/>
            </v-flex>
            <v-flex xs12 md4>
                <MostSale/>
            </v-flex>
        </v-layout>
        <v-divider></v-divider>
    </v-container>
</template>

<script>

    import Purcharses from  './Purcharses.js'
    import MostSale from './MostSale.js'

    export default {
        name: "Graph",
        data: () => ({}),
        methods: {},
        watch: {},
        created: function () {},
        components:{
            Purcharses,
            MostSale
        }
    }
</script>