<template>
    <v-container grid-list-md>
        <Header/>
        <Graph  v-if="$store.getters.dateorders !== {}"/>
        <v-layout row wrap align-center>
            <LastOrders/>
            <SEO/>
        </v-layout>
    </v-container>
</template>

<script>

    import Header from './Subcomponents/Dashboard/Header.vue'
    import Graph from './Subcomponents/Dashboard/Graph.vue'
    import LastOrders from './Subcomponents/Dashboard/LastOrders.vue'
    import SEO from './Subcomponents/Dashboard/SEO.vue'

    export default {
        name: "Dashboard",
        components: {
            Header,
            Graph,
            LastOrders,
            SEO
        },
        created:function(){
            this.$store.commit("init")
        }
    }
</script>