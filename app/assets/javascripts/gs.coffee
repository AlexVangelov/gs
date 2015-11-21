# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module 'gs', [
  'ui.router', 
  'ngMessages', 
  'ngMaterial',
  'gs.devise'
]
.controller 'GsCtrl', ['$scope', '$http', '$state', '$templateCache', ($scope, $http, $state, $templateCache)->
  $scope.logOut = (url)->
    $http.delete(url).then (resp)->
      $templateCache.removeAll()
      $state.go 'gs.devise.logIn', {},
        reload: true
]
.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', '$httpProvider', ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider)->
  $urlRouterProvider.otherwise "/"
  
  $locationProvider.html5Mode true
  
  $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
  
  $stateProvider
  .state 'gs',
    abstract: true
    template: "<ui-view></ui-view>",
    controller: "GsCtrl"
  .state 'gs.index',
    url: '/',
    templateUrl: '/'
]
