<template>
    <v-dialog :fullscreen="fullscreen" v-model="dialog" persistent max-width="60%">
        <v-btn slot="activator" color="primary" dark>Novo</v-btn>
        <v-card>
            <v-card-title>
                <span class="headline">Novo</span>
            </v-card-title>
            <v-card-text>
                <v-container grid-list-md>
                    <v-layout wrap>
                        <v-flex xs12>
                            <v-text-field label="Departamento" required v-model="newdepartament.nome"></v-text-field>
                        </v-flex>
                        <v-flex xs12>
                            <span>Categorias</span>
                            <v-tooltip right>
                                <v-btn slot="activator" color="primary" flat fab small @click="toggleAddNewCategory">
                                    <v-icon> {{showcatname ? 'close' : 'add'}} </v-icon>
                                </v-btn>
                                <span>Nova categoria</span>
                            </v-tooltip>
                            <v-container grid-list-md v-if="showcatname">
                                <v-layout row wrap>
                                    <v-flex xs8>
                                        <v-text-field label="Nome" v-model="catname"></v-text-field>
                                    </v-flex>
                                    <v-flex xs4>
                                        <v-btn flat @click="addNewCategory" :disabled="!catname">
                                            <v-icon>done</v-icon>
                                        </v-btn>
                                    </v-flex>
                                </v-layout>
                            </v-container>
                        </v-flex>
                        <v-flex xs12>

                            <v-expansion-panel>
                                <v-expansion-panel-content v-for="(item) in newdepartament.categorias" :key="JSON.stringify(item)">
                                    <div slot="header">
                                        {{ item.nome }}
                                        <v-btn small flat fab color="red" @click="deleteCategory(item)">
                                            <v-icon>delete</v-icon>
                                        </v-btn>
                                    </div>
                                    <v-card>
                                        <v-card-text>
                                            <v-combobox v-model="item.subcategorias" hide-selected label="Subcategorias" multiple small-chips solo clearable>
                                                <template slot="selection" slot-scope="{ item, parent, selected }">
                                                    <v-chip color="blue lighten-3" label small>
                                                        <span class="pr-2">
                                                            {{ item }}
                                                        </span>
                                                        <v-icon small @click="parent.selectItem(item)">
                                                            close
                                                        </v-icon>
                                                    </v-chip>
                                                </template>
                                            </v-combobox>
                                        </v-card-text>
                                    </v-card>
                                </v-expansion-panel-content>
                            </v-expansion-panel>

                        </v-flex>
                    </v-layout>
                </v-container>
            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" flat @click.native="dialog = false">Cancelar</v-btn>
                <v-btn color="primary" @click.native="saveNewDepartament">Salvar</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>

<script>
    export default {
        name: "NovoDepartamento",
        data: () => ({
            catname: "",
            showcatname: false,
            fullscreen: false,
            dialog: false,
            newdepartament: {
                nome: "",
                categorias: []
            }
        }),
        methods: {
            toggleAddNewCategory(){
                if(this.showcatname){
                    this.showcatname = !this.showcatname
                    this.catname = ""
                }
                else{
                    this.showcatname = !this.showcatname
                    this.catname = ""
                }
            },
            addNewCategory(){
                this.newdepartament.categorias.unshift({
                    nome: this.catname,
                    subcategorias: []
                })
                this.toggleAddNewCategory()
            },
            deleteCategory(item){
                let index = this.newdepartament.categorias.indexOf(item)
                this.newdepartament.categorias.splice(index,1)
            },
            saveNewDepartament(){
                this.$store.commit("saveNewDepartament",{
                    item: this.newdepartament,
                    callback: () => {
                        this.toggleAddNewCategory()
                        this.dialog = false
                    }
                })
            }
        },
        watch: {},
        created: function () {
            if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) this.fullscreen = true
        },
    }
</script>