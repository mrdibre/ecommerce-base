import Vue from 'vue'
import Vuetify from 'vuetify'
import Index from './components/Pedidos.vue'
import { pedidos } from './components/store/Pedidos'
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
    el: "#pedidos",
    store: pedidos,
    render: h => h(Index)
})