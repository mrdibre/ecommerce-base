import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import colors from 'vuetify/es5/util/colors'

Vue.use(Vuetify, {
    theme: {
        primary: colors.orange.accent3,
        secondary: colors.blue.accent4
    }
})

new Vue({
    el: "#app",
    data: () => ({
        drawer: true,
        variant: false,
        menu: false,
        menuoptions: [
            { icon: 'dashboard', text: 'Dashboard', route: "/icontrole"},
            {
                icon: 'dns',
                text: 'Produtos',
                children: [
                    {
                        icon: 'visibility',
                        text: 'Visualizar',
                        route: '/icontrole/produtos/'
                    },
                    {
                        icon: 'style',
                        text: 'Variação',
                        route: '/icontrole/produtos/variacao'
                    }
                ]
            },
            { icon: 'people', text: 'Clientes', route: "/icontrole/clientes"},
            { icon: 'assignment', text: 'Pedidos', route: "/icontrole/pedidos"},
            { icon: 'category', text: 'Departamentos', route: "/icontrole/departamentos"},
            { icon: 'payment', text: 'Metodo de pagamento', route: "/icontrole/pagamento"},
            { icon: 'insert_photo', text: 'Banners', route: '/icontrole/banners' },
            { icon: 'settings', text: 'Administradores', route: "/icontrole/administradores" }
        ]
    }),
    mounted: function(){
        if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/.test(navigator.userAgent)) this.variant = true
    },
    created: function(){

        let currentLocation = location.pathname

        this.menuoptions = this.menuoptions.map(option => {

            if(option.hasOwnProperty("children")){
                option.children = option.children.map(child => {
                    if(child.route === currentLocation){
                        option.active = true
                    }
                    return child
                })
            }
            else{
                if(option.route === currentLocation){
                    option.active = true
                }
            }

            return option

        })

    }
})