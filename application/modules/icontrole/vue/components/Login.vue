<template>
    <v-app id="inspire" >
        <v-snackbar :timeout="6000" top right v-model="snackbar">
            Administrador não encontrado
            <v-btn flat color="pink" @click.native="snackbar = false">Fechar</v-btn>
        </v-snackbar>
        <v-parallax style="height: 100%;" :src="img">
            <v-content>
                <v-container fluid fill-height>
                    <v-layout align-center justify-center row wrap>
                        <v-flex xs12 sm8 md4>
                            <v-card class="elevation-12">
                                <v-toolbar dark color="primary">
                                    <v-toolbar-title>Icontrole - CASA FELIZ</v-toolbar-title>
                                    <v-spacer></v-spacer>
                                </v-toolbar>
                                <v-card-text>
                                    <v-form>
                                        <v-text-field v-model="user.email" prepend-icon="email" name="login" label="Email" type="text"></v-text-field>
                                        <v-text-field v-model="user.password" id="password" prepend-icon="lock" :append-icon="viewpasswd ? 'visibility_off' : 'visibility'" @click:append="() => {viewpasswd = !viewpasswd}" name="Senha" label="Password" :type="viewpasswd ? 'text' : 'password'"></v-text-field>
                                    </v-form>
                                </v-card-text>
                                <v-card-actions>
                                    <v-spacer></v-spacer>
                                    <v-btn color="primary" :disabled="!user.email || !user.password" @click="login">Login</v-btn>
                                </v-card-actions>
                            </v-card>
                            <br>
                            <h5 class="text-xs-center"> &copy; {{new Date().getFullYear()}} Desenvolvido por Webearte</h5>
                        </v-flex>
                    </v-layout>
                </v-container>
            </v-content>
        </v-parallax>
    </v-app>
</template>

<script>
    export default {
        name: "Login",
        data: () => ({
            viewpasswd: false,
            snackbar: false,
            user: {
                email: "",
                password: ""
            },
            img: "https://visualhunt.com/photos/3/coding-programming-working-macbook-laptop.jpg?s=l"
        }),
        methods:{
            login(){
                this.$http.post(window.location.href+"/login",{user:this.user})
                    .then(response => {
                        if(response.data === "login"){
                            window.location.href = "/2018/icontrole"
                        }
                        else{
                            this.snackbar = true
                        }
                    })
                    .catch(err => console.error(err))
            }
        }
    }
</script>

<style scoped>
    img{
        filter: blur(2px);
    }
</style>