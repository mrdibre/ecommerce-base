import Vue from 'vue'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const banners = new Vuex.Store({
    state: {
        banners: [],
        banner: {
            title: "",
            link: "",
            price: 0,
            images: {
                primary: {
                    preview: "",
                    file: ""
                },
                secondary: {
                    preview: "",
                    file: ""
                }
            }
        }
    },
    getters: {
        banners(state){
            return state.banners
        },
        banner(state){
            return state.banner
        }
    },
    mutations: {
        init: (state) => {
            Vue.http.post(`${window.location.pathname}/getbanners`)
                .then(response => {
                    state.banners = response.data.banners
                })
                .catch(err => console.error(err))
        },
        deleteBanner(state,payload){

            Vue.http.post(`${window.location.pathname}/delete/${payload._id.$oid}`)
                .then(response => {
                    if(response.data.status === "success"){
                        let index = state.banners.indexOf(payload)
                        state.banners.splice( index ,1)
                    }
                })

        },
        saveNewBanner: (state,{item,callback}) => {

            let data = new FormData()
            data.append("primary",state.banner.images.primary.file)
            data.append("secondary",state.banner.images.secondary.file)
            data.append("data",JSON.stringify(state.banner))

            Vue.http.post(`${window.location.pathname}/insert`,data)
                .then(response => {
                    console.log(response)
                    if(response.data.status === "success"){
                        callback()
                        state.banners.push(state.banner)
                        state.banner = {
                            title: "",
                            link: "",
                            price: 0,
                            images: {
                                primary: {
                                    preview: "",
                                    file: ""
                                },
                                secondary: {
                                    preview: "",
                                    file: ""
                                }
                            }
                        }
                    }
                })
                .catch(err => console.error(err))
        }
    },
    actions: {
        saveNewBanner(context){
            context.commit("saveNewBanner")
        }
    }
})