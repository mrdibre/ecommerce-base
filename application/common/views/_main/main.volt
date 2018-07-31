<!DOCTYPE html>
<html lang="pt-BR">
<head>

    <meta charset="UTF-8">
    {{ getTitle() }}
    <meta name="description" content="Icontrole">
    <meta name="author" content="César Felipe <cfrdesenvolvimento@gmail.com>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="theme-color" content="#1565c0">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="application-name" content="UDIPOP">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="UDIPOP">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>

        .loading{
            width: 20%;
            height: 5px;
            position: absolute;
            border-radius: 4px;
            background-color: #666EE8;
            animation: load infinite 2s ease-in-out;
        }

        @keyframes load {
            0%{
                left: 0;
                width: 10%;
            }
            25%{
                width: 20%;
            }
            50%{
                left: 90%;
                width: 10%;
            }
            75%{
                width: 20%;
            }
            100%{
                left: 0;
                width: 10%;
            }
        }

    </style>

    <script>
        window.onload = function () {
            document.body.removeChild( document.querySelector(".loader") )
        }
    </script>

</head>
<body>

<div class="loader" style="background-color: #FFF;width: 100%;height: 100%;position: fixed;z-index: 1000">
    <div class="spinner" style="width: 100%;height: 10px;position: absolute;top:50%;left:50%;transform: translateX(-50%) translateY(-50%);text-align: center;padding: 0 10px;">
        <div class="loading"></div>
    </div>
</div>

<div id="app">
    <v-app>
        <div class="page-container">
            <v-navigation-drawer  v-model="drawer" app fixed :mini-variant.sync="variant">
                <v-toolbar flat class="transparent" v-if="!variant">
                    <v-list class="pa-0">
                        <v-list-tile avatar>
                            <img alt="Icontrole logo" width="200" src="{{ url.getStatic() }}icons/icontrole.png" >
                        </v-list-tile>
                    </v-list>
                </v-toolbar>
                <v-list dense>
                    <template v-for="item in menuoptions" no-action>
                        <v-divider  v-if="item.text === 'divider'"></v-divider>

                        <template v-else-if="item.children">
                            <v-list>
                                <v-list-group :prepend-icon="item.icon" no-action  v-model="item.active">
                                    <v-list-tile slot="activator">
                                        <v-list-tile-content>
                                            <v-list-tile-title>{{ '{{ item.text }}' }}</v-list-tile-title>
                                        </v-list-tile-content>
                                    </v-list-tile>

                                    <v-list-tile v-for="child in item.children" :key="JSON.stringify(child)" @click="" :href="child.route">
                                        <v-list-tile-action>
                                            <v-icon>{{ '{{ child.icon }}' }}</v-icon>
                                        </v-list-tile-action>
                                        <v-list-tile-content>
                                            <v-list-tile-title>{{ '{{ child.text }}' }}</v-list-tile-title>
                                        </v-list-tile-content>
                                    </v-list-tile>
                                </v-list-group>
                            </v-list>
                        </template>

                        <v-list-tile v-else ripple v-model="item.active" :href="item.route">
                            <v-list-tile-action>
                                <v-icon>{{ '{{ item.icon}}' }}</v-icon>
                            </v-list-tile-action>
                            <v-list-tile-content>
                                <v-list-tile-title> {{ '{{ item.text}}' }} </v-list-tile-title>
                            </v-list-tile-content>
                        </v-list-tile>
                    </template>
                </v-list>
            </v-navigation-drawer>
            <v-toolbar color="primary" dark app fixed>
                <v-toolbar-title style="width: 300px" class="ml-0 pl-3">
                    <v-toolbar-side-icon @click="variant = !variant"></v-toolbar-side-icon>
                    <span class="hidden-sm-and-down">CASA FELIZ {{ session.get("PagSeguroDesativado") ? flashSession.output() : '' }}</span>
                </v-toolbar-title>
                <v-spacer></v-spacer>
                <v-menu origin="left" transition="slide-y-transition" bottom :close-on-content-click="false" v-model="menu" offset-y>
                    <v-btn icon slot="activator">
                        <v-badge color="red" overlap right>
                            <v-icon>account_circle</v-icon>
                        </v-badge>
                    </v-btn>
                    <v-card>
                        <v-list>
                            <v-list-tile avatar>
                                <v-list-tile-content>
                                    <v-list-tile-title>Logado como: </v-list-tile-title>
                                    <v-list-tile-sub-title>{{ this.session is defined ? this.session.get("icontrole") : 'Visitante' }}</v-list-tile-sub-title>
                                </v-list-tile-content>
                            </v-list-tile>
                        </v-list>
                        <v-divider></v-divider>
                    </v-card>
                </v-menu>
                <v-btn icon large href="/2018/icontrole/logout">
                    <v-icon>exit_to_app</v-icon>
                </v-btn>
            </v-toolbar>
            <v-content> {{ content() }} </v-content>
        </div>
    </v-app>
</div>

{{ javascript_include('icontrole/main.bundle.js') }}
{{ assets.outputJs() }}

</body>
</html>
