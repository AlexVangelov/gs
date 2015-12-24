angular.module 'gs.settings.resources', [
  'ngResource',
  'angular.filter'
]
.factory 'ResourceStore',['$store', '$rootScope', ($store, $rootScope)->
  $store '/api/:uuid/resources/:id',
    uuid: ()->
      $rootScope.gsUuid
    id: '@_id'
  ,
    update: 
      method: 'PUT'
]
.controller 'SettingsResourcesCtrl', ['$scope', '$mdDialog', 'resources', ($scope, $mdDialog, resources)->
  $scope.items = origins
]