"use strict";

const Path = require("path");
const Webpack = require("webpack");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const ExtractSASS = new ExtractTextPlugin("bundle.css");

module.exports = options => {
  const webpackConfig = {
    devtool: options.devtool,
    entry: [
      `webpack-dev-server/client`,
      "webpack/hot/dev-server",
      "./src/index"
    ],
    output: {
      path: Path.join(__dirname, "dist"),
      filename: "bundle.js"
    },
    plugins: [
      new Webpack.ProvidePlugin({
        riot: "riot"
      }),
      new Webpack.DefinePlugin({
        "process.env": {
          NODE_ENV: JSON.stringify(
            options.isProduction ? "production" : "development"
          )
        }
      }),
      new HtmlWebpackPlugin({
        template: "./src/index.html"
      })
    ],
    module: {
      preLoaders: [
        {
          test: /\.tag$/,
          exclude: /node_modules/,
          include: /src/,
          loader: "riotjs-loader",
          query: {
            type: "none"
          }
        }
      ],
      loaders: [
        {
          test: /\.js$|\.tag$/,
          exclude: /(node_modules|bower_components)/,
          loader: "babel",
          query: {
            presets: ["es2015"]
          }
        },
        {
          test: /\.(jpe?g|png|gif|svg)$/i,
          loader: "file-loader?name=img/[name].[ext]"
        },
        {
          test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
          loader:
            "url-loader?name=fonts/[name].[ext]&limit=10000&mimetype=application/font-woff"
        },
        {
          test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
          loader: "file-loader?name=fonts/[name].[ext]"
        }
      ]
    }
  };

  if (options.isProduction) {
    webpackConfig.entry = ["./src/index"];

    webpackConfig.plugins.push(
      new Webpack.optimize.OccurenceOrderPlugin(),
      new Webpack.optimize.UglifyJsPlugin({
        compressor: {
          warnings: false
        }
      }),
      ExtractSASS
    );

    webpackConfig.module.loaders.push({
      test: /\.scss$/i,
      loader: ExtractSASS.extract(["css", "sass"])
    });
  } else {
    webpackConfig.plugins.push(new Webpack.HotModuleReplacementPlugin());

    webpackConfig.module.loaders.push(
      {
        test: /\.scss$/i,
        loaders: ["style", "css", "sass"]
      },
      {
        test: /\.js$/,
        loader: "eslint",
        exclude: /node_modules/
      }
    );

    webpackConfig.devServer = {
      host: "0.0.0.0",
      contentBase: "./dist",
      hot: true,
      port: options.port,
      inline: true,
      progress: true,
      disableHostCheck: true
    };
  }

  return webpackConfig;
};
