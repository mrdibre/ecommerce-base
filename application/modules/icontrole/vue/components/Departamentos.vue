<template>
    <v-container fluid grid-list-md>
        <v-layout row wrap>
            <Departamento/>
            <Tags/>
        </v-layout>
    </v-container>
</template>

<script>

    import Departamento from './Subcomponents/Departamentos/Departamento.vue'
    import Tags from './Subcomponents/Departamentos/Tags.vue'

    export default {
        name: "Departamentos",
        data: () => ({}),
        methods: {},
        watch: {},
        created: function () {
            this.$store.commit("getInfo")
        },
        components: {
            Departamento,
            Tags
        }
    }
</script>