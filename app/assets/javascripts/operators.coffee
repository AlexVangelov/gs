angular.module 'gs.settings.operators', [
  'gs.utils.store'
]
.factory 'OperatorStore', ['$store', '$rootScope', ($store, $rootScope)->
  $store '/api/:uuid/operators/:id',
    uuid: ()->
      $rootScope.gsUuid
    id: '@_id'
  ,
    update: 
      method: 'PUT'
]
.controller 'SettingsOperatorsCtrl', ['$scope', '$mdDialog', 'operators', ($scope, $mdDialog, operators)->
  $scope.operators = operators
]
