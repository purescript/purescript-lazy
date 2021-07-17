"use strict";

export var defer = function (thunk) {
  var v = null;
  return function() {
    if (thunk === undefined) return v;

    v = thunk();
    thunk = undefined; // eslint-disable-line no-param-reassign
    return v;
  };
};

export var force = function (l) {
  return l();
};
