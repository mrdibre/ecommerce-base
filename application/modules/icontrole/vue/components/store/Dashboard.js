import Vue from 'vue'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const dashboard = new Vuex.Store({
    state: {
        clients: 0,
        products: 0,
        orders: 0,
        seo: {},
        dateorders: {},
        lastorders: []
    },
    getters: {
        clients(state){
            return state.clients
        },
        products(state){
            return state.products
        },
        orders(state){
            return state.orders
        },
        seo(state){
            return state.seo
        },
        lastorders(state){
            return state.lastorders
        },
        dateorders(state){
            return state.dateorders
        }
    },
    mutations: {
        init: (state) => {
            Vue.http.post(`${window.location.pathname}`)
                .then(response => {
                    response = response.data
                    state.clients = response.clients
                    state.products = response.products
                    state.orders = response.orders
                    state.seo = response.seo || {title:"",tags:"",keywords:"",description:""}
                    state.lastorders = response.lastorders.map(x => x.referencia)
                    setTimeout(() => state.dateorders = response.dateorders,2000)
                })
                .catch(err => console.error(err))
        },
        updateseo(state){
            Vue.http.post(`${window.location.pathname}`,{updateseo: true, item:state.seo})
                .then(response => console.log(response))
                .catch(err => console.error(err))
        }
    }
})