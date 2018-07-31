import Vue from 'vue'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const pagamento = new Vuex.Store({
    state: {
        payment: {
            options: ["pagseguro"],
            current: ""
        },
        configApi: {
            email: "",
            token: ""
        },
        methods: {
            options: [
                {name: "cartao_credito", icon: "payment", displayName: "Cartão de crédito"},
                {name: "boleto", icon: "description", displayName: "Boleto"}
            ],
            current: []
        },
        options: {
            max_parcelas: 0,
            max_parcelas_sem_juros: 0,
            min_parcela: 0,
            desconto_a_vista: 0
        }
    },
    getters: {
        apiKey:(state) =>{
            return state.configApi
        },
        paymentMethod: (state) => {
            return state.payment
        },
        methodsPayment: (state) => {
            return state.methods
        },
        optionsPayment: (state) => {
            return state.options
        }
    },
    mutations: {
        changePayment: (state,{item,callback}) => {
            Vue.http.post(`${window.location.pathname}/setapi/${state.payment.current}`)
                .then(response => callback(response.data))
                .catch(err => console.error(err))
        },
        changeConfigPayment: (state,{item,callback}) => {
            Vue.http.post(`${window.location.pathname}/setconfig`,{email: state.configApi.email, token: state.configApi.token,api: state.payment.current})
                .then(response => callback(response.data))
                .catch(err => console.error(err))
        },
        changeMethodsPayment: (state,{item,callback}) => {
            Vue.http.post(`${window.location.pathname}/setmethods`,{methods: state.methods.current, api: state.payment.current})
                .then(response => callback(response.data))
                .catch(err => console.error(err))
        },
        changeOptionsPayment: (state,{item,callback}) => {
            Vue.http.post(`${window.location.pathname}/setoptions`,{options: state.options, api: state.payment.current})
                .then(response => callback(response.data))
                .catch(err => console.error(err))
        },
        getConfig: (state) => {
            Vue.http.post(`${window.location.pathname}/getconfig`)
                .then(response => {
                    if(response.data instanceof Array){
                        state.configApi = response.data[0].parametros
                        state.payment.current = response.data[0].api
                        state.methods.current = response.data[0].metodos
                        state.options = response.data[0].opcoes
                    }
                })
                .catch(err => console.error(err))
        },
    },
    actions: {
        getConfig: (context) => {
            context.commit("getConfig")
        }
    }
})