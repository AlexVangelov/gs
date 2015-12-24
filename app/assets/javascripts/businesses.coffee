angular.module 'gs.business', [
  'ui.router'
  'gs.utils.store'
]
.factory 'BusinessStore', ['$store', ($store)->
  $store '/businesses/:id', 
    id: '@_id'
  ,
    update: 
      method: 'PUT'
]
.controller 'BusinessCtrl', ['$scope', '$mdDialog', 'businesses', '$state', ($scope, $mdDialog, businesses, $state)->
  $scope.businesses = businesses
  $scope.settings = (uuid)->
    $state.go 'gs.settings.system',
      uuid: uuid
]