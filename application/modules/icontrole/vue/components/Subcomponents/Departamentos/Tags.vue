<template>
    <v-flex xs12>
        <v-card>
            <v-card-title>
                <h1>Tags</h1>
                <v-divider></v-divider>
                <NovaTag/>
            </v-card-title>
            <v-card-text>
                <h2 class="headline" v-if="tag.length === 0">
                    Nenhuma tag disponível
                </h2>
                <v-chip v-else label color="secondary" text-color="white" v-for="t in tag" :key="JSON.stringify(t)" @click="deleteItem(t)">
                    <v-icon style="cursor: pointer;" left>close</v-icon>
                    {{ t.nome }}
                </v-chip>
            </v-card-text>
        </v-card>
    </v-flex>
</template>

<script>

    import NovaTag from './Subcomponents/Tags/NovaTags.vue'

    export default {
        name: "Tags",
        data: () => ({
            search: ""
        }),
        computed: {
            tag(){
                return this.$store.getters.tags
            }
        },
        methods: {
            deleteItem(item){
                this.$store.commit("deleteTag",item)
            }
        },
        watch: {},
        created: function () {},
        components: {
            NovaTag
        }
    }
</script>