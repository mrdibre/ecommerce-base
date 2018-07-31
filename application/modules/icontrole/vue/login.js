import Vue from 'vue'
import Vuetify from 'vuetify'
import Index from './components/Login.vue'
import VueResource from 'vue-resource'
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify)
Vue.use(VueResource)

new Vue({
    el: "#login",
    render: h => h(Index)
})