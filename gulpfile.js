/* jshint node: true */
"use strict";

var gulp = require("gulp");
var jshint = require("gulp-jshint");
var jscs = require("gulp-jscs");
var plumber = require("gulp-plumber");
var purescript = require("gulp-purescript");
var rimraf = require("rimraf");

var sources = [
  "src/**/*.purs",
  "bower_components/purescript-*/src/**/*.purs"
];

var foreigns = [
  "src/**/*.js",
  "bower_components/purescript-*/src/**/*.js"
];

gulp.task("clean-docs", function (cb) {
  rimraf("docs", cb);
});

gulp.task("clean-output", function (cb) {
  rimraf("output", cb);
});

gulp.task("clean", ["clean-docs", "clean-output"]);

gulp.task("lint", function() {
  return gulp.src("src/**/*.js")
    .pipe(jshint())
    .pipe(jshint.reporter())
    .pipe(jscs());
});

gulp.task("make", ["lint"], function() {
  return gulp.src(sources)
    .pipe(plumber())
    .pipe(purescript.pscMake({ ffi: foreigns }));
});

gulp.task("docs", ["clean-docs"], function () {
  return gulp.src(sources)
    .pipe(plumber())
    .pipe(purescript.pscDocs({
      docgen: {
        "Data.Lazy": "docs/Data.Lazy.md"
      }
    }));
});

gulp.task("dotpsci", function () {
  return gulp.src(sources)
    .pipe(plumber())
    .pipe(purescript.dotPsci());
});

gulp.task("default", ["make", "docs", "dotpsci"]);
