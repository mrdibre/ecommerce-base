<template>
    <v-dialog v-model="dialog" persistent max-width="500px">
        <v-btn slot="activator" color="primary" dark>Nova</v-btn>
        <v-card>
            <v-card-title>
                <span class="headline">Nova</span>
            </v-card-title>
            <v-card-text>
                <v-container grid-list-md>
                    <v-layout wrap>
                        <v-flex xs12>
                            <v-text-field label="Nome" required v-model="newTag"></v-text-field>
                        </v-flex>
                    </v-layout>
                </v-container>
            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" flat @click.native="dialog = false">Fechar</v-btn>
                <v-btn color="blue darken-1" @click.native="cadNewTag" :disabled="!newTag">Salvar</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>

<script>
    export default {
        name: "NovoDepartamento",
        data: () => ({
            dialog: false,
            newTag: ""
        }),
        methods: {
            cadNewTag(){
                this.$store.commit("newTag",{
                    item: this.newTag,
                    callback: () => {
                        this.newTag = ""
                    }
                })
            }
        },
        watch: {},
        created: function () {
        },
    }
</script>