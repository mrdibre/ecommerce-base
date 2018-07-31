<template>
    <v-flex xs12>
        <v-card>
            <v-card-title>
                <h1>Tipo</h1>
                <v-divider inset></v-divider>
            </v-card-title>
            <v-card-text>
                <v-select :items="paymentMethod.options"  v-model="paymentMethod.current"></v-select>
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
        name: "Api",
        data: () => ({
            toast: false,
            loading: false,
            message: ""
        }),
        computed:{
            ...mapGetters([
                "paymentMethod"
            ])
        },
        methods: {
            emitChange(){
                this.loading = true
                this.$store.commit("changePayment", {
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
        created: function () {},
    }
</script>