<template>

    <v-stepper v-model="step" class="elevation-0" non-linear>

        <v-stepper-header class="elevation-0">
            <v-stepper-step editable :complete="step > 1" step="1">Informações básicas</v-stepper-step>
            <v-divider></v-divider>
            <v-stepper-step editable :complete="step > 2" step="2">Descrição</v-stepper-step>
            <v-divider></v-divider>
            <v-stepper-step editable :complete="step > 3" step="3">Imagens</v-stepper-step>
            <v-divider></v-divider>
            <v-stepper-step editable :complete="step > 4" step="4">Ficha técnica</v-stepper-step>
            <v-divider></v-divider>
            <v-stepper-step editable :complete="step > 5" step="5">Departamento</v-stepper-step>
            <v-divider></v-divider>
            <v-stepper-step editable :complete="step > 6" step="6">Variação</v-stepper-step>
            <v-divider></v-divider>
            <v-stepper-step editable step="7">Vinculados</v-stepper-step>
        </v-stepper-header>

        <v-stepper-items>

            <v-stepper-content step="1">
                <v-card class="mb-2" flat>
                    <v-container grid-list-md>
                        <v-layout row wrap>
                            <v-flex xs12>
                                <v-text-field v-model="product.nome" label="Nome *" required :rules="[rules.required]"></v-text-field>
                            </v-flex>
                            <v-flex xs6 sm3>
                                <v-text-field type="number" v-model="product.dimensoes.largura || 0" label="Largura" suffix="cm"></v-text-field>
                            </v-flex>
                            <v-flex xs6 sm3>
                                <v-text-field type="number" v-model="product.dimensoes.altura || 0" label="Altura" suffix="cm"></v-text-field>
                            </v-flex>
                            <v-flex xs6 sm3>
                                <v-text-field type="number" v-model="product.dimensoes.comprimento || 0" label="Compimento" suffix="cm"></v-text-field>
                            </v-flex>
                            <v-flex xs6 sm3>
                                <v-text-field type="number" v-model="product.dimensoes.circunferencia || 0" label="Circunferência" suffix="cm"></v-text-field>
                            </v-flex>
                            <v-flex xs6 sm3>
                                <v-text-field type="number" v-model="product.preco" prefix="R$" label="Preço *" required :rules="[rules.required]"></v-text-field>
                            </v-flex>
                            <v-flex xs6 sm3>
                                <v-text-field type="number" v-model="product.peso" suffix="g" label="Peso *" required :rules="[rules.required]"></v-text-field>
                            </v-flex>
                            <v-flex xs6 sm3>
                                <v-text-field type="number" v-model="product.estoque" suffix="un" label="Estoque *" required :rules="[rules.required]"></v-text-field>
                            </v-flex>
                            <v-flex xs6 sm3>
                                <v-text-field v-model="product.marca" label="Marca *" required :rules="[rules.required]"></v-text-field>
                            </v-flex>
                            <v-card-actions>
                                <v-checkbox label="Ativo" v-model="product.ativo"></v-checkbox>
                            </v-card-actions>
                        </v-layout>
                    </v-container>
                </v-card>
            </v-stepper-content>

            <v-stepper-content step="2">
                <v-card class="mb-2" flat>
                    <v-content grid-list-md>
                        <v-layout row wrap>
                            <v-flex md12 lg6>
                                <VueEditor v-model="product.descricao"></VueEditor>
                            </v-flex>
                            <v-spacer></v-spacer>
                            <v-flex md12 lg5>
                                <div v-html="product.descricao"></div>
                            </v-flex>
                        </v-layout>
                    </v-content>
                </v-card>
            </v-stepper-content>

            <v-stepper-content step="3">
                <v-card class="mb-2" flat>
                    <v-container grid-list-md>
                        <Uploader/>
                        <v-divider></v-divider>
                        <Images/>
                    </v-container>
                </v-card>
            </v-stepper-content>

            <v-stepper-content step="4">
                <v-card class="mb-2" flat>
                    <v-container grid-list-md>
                        <v-flex xs12>
                            <v-expansion-panel>
                                <v-expansion-panel-content>
                                    <div slot="header">
                                        <h3>Adicionar</h3>
                                    </div>
                                    <v-card>
                                        <v-card-text>
                                            <v-container grid-list-md>
                                                <v-layout row wrap>
                                                    <v-flex xs12 md6>
                                                        <v-text-field label="Chave" v-model="newSpecification.key"></v-text-field>
                                                    </v-flex>
                                                    <v-flex xs12 md6>
                                                        <v-text-field label="Valor" v-model="newSpecification.value"></v-text-field>
                                                    </v-flex>
                                                </v-layout>
                                            </v-container>
                                        </v-card-text>
                                        <v-card-actions>
                                            <v-spacer></v-spacer>
                                            <v-btn color="primary" :disabled="!newSpecification.key || !newSpecification.value" @click="addNewSpefication">
                                                <v-icon>done</v-icon>
                                            </v-btn>
                                        </v-card-actions>
                                    </v-card>
                                </v-expansion-panel-content>
                            </v-expansion-panel>
                        </v-flex>
                        <br>
                        <v-divider></v-divider>
                        <br>
                        <v-flex>
                            <v-list>
                                <v-list-tile v-for="(item) in product.fichatecnica" :key="JSON.stringify(item)" @click="">
                                    <v-list-tile-action>
                                        <v-icon color="red">delete</v-icon>
                                    </v-list-tile-action>

                                    <v-list-tile-content>
                                        <v-list-tile-title>{{Object.keys(item)[0]}} : {{Object.values(item)[0]}}</v-list-tile-title>
                                    </v-list-tile-content>
                                </v-list-tile>
                            </v-list>
                        </v-flex>
                    </v-container>
                </v-card>
            </v-stepper-content>

            <v-stepper-content step="5">
                <v-card class="mb-2" flat>

                    <v-container grid-list-md>
                        <v-layout row wrap>
                            <v-flex xs12>
                                <v-select :items="departaments" item-text="nome" v-model="product.departamento.nome" label="Departamento"></v-select>
                            </v-flex>
                            <v-flex xs6 v-if="product.departamento.nome">
                                <v-select :items="categoria" item-text="nome" v-model="product.departamento.categoria.nome" label="Categoria"></v-select>
                            </v-flex>
                            <v-flex xs6 v-if="product.departamento.categoria.nome">
                                <v-select :items="subcategoria" v-model="product.departamento.categoria.subcategoria" label="Subcategoria"></v-select>
                            </v-flex>
                        </v-layout>
                    </v-container>

                    <v-container grid-list-md>
                        <v-layout row wrap>
                            <v-flex xs12>
                                <v-combobox v-model="product.tags" item-text="nome" item-value="nome" clearable :items="tags" label="Tags" multiple chips></v-combobox>
                            </v-flex>
                        </v-layout>
                    </v-container>

                </v-card>
            </v-stepper-content>

            <v-stepper-content step="6">
                <v-card class="mb-2" flat>

                    <v-autocomplete :items="variations" v-model="variacoes" item-text="nome" multiple chips clearable deletable-chips label="Variação"></v-autocomplete>

                    <v-container fluid v-for="item in product.variacoes" :key="JSON.stringify(item)">
                        <h4 class="body-2" v-text="item.nome"></h4>
                        <v-checkbox v-for="opcao in item.opcoes" v-model="item.selecionados" :label="opcao" :value="opcao" :key="JSON.stringify(opcao)+Math.random()"></v-checkbox>
                        <v-divider></v-divider>
                    </v-container>

                </v-card>
            </v-stepper-content>

            <v-stepper-content step="7">
                <v-card class="mb-2" flat>
                    <v-flex xs12>
                        <v-autocomplete :items="products" v-model="product.vinculados.produtos" item-text="nome" item-value="_id.$oid" multiple chips clearable deletable-chips label="Produtos"></v-autocomplete>
                    </v-flex>
                    <v-flex xs12>
                        <v-text-field label="Preço final" v-model="product.vinculados.preco" prepend-icon="attach_money"></v-text-field>
                    </v-flex>
                </v-card>
            </v-stepper-content>

            <v-card-actions>
                <v-btn color="primary" v-if="step <= 6" @click="step++">Próximo</v-btn>
                <v-btn flat v-if="step > 1" @click="step--">Voltar</v-btn>
            </v-card-actions>

        </v-stepper-items>

    </v-stepper>

