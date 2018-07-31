<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> <?= $this->tag->gettitle() ?>
    <meta name="description" content="">
    <meta name="author" content="César Felipe <cfrdesenvolvimento@gmail.com>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="theme-color" content="#1565c0">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="application-name" content="UDIPOP">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="UDIPOP">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div id="app">
    <v-app>
        <div class="page-container">
            <v-navigation-drawer :clipped="$vuetify.breakpoint.lgAndUp" v-model="drawer" stateless hide-overlay fixed :mini-variant.sync="variant" app>
                <v-list dense>
                    <template v-for="item in menuoptions">
                        <v-divider  v-if="item.text === 'divider'"></v-divider>
                        <v-list-tile v-else ripple :key="item.text" :href="item.route">
                            <v-list-tile-action>
                                <v-icon><?= '{{ item.icon}}' ?></v-icon>
                            </v-list-tile-action>
                            <v-list-tile-content>
                                <v-list-tile-title> <?= '{{ item.text}}' ?> </v-list-tile-title>
                            </v-list-tile-content>
                        </v-list-tile>
                    </template>
                </v-list>
            </v-navigation-drawer>
            <v-toolbar :clipped-left="$vuetify.breakpoint.lgAndUp" color="blue darken-3" dark app fixed>
                <v-toolbar-title style="width: 300px" class="ml-0 pl-3">
                    <v-toolbar-side-icon @click="variant = !variant"></v-toolbar-side-icon> <span class="hidden-sm-and-down">UDIPOP <?= ($this->session->get('PagSeguroDesativado') ? $this->flashSession->output() : '') ?></span> </v-toolbar-title>
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
                                    <v-list-tile-sub-title><?= (isset($this->session) ? $this->session->get('icontrole') : 'Visitante') ?></v-list-tile-sub-title>
                                </v-list-tile-content>
                            </v-list-tile>
                        </v-list>
                        <v-divider></v-divider>
                    </v-card>
                </v-menu>
                <v-btn icon large>
                    <v-icon>exit_to_app</v-icon>
                </v-btn>
            </v-toolbar>
            <v-content> <?= $this->getContent() ?> </v-content>
        </div>
    </v-app>
</div>

<?= $this->tag->javascriptInclude('icontrole/main.bundle.js') ?>
<?= $this->assets->outputJs() ?>
</body>
</html>