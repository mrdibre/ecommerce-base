<template>
    <div>
        <v-snackbar v-model="snackbar" :timeout="6000" top right>
            Variação editada com sucesso
            <v-btn color="pink" flat @click="snackbar = false">
                Fechar
            </v-btn>
        </v-snackbar>
        <v-dialog v-model="dialog" persistent max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="headline">Nova variação</span>
                </v-card-title>
                <v-card-text>
                    <v-container grid-list-md>
                        <v-layout wrap>
                            <v-flex xs12>
                                <v-text-field label="Nome*" v-model="editing.nome" :rules="[rules.required]" required></v-text-field>
                            </v-flex>
                            <v-flex xs12>
                                <v-combobox :rules="[rules.required]" v-model="editing.variacoes" clearable deletable-chips autocomplete chips multiple :items="[]" label="Variações*" required></v-combobox>
                            </v-flex>

                        </v-layout>
                    </v-container>
                    <small>*Campos obrigatórios</small>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="secondary" flat @click.native="dialog = false">Cancelar</v-btn>
                    <v-btn color="primary" :disabled="!editing.nome || !editing.variacoes" @click="saveEditVariation">Salvar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>

<script>

    import {mapGetters} from 'vuex'

    export default {
        name: "Edit",
        data: () => ({
            snackbar: false,
            dialog: false,
            rules: {
                required: v => !!v || "Campo obrigatório"
            }
        }),
        computed:{
            ...mapGetters([
                'editing',
                'indexEditing'
            ])
        },
        watch:{
            editing(current){
                if(current !== {}){
                    this.dialog = true
                }
                else{
                    this.dialog = false
                }
            }
        },
        methods: {
            saveEditVariation(){
                this.$store.commit("saveEditVariation",{
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