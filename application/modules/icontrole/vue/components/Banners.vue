<template>
    <v-layout>
        <Cards deletable/>
        <Novo/>
    </v-layout>
</template>

<script>

    import Novo from './Subcomponents/Banners/Novo.vue'
    import Cards from './Subcomponents/Banners/Cards.vue'

    export default {
        name: "Banners",
        created: function(){
            this.$store.commit("init")
        },
        components: {
            Novo,
            Cards
        }
    }
</script>