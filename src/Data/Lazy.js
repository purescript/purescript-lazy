"use strict";

exports.defer = function (thunk) {
  var done = false;
  var v    = null;
  return function() {
    if (done) {
      return v;
    } else {
      v    = thunk();
      done = true;
      return v;
    }
  }
};

exports.force = function (l) {
  return l();
};
