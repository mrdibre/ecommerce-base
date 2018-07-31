<template>
    <v-flex xs12>
        <v-card flat>
            <v-card-title>
                <h1>Opções de parcelamento</h1>
                <v-divider inset></v-divider>
            </v-card-title>
            <v-card-text>
                <v-form v-model="valid">
                    <v-layout grid-list-md>
                        <v-flex xs6>
                            <v-text-field type="number" v-model="optionsPayment.max_parcelas" :rules="[rules.required]" required label="Máximo de parcelas *"></v-text-field>
                        </v-flex>
                        <v-flex xs6>
                            <v-text-field type="number" v-model="optionsPayment.max_parcelas_sem_juros" :rules="[rules.required]" required label="Máximo de parcelas sem juros *"></v-text-field>
                        </v-flex>
                    </v-layout>
                    <v-layout grid-list-md>
                        <v-flex xs6>
                            <v-text-field type="number" v-model="optionsPayment.min_parcela" :rules="[rules.required]" required label="Valor mínimo da parcela *"></v-text-field>
                        </v-flex>
                        <v-flex xs6>
                            <v-text-field type="number" v-model="optionsPayment.desconto_a_vista" :rules="[rules.required]" required label="Desconto à vista *"></v-text-field>
                        </v-flex>
                    </v-layout>
                </v-form>
            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn :disabled="loading" :loading="loading" color="primary" @click="emitChange">Salvar</v-btn>
            </v-card-actions>
        </v-card>
        <v-dialog v-model="loading" hide-overlay persistent width="300">
            <v-card color="primary" dark>
                <v-card-text>Salvando
                    <v-progress-linear indeterminate color="white" class="mb-0"/>
                </v-card-text>
            </v-card>
        </v-dialog>
        <v-snackbar v-model="toast" right top :timeout="4000">
            {{ message }}
            <v-btn color="pink" flat @click="toast = false">Fechar</v-btn>
        </v-snackbar>
    </v-flex>
</template>

<script>

    import { mapGetters } from 'vuex'

    export default {
        name: "Opcoes",
        data: () => ({
            toast: false,
            valid: false,
            loading: false,
            message: "",
            rules: {
                required: (v) => !!v || "Campo obrigatório"
            }
        }),
        computed:{
            ...mapGetters([
                "optionsPayment"
            ])
        },
        methods: {
            emitChange(){
                this.loading = true
                this.$store.commit("changeOptionsPayment", {
                    item: "",
                    callback: (response) => {
                        this.loading = false
                        if(response instanceof Object){
                            if(response.hasOwnProperty("error") && !response.error){
                                this.message = "Atualizado com sucesso"
                                this.toast = true
                            }
                            else{
                                console.log(response)
                                this.message = "Tente novamente"
                                this.toast = true
                            }
                        }
                        else{
                            console.log(response)
                            this.message = "Tente novamente"
                            this.toast = true
                        }
                    }
                })
            }
        },
        watch: {},
        created: function () {
        },
    }
</script>