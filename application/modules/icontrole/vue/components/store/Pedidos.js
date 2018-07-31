import Vue from 'vue'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const pedidos = new Vuex.Store({
    state: {
        pedidos: [],
        search: "",
        editing: {},
        indexEditing: -1
    },
    getters: {
        pedidos(state){
            return state.pedidos
        },
        search(state){
            return state.search
        },
        editing(state){
            return state.editing
        },
        indexEditing(state){
            return state.indexEditing
        }
    },
    mutations: {
        init: (state) => {
            Vue.http.post(`${window.location.pathname}`)
                .then(response => state.pedidos = response.data.pedidos)
                .catch(err => console.error(err))
        },
        setItemToEdit: (state,item) => {
            state.editing = item
            state.indexEditing = state.pedidos.indexOf( item )
        },
        closeEdition: (state) => {
            state.editing = {}
            state.indexEditing = -1
        },
        saveEdition: (state,callback) => {

            Vue.http.post(`${window.location.pathname}/edit`,{item:state.editing})
                .then(response => {

                })
                .catch(err => console.warn(err))

        },
        search: (state,item) => {
            state.search = item
        }
    }
})