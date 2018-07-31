<template>
    <v-flex xs12>
        <v-card>
            <v-card-title>
                <h1>Departamentos</h1>
                <v-divider></v-divider>
                <NovoDepartamento/>
            </v-card-title>
            <v-card-text>
                <v-layout row wrap>
                    <Panel v-for="departament in $store.getters.departaments" :key="JSON.stringify(departament)" :departament="departament"/>
                </v-layout>
            </v-card-text>
        </v-card>
    </v-flex>
</template>

<script>

    import Panel from './Subcomponents/Departamento/Panel.vue'
    import NovoDepartamento from './Subcomponents/Departamento/NovoDepartamento.vue'

    export default {
        name: "Departamento",
        data: () => ({}),
        methods: {},
        watch: {},
        created: function () {},
        components: {
            Panel,
            NovoDepartamento
        }
    }
</script>