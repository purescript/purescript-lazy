/* global exports */
"use strict";

// module Data.Lazy

exports.defer = function(thunk) {
  if (this instanceof defer) {
    this.thunk = thunk;
    return this;
  } else {
    return new defer(thunk);
  }
};

exports.defer.prototype.force = function () {
  var value = this.thunk();
  delete this.thunk;
  this.force = function () {
      return value;
  };
  return value;
};

exports.force = function(l) {
  return l.force();
};