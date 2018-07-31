<template>
    <v-flex class="py-2 px-2">
        <v-container>
            <v-layout align-center row fill-height>
                <v-flex v-for="banner in banners" xs12 md6 lg4 class="mx-2 my-2" :key="JSON.stringify(banner)">
                    <v-card>
                        <v-card-media :src="'/assets/uploads/'+banner.primaryImage" height="200px"></v-card-media>

                        <v-card-title primary-title>
                            <div>
                                <h3 class="headline mb-0" v-text="banner.title"></h3>
                                <div>{{banner.price ? 'R$'+banner.price : ''}}</div>
                            </div>
                        </v-card-title>

                        <v-card-actions v-if="deletable">
                            <v-btn flat color="red" small fab @click="deleteBanner(banner)">
                                <v-icon>delete</v-icon>
                            </v-btn>
                        </v-card-actions>
                    </v-card>
                </v-flex>
            </v-layout>
        </v-container>
    </v-flex>
</template>

<script>

    import {mapGetters} from 'vuex'

    export default {
        name: "Cards",
        props: {
            deletable: {
                default: false,
                type: Boolean
            }
        },
        methods: {
            deleteBanner(banner){
                this.$store.commit("deleteBanner",banner)
            }
        },
        computed: {
            ...mapGetters([
                'banners'
            ])
        }
    }
</script>

<style scoped>

</style>