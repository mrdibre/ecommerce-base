'use strict'
const _ = require('lodash')
const path = require('path')
const fs = require('fs')
const UglifyJsPlugin = require('uglifyjs-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin')
const { VueLoaderPlugin } = require('vue-loader')
const webpack = require("webpack")

let mode = process.env.NODE_ENV

const entryMap = {};

function getNamesFromDirectory(filepath)
{
    const files = fs.readdirSync(filepath);
    const files2 = files.filter(file => file.match(/(.js)$/g));

    return _.chain(files2)
        .filter(filename => filename[0] !== '#')
        .map(function (filename) {
            let entryName, ext;

            if (fs.lstatSync(`${filepath}/${filename}`).isDirectory()) {
                entryName = filename;
            } else {
                ext = path.extname(filename);
                entryName = filename.substr(0, filename.length - ext.length);
            }

            return entryName;
        })
        .value();
}

for (const module of fs.readdirSync('./application/modules')) {
    for (const common of getNamesFromDirectory(`./application/modules/${module}/vue`)) {
        entryMap[`${module}/${common}`] = `./application/modules/${module}/vue/${common}`;
    }
}

module.exports = {
    mode: mode,
    entry: entryMap,
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'public/assets')
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: [
                    'vue-style-loader',
                    {
                        loader: 'css-loader'
                    }
                ]
            },
            {
                test: /\.vue$/,
                loader: 'vue-loader'
            },
            {
                test: /\.less$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    'css-loader',
                    'less-loader'
                ]
            }
        ]
    },
    plugins: [
        new webpack.optimize.OccurrenceOrderPlugin(),
        new VueLoaderPlugin(),
        new MiniCssExtractPlugin({
            filename: '[name].bundle.css'
        })

    ],
    optimization: {
        minimizer: [
            new UglifyJsPlugin({
                cache: true,
                parallel: true,
                sourceMap: true
            }),
            new OptimizeCSSAssetsPlugin({})
        ]
    },
    resolve: {
        alias: {
            'vue$': 'vue/dist/vue.esm.js'
        }
    },
}
