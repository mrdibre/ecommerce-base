import Vue from 'vue'
import Vuetify from 'vuetify'
import Index from './components/Variacao.vue'
import VueResource from 'vue-resource'
import { variacao } from "./components/store/Variacao";
import 'vuetify/dist/vuetify.min.css'
import colors from 'vuetify/es5/util/colors'

Vue.use(VueResource)

Vue.use(Vuetify, {
    theme: {
        primary: colors.orange.accent3,
        secondary: colors.blue.accent4
    }
})
new Vue({
    store: variacao,
    el: "#variacao",
    render: h => h(Index)
})