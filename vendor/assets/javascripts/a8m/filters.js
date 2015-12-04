/**
 * @ngdoc module
 * @name angular.filters
 * @description
 * Bunch of useful filters for angularJS
 */

//= require 'a8m/common'
//= require 'a8m/provider/watcher'
//= require 'a8m/filter/group-by'

angular.module('angular.filter', [
  'a8m.group-by',
  'a8m.filter-watcher'
]);