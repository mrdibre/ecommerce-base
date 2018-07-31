import Vue from 'vue'
import Vuetify from 'vuetify'
import Index from './components/Departamentos.vue'
import VueResource from 'vue-resource'
import 'vuetify/dist/vuetify.min.css'
import { departamentos } from './components/store/Departamentos.js'
import colors from "vuetify/es5/util/colors";

Vue.use(Vuetify, {
    theme: {
        primary: colors.orange.accent3,
        secondary: colors.blue.accent4
    }
})
Vue.use(VueResource)

new Vue({
    store: departamentos,
    el: "#departamentos",
    render: h => h(Index)
})