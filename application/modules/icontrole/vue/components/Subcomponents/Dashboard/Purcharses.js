import { Bar } from 'vue-chartjs'
import { mapGetters } from 'vuex'
import colors from 'vuetify/es5/util/colors'

export default Chart = {
    extends: Bar,
    computed: {
        ...mapGetters([
            "dateorders"
        ])
    },
    methods:{
        generateColor(){
            let rgb = []
            for(var i = 0; i < 12; i++){
                let r = Math.floor(Math.random()*255)+1,
                    g = Math.floor(Math.random()*255)+1,
                    b = Math.floor(Math.random()*255)+1
                rgb.push(`rgb(${r},${g},${b}`)
            }
            return rgb
        }
    },
    watch:{
        dateorders(current){
            this.renderChart({
                labels: Object.keys(current),
                datasets: [
                    {
                        label: 'Vendas',
                        backgroundColor: colors.orange.accent1,
                        borderColor: this.generateColor(),
                        data: Object.values(current)
                    }
                ]
            })
            let h1 = document.getElementById("loadingcomponents")
            this.$el.removeChild(h1)
        }
    },
    mounted: function() {
        let h1 = document.createElement("h1")
        h1.classList.add("headline")
        h1.id = "loadingcomponents"
        h1.innerText = "Gerando gráfico de vendas..."
        this.$el.appendChild(h1)
    }
}