import 'babel-polyfill/dist/polyfill'
import Vue from 'vue'
import Vuetify from 'vuetify'
import Index from './components/Dashboard.vue'
import VueResource from 'vue-resource'
import { dashboard } from './components/store/Dashboard.js'
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
    store: dashboard,
    el: "#welcome",
    render: h => h(Index)
})