import Vue from 'vue'
import Vuetify from 'vuetify'
import Index from './components/Entrega.vue'
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
    el: "#entrega",
    render: h => h(Index)
})