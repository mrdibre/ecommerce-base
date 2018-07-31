import Vue from 'vue'
import Vuetify from 'vuetify'
import Index from './components/Pagamento.vue'
import VueResource from 'vue-resource'
import { pagamento } from './components/store/Pagamento'
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
    store: pagamento,
    el: "#pagamento",
    render: h => h(Index)
})