angular.module 'gs.settings.origins', [
  'gs.utils.store'
]
.factory 'OriginStore', ['$store', '$rootScope', ($store, $rootScope)->
  $store '/api/:uuid/origins/:id',
    uuid: ()->
      $rootScope.gsUuid
    id: '@_id'
  ,
    update: 
      method: 'PUT'
]
.controller 'SettingsOriginsCtrl', ['$scope', '$mdDialog', 'origins', ($scope, $mdDialog, origins)->
  $scope.origins = origins
]
