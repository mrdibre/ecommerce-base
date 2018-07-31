<template>
    <v-flex xs12 md6 lg4>
        <v-expansion-panel>
            <v-expansion-panel-content>
                <div slot="header"> <h3 v-text="departament.nome"></h3> </div>
                <v-card>
                    <v-card-text>
                        <v-list>
                            <v-list-group v-for="categoria in departament.categorias" :key="JSON.stringify(categoria)" no-action>

                                <v-list-tile slot="activator">
                                    <v-list-tile-content>
                                        <v-list-tile-title v-text="categoria.nome"></v-list-tile-title>
                                    </v-list-tile-content>
                                </v-list-tile>

                                <v-list-tile v-for="subcategoria in categoria.subcategorias" :key="JSON.stringify(subcategoria)" @click="">
                                    <v-list-tile-content>
                                        <v-list-tile-title v-text="subcategoria"></v-list-tile-title>
                                    </v-list-tile-content>
                                </v-list-tile>
                            </v-list-group>
                        </v-list>
                    </v-card-text>
                </v-card>
            </v-expansion-panel-content>
        </v-expansion-panel>
    </v-flex>
</template>

<script>
    export default {
        name: "Panel",
        props: {
            departament: {
                type: Object,
                required: true
            }
        },
        data: () => ({
            items: [
                {
                    action: 'local_activity',
                    title: 'Attractions',
                    items: [
                        { title: 'List Item' }
                    ]
                },
                {
                    action: 'restaurant',
                    title: 'Dining',
                    active: true,
                    items: [
                        { title: 'Breakfast & brunch' },
                        { title: 'New American' },
                        { title: 'Sushi' }
                    ]
                },
                {
                    action: 'school',
                    title: 'Education',
                    items: [
                        { title: 'List Item' }
                    ]
                },
                {
                    action: 'directions_run',
                    title: 'Family',
                    items: [
                        { title: 'List Item' }
                    ]
                },
                {
                    action: 'healing',
                    title: 'Health',
                    items: [
                        { title: 'List Item' }
                    ]
                },
                {
                    action: 'content_cut',
                    title: 'Office',
                    items: [
                        { title: 'List Item' }
                    ]
                },
                {
                    action: 'local_offer',
                    title: 'Promotions',
                    items: [
                        { title: 'List Item' }
                    ]
                }
            ]
        }),
        methods: {},
        watch: {},
        created: function () {
        },
    }
</script>