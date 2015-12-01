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
  $scope.edit = (origin_id)->
    $mdDialog.show
      controller: OriginController
      templateUrl: 'origins/new.html'
      parent: angular.element(document.body)
      resolve:
        origin: ['OriginStore', (OriginStore)->
          OriginStore.get 
            id: origin_id
          .$promise
        ]
    .then (answer)->
      $scope.status = 'You said the information was "' + answer + '".'
    , ()->
      $scope.status = 'You cancelled the dialog.'
  $scope.settings = (uuid)->
    $state.go 'gs.settings.system',
      uuid: uuid
]
OriginController = ['$scope', '$mdDialog', '$http', 'origin', ($scope, $mdDialog, $http, origin)->
  $scope.item = origin
  $scope.hide = ()->
    $mdDialog.hide()
  $scope.cancel = ()->
    $mdDialog.cancel()
  $scope.save = ()->
    # console.log 'Save'
    if $scope.item.id
      operation = origin.$update $scope.item
    else
      operation = $scope.item.$save $scope.item
    operation.then (resp)->
      console.log resp
      #origins.push
      $mdDialog.hide('OK')
    .catch (resp)->
      console.error resp
  $scope.delete = ()->
    $scope.item.$delete
      id: $scope.item.id
    .then ()->
      $mdDialog.hide('OK')
]