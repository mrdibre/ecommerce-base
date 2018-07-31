<template>
    <v-card-title>
        <h1>Produtos</h1>
        <v-spacer></v-spacer>
        <v-text-field v-model="search" label="Procurar" prepend-icon="search" inverted></v-text-field>
    </v-card-title>
</template>

<script>

    export default {
        name: "Title",
        data: () => ({
            search: ""
        }),
        methods: {},
        watch: {
            search(current){
                this.$emit('searching',current)
            }
        },
        created: function () {},
    }
</script>