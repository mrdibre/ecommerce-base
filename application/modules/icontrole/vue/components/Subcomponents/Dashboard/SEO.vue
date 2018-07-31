<template>
    <v-flex xs12 md6>
        <v-card>
            <v-card-title>
                <h1 class="headline">SEO</h1>
            </v-card-title>
            <v-card-text>
                <v-form>
                    <v-flex xs12>
                        <v-text-field v-model="seo.title" label="Título"></v-text-field>
                    </v-flex>
                    <v-flex xs12>
                        <v-text-field v-model="seo.tags" label="Tags"></v-text-field>
                    </v-flex>
                    <v-flex xs12>
                        <v-text-field v-model="seo.keywords" label="Palavras-chave"></v-text-field>
                    </v-flex>
                    <v-flex xs12>
                        <v-textarea v-model="seo.description" label="Descrição" auto-grow></v-textarea>
                    </v-flex>
                </v-form>
            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="secondary" flat @click="updateseo" :disabled="!seo.title || !seo.tags || !seo.keywords || !seo.description">Salvar</v-btn>
            </v-card-actions>
        </v-card>
    </v-flex>
</template>

<script>

    import {mapGetters} from 'vuex'

    export default {
        name: "SEO",
        computed: {
            ...mapGetters([
                'seo'
            ])
        },
        methods: {
            updateseo(){
                this.$store.commit("updateseo")
            }
        },

    }
</script>