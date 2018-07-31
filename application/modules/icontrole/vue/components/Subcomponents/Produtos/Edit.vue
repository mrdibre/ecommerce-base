<template>
    <v-layout row justify-center>
        <v-dialog v-model="dialog" :fullscreen="fullscreen" persistent max-width="80%">
            <v-card>
                <v-card-title>
                   <hgroup>
                       <h1 class="headline" v-text="editing.nome"></h1>
                       <h2 v-if="!editing.avaliacao">Sem avaliação</h2>
                       <h2 v-else>
                           <v-icon color="yellow" v-for="avaliation in editing.avaliacao" :key="avaliation">star</v-icon>
                       </h2>
                   </hgroup>
                </v-card-title>
                <v-card-text>
                    <Steppers v-if="$store.getters.editing.hasOwnProperty('nome')" :product="editing"/>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" flat @click.native="close()">Fechar</v-btn>
                    <v-btn color="blue darken-1" dark @click.native="finishEditProduct">Salvar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        <v-snackbar v-model="snackbar" right :timeout="5000" top>
            {{ text }}
            <v-btn color="pink" flat @click="snackbar = false">
                Fechar
            </v-btn>
        </v-snackbar>
    </v-layout>
</template>

<script>

    import { mapGetters } from 'vuex'
    import Steppers from './Subcomponents/Edit/Steppers.vue'

    export default {
        name: "Edit",
        data: () => ({
            dialog: false,
            fullscreen: false,
            snackbar: false,
            text: "Produto editado com sucesso"
        }),
        computed: {
            ...mapGetters([
                'editing'
            ])
        },
        methods: {
            close(){
                this.step = 0
                this.dialog = false
                this.$store.commit("closeEdit")
            },
            finishEditProduct(){
                this.$store.commit('finishEditProduct',{
                    item: "",
                    callback: () => {
                        this.snackbar = true
                        this.close()
                    }
                })
            }
        },
        watch: {
            editing(current){
                if(current === {} || !current.hasOwnProperty("_id"))
                    this.dialog = false
                else
                    this.dialog = true
            }
        },
        components: {
            Steppers
        },
        created: function () {
            if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) this.fullscreen = true
        },
    }
</script>