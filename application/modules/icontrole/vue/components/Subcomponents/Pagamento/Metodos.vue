<template>
    <v-flex xs12>
        <v-card flat>
            <v-card-title>
                <h1>Métodos de pagamento</h1>
                <v-divider></v-divider>
            </v-card-title>
            <v-card-text>
                <v-form v-model="valid">
                    <v-flex xs12>
                        <v-autocomplete v-model="methodsPayment.current" :items="methodsPayment.options" chips label="Metódos de pagamento" item-text="displayName" item-value="name" multiple>
                            <template slot="selection" slot-scope="data">
                                <v-chip :selected="data.selected" close class="chip--select-multi" @input="data.parent.selectItem(data.item)">
                                    <v-avatar>
                                        <v-icon>{{ data.item.icon }}</v-icon>
                                    </v-avatar>
                                    {{ data.item.displayName }}
                                </v-chip>
                            </template>
                            <template slot="item" slot-scope="data">
                                <template v-if="typeof data.item !== 'object'">
                                    <v-list-tile-content v-text="data.item"></v-list-tile-content>
                                </template>
                                <template v-else>
                                    <v-list-tile-avatar>
                                        <v-icon>{{ data.item.icon }}</v-icon>
                                    </v-list-tile-avatar>
                                    <v-list-tile-content>
                                        <v-list-tile-title v-html="data.item.displayName"></v-list-tile-title>
                                    </v-list-tile-content>
                                </template>
                            </template>
                        </v-autocomplete>
                    </v-flex>
                </v-form>
            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn @click="emitChange" color="primary" :disabled="!valid">Salvar</v-btn>
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
        name: "Metodos",
        data: () => ({
            message: "",
            toast: false,
            valid: false,
            loading: false,
            selected: []
        }),
        computed: {
            ...mapGetters([
                "methodsPayment"
            ])
        },
        methods: {
            emitChange(){
                this.loading = true
                this.$store.commit("changeMethodsPayment", {
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
        created: function () {
        },
    }
</script>