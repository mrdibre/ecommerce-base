import 'babel-polyfill/dist/polyfill'
import Vue from 'vue'
import Vuetify from 'vuetify'
import Index from './components/Clientes.vue'
import { clientes } from "./components/store/Clientes"
import VueResource from 'vue-resource'
import 'vuetify/dist/vuetify.min.css'
import colors from "vuetify/es5/util/colors";

Vue.use(Vuetify, {
    theme: {
        primary: colors.orange.accent3,
        secondary: colors.blue.accent4
    }
})
Vue.use(VueResource)

new Vue({
    el: "#clientes",
    store: clientes,
    render: h => h(Index)
})