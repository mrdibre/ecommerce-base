import Vue from 'vue'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const produtos = new Vuex.Store({
    state: {
        search:       "",
        products:     [],
        tags:         [],
        departaments: [],
        variations:   [],
        editing:      {},
        index:        0
    },
    getters: {
        products(state){
            return state.products
        },
        search(state){
            return state.search
        },
        editing(state){
            return state.editing
        },
        variations(state){
            return state.variations
        },
        departaments(state){
            return state.departaments
        },
        tags(state){
            return state.tags
        }
    },
    mutations: {
        getProducts: (state,{item,callback}) => {
            Vue.http.post(window.location.pathname)
                .then(response => {
                    if(response.data instanceof Object){

                        state.products     = response.data.produtos.map(x => {
                            if(x.departamento.hasOwnProperty("nome")) return x

                            x.departamento = {
                                nome: "",
                                categoria: {
                                    nome: "",
                                    subcategoria: ""
                                }
                            }

                            return x
                        })
                        state.tags         = response.data.tags.map(x => x.nome)
                        state.departaments = response.data.departamentos
                        state.variations   = response.data.variacoes
                    }
                    callback()
                })
                .catch(err => console.warn(err))
        },
        deleteProducts: (state,item) => {
            Vue.http.post(`${window.location.pathname}/delete/${item._id.$oid}`)
                .then(response => {
                    if(response.data.status === "success"){
                        let index = state.products.indexOf(item)
                        state.products.splice( index , 1 )
                    }
                    else{
                        console.warn(response)
                    }
                })
                .catch(err => console.warn(err))
        },
        selectProductToEdit: (state,item) => {
            state.editing = item
            state.index   = state.products.indexOf(item)
        },
        addNewSpecification: (state,{item,callback}) => {
            state.editing.fichatecnica.unshift({
                [item.key] : item.value
            })
            callback()
        },
        finishEditProduct: (state,{item,callback}) => {

            let fd = new FormData()
            fd.append("product",JSON.stringify(state.editing))

            console.log(state.editing.imagens)

            return

            state.editing.imagens.forEach( (image,index) => {
                fd.append(`imagem${index}`, (image instanceof Object) ? image.file : image )
            })

            Vue.http.post(`${window.location.pathname}/edit`,fd)
                .then(response => {
                    console.log(response)
                    if(response.data.status === "success"){
                        state.products.splice(state.index,1,state.editing)
                        state.editing = {}
                        callback()
                    }
                })
                .catch(err => console.warn(err))
        },
        deleteImage: (state,item) => {
            let index = state.editing.imagens.indexOf(item)
            state.editing.imagens.splice(index,1)
        },
        closeEdit: (state) =>{
            state.editing = {}
            state.index = 0
        }
    },
    actions: {
        getProducts: (context,callback) => {
            context.commit("getProducts",callback)
        },
        deleteProducts: (context,payload) => {
            context.commit("deleteProducts",payload)
        },
        selectProductToEdit: (context,payload) => {
            context.commit("selectProductToEdit",payload)
        }
    }
})