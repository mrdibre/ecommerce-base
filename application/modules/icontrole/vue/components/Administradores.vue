<template>
    <div>
        <v-dialog v-model="dialog" max-width="500px">
            <v-btn slot="activator" color="primary" dark class="mb-2">CADASTRAR</v-btn>
            <v-card>
                <v-card-title>
                    <span class="headline">{{ formTitle }}</span>
                </v-card-title>
                <v-card-text>
                    <v-container grid-list-md>
                        <v-layout wrap>
                            <v-flex xs12>
                                <v-text-field v-model="editedItem.name" label="Nome"></v-text-field>
                            </v-flex>
                            <v-flex xs12>
                                <v-text-field v-model="editedItem.email" label="Email"></v-text-field>
                            </v-flex>
                            <v-flex xs12>
                                <v-layout row wrap>
                                    <v-flex xs8>
                                        <v-text-field hint="Deve conter pelo menos 8 caracteres" :type="viewpasswd ? 'text' : 'password'" v-model="editedItem.passwd" label="Senha" :append-icon="viewpasswd ? 'visibility_off' : 'visibility'" @click:append="() => {viewpasswd = !viewpasswd}"></v-text-field>
                                    </v-flex>
                                    <v-flex xs4>
                                        <v-btn @click="generatePasswd">GERAR</v-btn>
                                    </v-flex>
                                </v-layout>
                            </v-flex>
                        </v-layout>
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" flat @click.native="close">Cancelar</v-btn>
                    <v-btn :disabled="!editedItem.email || !editedItem.name || (!editedItem.passwd || editedItem.passwd.length < 8)" color="blue darken-1" @click.native="save">Salvar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        <v-card>
            <v-card-title>
                ADMINISTRADORES
                <v-spacer></v-spacer>
                <v-text-field
                        v-model="search"
                        append-icon="search"
                        label="Procurar"
                        single-line
                ></v-text-field>
            </v-card-title>
            <v-card-text>
                <v-data-table
                        :headers="headers"
                        :items="desserts"
                        :search="search"
                        hide-actions
                        class="elevation-1"
                >
                    <template slot="items" slot-scope="props">
                        <td>{{ props.item.name }}</td>
                        <td class="text-xs-left">{{ props.item.email }}</td>
                        <td class="justify-center layout px-0">
                            <v-btn icon class="mx-0" @click="editItem(props.item)">
                                <v-icon color="teal">edit</v-icon>
                            </v-btn>
                            <v-btn icon class="mx-0" @click="deleteItem(props.item)">
                                <v-icon color="pink">delete</v-icon>
                            </v-btn>
                        </td>
                    </template>
                </v-data-table>
            </v-card-text>
        </v-card>
    </div>
</template>

<script>
    export default {
        name: "Administradores",
        data: () => ({
            search: "",
            dialog: false,
            viewpasswd: false,
            headers: [
                { text: 'Nome', value: 'name', align: false },
                { text: 'Email', value: 'email', align: false },
                { text: 'Opções', value: 'opts', align: false, sortable: false },
            ],
            desserts: [],
            editedIndex: -1,
            editedItem: {
                name: '',
                email: '',
                passwd: ''
            },
            defaultItem: {
                name: '',
                email: '',
                passwd: ''
            },
        }),

        computed: {
            formTitle () {
                return this.editedIndex === -1 ? 'Novo' : 'Editar'
            }
        },

        watch: {
            dialog (val) {
                val || this.close()
            }
        },

        created () {
            this.$http.post(window.location.path)
                .then(response => {
                    if(response.data.hasOwnProperty("adms")){
                        this.desserts = response.data.adms
                    }
                })
                .catch(err => console.error(err))
        },

        methods: {

            editItem (item) {
                this.editedIndex = this.desserts.indexOf(item)
                this.editedItem = Object.assign({}, item)
                this.dialog = true
            },

            deleteItem (item) {
                this.$http.post(window.location.pathname+"/delete/"+item._id.$oid)
                    .then(response => {
                        if(response.data.status === "success") this.desserts.splice(this.desserts.indexOf(item), 1)
                        else console.log(response)
                    })
                    .catch(err => console.error(err))
            },

            close () {
                this.dialog = false
                setTimeout(() => {
                    this.editedItem = Object.assign({}, this.defaultItem)
                    this.editedIndex = -1
                }, 300)
            },

            save () {
                if (this.editedIndex > -1) {
                    this.$http.post(window.location.pathname+"/update",{administradores:this.editedItem})
                        .then(response => {
                            if(response.data.hasOwnProperty("status") && response.data.status === "success") Object.assign(this.desserts[this.editedIndex], this.editedItem)
                            else console.log(response)
                        })
                        .catch(err => console.error(err))
                } else {
                    this.$http.post(window.location.pathname+"/create",{administradores:this.editedItem})
                        .then(response => {
                            if(response.data.hasOwnProperty("status") && response.data.status === "success"){
                                this.editedItem._id = response.data.id
                                this.desserts.push(this.editedItem)
                            }
                            else console.log(response)
                        })
                        .catch(err => console.error(err))
                }
                this.close()
            },

            generatePasswd(){

                let str = Math.random().toString(36).substr(2)
                str = str.substr(0,8)
                this.editedItem.passwd = str

            }
        }
    }
</script>

<style scoped>

</style>