</template>

<script>

    import { VueEditor } from 'vue2-editor'
    import Uploader from './Uploader.vue'
    import Images from './Images.vue'
    import { mapGetters } from 'vuex'

    export default {
        name: "Steppers",
        props: {
            product: {
                type: Object,
                required: true
            }
        },
        computed:{
            ...mapGetters([
                'tags',
                'departaments',
                'variations',
                'products'
            ]),
            categoria(){
                let ret = this.departaments.filter(x => x.nome === this.product.departamento.nome )
                return (ret[0] && ret[0].hasOwnProperty("categorias")) ? ret[0].categorias : ret
            },
            subcategoria(){
                let ret = this.categoria.filter(x => x.nome === this.product.departamento.categoria.nome)
                return (ret[0] && ret[0].hasOwnProperty("subcategorias")) ? ret[0].subcategorias : ret
            }
        },
        data: () => ({
            step: 0,
            newSpecification: {
                key: "",
                value: ""
            },
            subcategorias: {},
            rules: {
                required: (v) => !!v || "Campo obrigatório"
            },
            variacoes: [],
            varia: [],
        }),
        watch: {
            variacoes(current,old){
                if(current.length > old.length){
                    let diff =  this.Diff(current,old)

                    this.variations.forEach(variation => {
                        if(variation.nome === diff){
                            this.product.variacoes.unshift({
                                nome: diff,
                                opcoes: variation.variacoes,
                                selecionados: []
                            })
                        }
                    })

                }
                else{

                    let diff = this.Diff(old,current)

                    this.product.variacoes.forEach((variation,index) => {
                        if(variation.nome === diff){
                            this.product.variacoes.splice(index,1)
                        }
                    })

                }
            }
        },
        methods: {
            addNewSpefication(){
                this.$store.commit("addNewSpecification",{
                    item: this.newSpecification,
                    callback: () => {
                        this.newSpecification = {
                            key: "",
                            value: ""
                        }
                    }
                })
            },
            Diff(arr1,arr2){
                let match = ""

                arr1.forEach(a => {
                    if(arr2.indexOf(a) === -1)
                        match = a
                })

                return match

            }
        },
        created: function(){
            this.product.tags = ( typeof this.product.tags === "object") ? [] : this.product.tags
            this.product.vinculados = ( (typeof this.product.vinculados !== "object") && (this.product.vinculados === []) ) ? this.product.vinculados : { produtos: [], preco: 0 }
        },
        components:{
            VueEditor,
            Uploader,
            Images
        }
    }
</script>