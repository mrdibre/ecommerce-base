<template>
    <v-flex xs12>
        <v-card flat>
            <v-card-title>
                <h1>Configurações da api</h1>
                <v-divider></v-divider>
            </v-card-title>
            <v-card-text>
                <v-form v-model="valid">
                    <v-flex xs12>
                        <v-text-field required label="Email *" type="email" v-model="apiKey.email" prepend-icon="email" :rules="[rules.required,rules.email]"></v-text-field>
                    </v-flex>
                    <v-flex xs12>
                        <v-text-field required label="Token *" v-model="apiKey.token" prepend-icon="settings_applications" :rules="[rules.required]"></v-text-field>
                    </v-flex>
                </v-form>
            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn @click="" color="primary" :disabled="!valid" @click="emitChange">Salvar</v-btn>
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
        name: "Configuracao",
        data: () => ({
            valid: false,
            toast: false,
            loading: false,
            message: "",
            rules: {
                required: (v) => !!v || "Campo obrigatório",
                email: (v) => /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(v) || "Email inválido"
            }
        }),
        methods: {
            emitChange(){
                this.loading = true
                this.$store.commit("changeConfigPayment", {
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
        computed:{
            ...mapGetters([
                'apiKey'
            ])
        },
        watch: {}
    }
</script>