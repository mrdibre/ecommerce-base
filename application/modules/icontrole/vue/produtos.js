import Vue from 'vue'
import Vuetify from 'vuetify'
import Index from './components/Produtos.vue'
import VueResource from 'vue-resource'
import { produtos } from "./components/store/Produtos";
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
    store: produtos,
    el: "#produtos",
    render: h => h(Index)
})