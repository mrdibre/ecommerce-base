<template>
    <div class="mb-2">
        <v-btn v-if="editing.imagens.length === 0" color="blue darken-1" @click="$refs.imageProduct.click()">
            <v-icon>attach_file</v-icon>
        </v-btn>
        <v-btn v-else color="blue darken-1" flat fab @click="$refs.imageProduct.click()">
            <v-icon>add</v-icon>
        </v-btn>
        <input type="file" ref="imageProduct" style="display: none;" @change="handleChange" multiple accept="image/*;">
    </div>
</template>

<script>

    import {mapGetters} from 'vuex'

    export default {
        name: "Uploader",
        methods: {
            handleChange(evt){
                let files = evt.target.files

                if(files.length > 0){

                    for(let i = 0; i < files.length; i++){

                        this.editing.imagens.unshift({
                            preview: window.URL.createObjectURL( files[i] ),
                            file: files[i]
                        })

                    }

                }

            }
        },
        computed:{
            ...mapGetters([
                'editing'
            ])
        }
    }
</script>