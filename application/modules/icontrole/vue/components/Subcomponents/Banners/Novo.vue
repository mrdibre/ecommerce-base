<template>
    <div>
        <v-dialog v-model="dialog" persistent max-width="800px" :fullscreen="fullscreen">
            <v-btn fab fixed right bottom slot="activator" color="secondary" dark>
                <v-icon>add</v-icon>
            </v-btn>
            <v-card>
                <v-card-title>
                    <span class="headline">Novo Banner</span>
                </v-card-title>
                <v-card-text>
                    <v-dialog v-model="loading" hide-overlay persistent width="300">
                        <v-card color="primary" dark>
                            <v-card-text>
                                Aguarde...
                                <v-progress-linear indeterminate color="white" class="mb-0"></v-progress-linear>
                            </v-card-text>
                        </v-card>
                    </v-dialog>
                    <v-container grid-list-md>
                        <v-layout wrap>
                            <v-flex xs12>
                                <v-text-field label="Título*" :rules="[rules.required]" required v-model="banner.title"></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm8>
                                <v-text-field label="Link" hint="Ex.: produto/visualizacao/2d8329dsh23298ds9" v-model="banner.link"></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm4>
                                <v-text-field label="Preço" type="number" v-model="banner.price"></v-text-field>
                            </v-flex>
                            <v-flex xs12>
                                <v-card flat>
                                    <v-container fluid grid-list-md>
                                        <v-layout row wrap>
                                            <v-flex xs12 sm8>
                                                <v-card>
                                                    <v-card-media v-if="banner.images.primary.preview" :src="banner.images.primary.preview" height="200px"></v-card-media>
                                                    <v-card-text>
                                                        <h3 class="headline">Principal*</h3>
                                                    </v-card-text>
                                                    <v-card-actions>
                                                        <v-spacer></v-spacer>
                                                        <v-btn flat @click="$refs.primaryImage.click()">
                                                            <v-icon>attach_file</v-icon>
                                                        </v-btn>
                                                        <input accept="image/*" @change="handlePrimaryImage" type="file" style="display:none;" ref="primaryImage">
                                                    </v-card-actions>
                                                </v-card>
                                            </v-flex>
                                            <v-flex xs12 sm4>
                                                <v-card>
                                                    <v-card-media v-if="banner.images.secondary.preview" :src="banner.images.secondary.preview" height="200px"></v-card-media>
                                                    <v-card-text>
                                                        <h3 class="headline">Secondária</h3>
                                                    </v-card-text>
                                                    <v-card-actions>
                                                        <v-spacer></v-spacer>
                                                        <v-btn flat @click="$refs.secondaryImage.click()">
                                                            <v-icon>attach_file</v-icon>
                                                        </v-btn>
                                                        <input accept="image/*" @change="handleSecondaryImage" type="file" style="display:none;" ref="secondaryImage">
                                                    </v-card-actions>
                                                </v-card>
                                            </v-flex>
                                        </v-layout>
                                    </v-container>
                                </v-card>
                            </v-flex>
                        </v-layout>
                    </v-container>
                    <small>* Campo obrigatório</small>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" flat @click.native="dialog = false">Cancelar</v-btn>
                    <v-btn :loading="loading" :disabled="(!banner.title || !banner.images.primary.file) || loading" color="blue darken-1" @click.native="saveNewBanner">Salvar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>

<script>

    import { mapGetters } from 'vuex'

    export default {
        name: "Novo",
        data: () => ({
            loading: false,
            dialog: false,
            fullscreen: false,
            rules: {
                required: v => !!v || "Campo obrigatório"
            }
        }),
        methods: {
            handlePrimaryImage(evt){
                evt = evt.target.files[0]

                this.banner.images.primary.preview = this.generateUrl(evt)
                this.banner.images.primary.file = evt

            },
            handleSecondaryImage(evt){
                evt = evt.target.files[0]

                this.banner.images.secondary.preview = this.generateUrl(evt)
                this.banner.images.secondary.file = evt

            },
            generateUrl(file){
                return window.URL.createObjectURL(file)
            },
            saveNewBanner(){
                this.loading = true
                this.$store.commit('saveNewBanner',{
                    item:"",
                    callback: () => {
                        this.loading = false
                    }
                })
            }
        },
        computed: {
            ...mapGetters([
                'banner'
            ])
        },
        mounted: function() {
            if( /Android|webOS|iPhone|iPad|iPod|IEMobile|BlackBerry|Opera Mini|Windows Phone/i.test(navigator.userAgent) ) this.fullscreen = true
        }
    }
</script>

<style scoped>

</style>