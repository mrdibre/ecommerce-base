<template>
    <div>
        <v-snackbar v-model="snackbar" :timeout="6000" top right>
            Variação salva com sucesso
            <v-btn color="pink" flat @click="snackbar = false">
                Fechar
            </v-btn>
        </v-snackbar>
        <v-dialog v-model="dialog" persistent max-width="500px">
            <v-btn slot="activator" color="secondary" dark>Nova</v-btn>
            <v-card>
                <v-card-title>
                    <span class="headline">Nova variação</span>
                </v-card-title>
                <v-card-text>
                    <v-container grid-list-md>
                        <v-layout wrap>
                            <v-flex xs12>
                                <v-text-field label="Nome*" v-model="newvariation.nome" :rules="[rules.required]" required></v-text-field>
                            </v-flex>
                            <v-flex xs12>
                                <v-combobox :rules="[rules.required]" v-model="newvariation.variacoes" clearable deletable-chips autocomplete chips multiple :items="[]" label="Variações*" required></v-combobox>
                            </v-flex>

                        </v-layout>
                    </v-container>
                    <small>*Campos obrigatórios</small>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="secondary" flat @click.native="dialog = false">Cancelar</v-btn>
                    <v-btn color="primary" :disabled="!newvariation.nome || !newvariation.variacoes" @click="saveVariation">Salvar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>

<script>

    import {mapGetters} from 'vuex'

    export default {
        name: "Nova",
        data: () => ({
            snackbar: false,
            dialog: false,
            rules: {
                required: v => !!v || "Campo obrigatório"
            }
        }),
        computed:{
            ...mapGetters([
                'newvariation',
            ])
        },
        methods: {
            saveVariation(){
                this.$store.commit("saveVariation",{
                    item:"",
                    callback: () => {
                        this.snackbar = true
                    }
                })
            }
        }
    }
</script>

<style scoped>

</style>