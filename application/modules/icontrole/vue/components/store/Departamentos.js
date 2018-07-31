import Vue from 'vue'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const departamentos = new Vuex.Store({
    state: {
        tags: [],
        departaments: []
    },
    getters: {
        tags(state){
            return state.tags
        },
        departaments(state){
            return state.departaments
        }
    },
    mutations: {

        getInfo: (state) => {
            Vue.http.post(`${window.location.pathname}/getinfo`)
                .then(response => {
                    if(response.data instanceof Object){
                        if(response.data.hasOwnProperty("tags"))
                            state.tags = response.data.tags
                        if(response.data.hasOwnProperty("departamentos"))
                            state.departaments = response.data.departamentos
                    }

                })
                .catch(err => console.error(err))
        },

        saveNewDepartament: (state,{item,callback}) => {
            Vue.http.post(`${window.location.pathname}/newdepartament`,item)
                .then(response => {
                    if(response.data.hasOwnProperty("status") && response.data.status === "success"){
                        state.departaments.unshift(item)
                        callback()
                    }
                    else{
                        console.log(response)
                    }
                })
                .catch(err => console.error(err))
        },

        newTag: (state,{item,callback}) => {
            Vue.http.post(`${window.location.pathname}/newtag`,{nome: item})
                .then(response => {
                    if(response.data.hasOwnProperty("status") && response.data.status === "success"){

                        state.tags.unshift({
                            nome: item,
                            _id: response.data._id
                        })
                        callback()

                    }
                    else
                        console.warn(response)
                })
                .catch(err => console.error(err))
        },

        deleteTag: (state,item) => {
            Vue.http.post(`${window.location.pathname}/deletetag/${item._id.$oid}`)
                .then(response => {
                    if(response.data.hasOwnProperty("status") && response.data.status === "success")
                        state.tags.splice( state.tags.indexOf(item), 1 )
                    else
                        console.warn(response)
                })
                .catch(err => console.error(err))
        }

    },
    actions: {}
})