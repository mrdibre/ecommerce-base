import Vue from 'vue'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const variacao = new Vuex.Store({
    state: {
        variations: [],
        newvariation: {
            nome: "",
            variacoes: []
        },
        editing: {
            nome: "",
            variacoes: [],
            _id: ""
        },
        indexEditing: -1,
        search: ""
    },
    getters: {
        variations(state){
            return state.variations
        },
        indexEditing(state){
            return state.indexEditing
        },
        newvariation(state){
            return state.newvariation
        },
        editing(state){
            return state.editing
        },
        search(state){
            return state.search
        }
    },
    mutations: {
        init: (state) => {
            Vue.http.post(`${window.location.pathname}`)
                .then(response => {
                    if(response.data instanceof Object) {
                        response = response.data

                        state.variations = response.variacoes

                    }
                })
                .catch(err => console.error(err))
        },
        saveVariation: (state,{item,callback}) => {
            Vue.http.post(`${window.location.pathname}/savevariation`,{item:state.newvariation})
                .then(response => {
                    if(response.data.status === "success"){
                        callback()
                        state.newvariation._id = response.data.id
                        state.variations.unshift(state.newvariation)
                        state.newvariation = {
                            nome: "",
                            variacoes: []
                        }
                    }
                    else{
                        console.log(response)
                    }
                })
                .catch(err => console.error(err))
        },
        deleteVariation: (state,item) => {
            Vue.http.post(`${window.location.pathname}/deletevariation`,{id:item._id.$oid})
                .then(response => {
                    console.log(response)
                    if(response.data.status === "success"){
                        let index = state.variations.indexOf(item)
                        state.variations.splice(index,1)
                    }
                })
        },
        saveEditVariation: (state,{item,callback}) => {
            Vue.http.post(`${window.location.pathname}/editvariation`,{item:state.editing})
                .then(response => {
                    console.log(response)
                    if(response.data.status === "success"){
                        state.variations.splice(state.indexEditing,1,state.editing)
                        state.editing = {}
                        state.indexEditing = -1
                        callback()
                    }
                })
        },
        selectToEdit: (state,item) => {
            state.editing = item
            state.indexEditing = state.variations.indexOf(item)
        },
        search: (state,item) => {
            state.search = item
        }
    }
})