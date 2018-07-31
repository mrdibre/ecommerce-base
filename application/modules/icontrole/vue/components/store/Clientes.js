import Vue from 'vue'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const clientes = new Vuex.Store({
    state: {
        clients: [],
        search: ""
    },
    getters: {
        clients(state){
            return state.clients
        },
        search(state){
            return state.search
        }
    },
    mutations: {
        init: (state) => {
            Vue.http.post(`${window.location.pathname}`)
                .then(response => state.clients = response.data.clients)
                .catch(err => console.error(err))
        },
        search: (state,item) => {
            state.search = item
        }
    }
})