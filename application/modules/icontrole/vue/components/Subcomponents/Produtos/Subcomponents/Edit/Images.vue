<template>
    <v-layout row wrap class="mt-2">
        <v-flex xs12 md4 lg3 v-for="image in editing.imagens" :key="JSON.stringify(image)+Math.random()">
            <v-card>
                <v-card-media :src="image instanceof Object ? image.preview : '/2018/assets/uploads/produtos/'+image" height="200px"></v-card-media>
                <v-card-actions>
                    <v-btn flat color="red" @click="deleteImage(image)">
                        <v-icon>delete</v-icon>
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>

    import {mapGetters} from 'vuex'

    export default {
        name: "Images",
        methods: {
            deleteImage(image){
                this.$store.commit("deleteImage",image)
            }
        },
        computed:{
            ...mapGetters([
                'editing'
            ])
        }
    }

</script>