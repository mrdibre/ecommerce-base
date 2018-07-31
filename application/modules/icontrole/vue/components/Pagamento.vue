<template>
    <div>
        <v-container grid-list-md>
            <v-layout row wrap align-center>
                <Api/>
                <v-flex xs12>
                    <v-card>
                        <v-card-title>
                            <h1 v-text="$store.state.payment.current.charAt(0).toUpperCase()+$store.state.payment.current.substring(1)"></h1>
                        </v-card-title>
                        <Configuracao/>
                        <Metodos/>
                        <Opcoes/>
                    </v-card>
                </v-flex>
            </v-layout>
        </v-container>
    </div>
</template>

<script>

    import Api from './Subcomponents/Pagamento/Api.vue'
    import Configuracao from './Subcomponents/Pagamento/Configuracao.vue'
    import Metodos from './Subcomponents/Pagamento/Metodos.vue'
    import Opcoes from './Subcomponents/Pagamento/Opcoes.vue'
    import { mapActions } from 'vuex'

    export default {
        name: "MetodoPagamento",
        data: () => ({}),
        created: function(){
            this.getConfig()
        },
        methods:{
            ...mapActions([
                "getConfig"
            ])
        },
        components:{
            Api,
            Configuracao,
            Opcoes,
            Metodos
        }
    }
</script>