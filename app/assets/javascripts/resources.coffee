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
  $scope.edit = (item_id)->
    $mdDialog.show
      controller: SettingsItemController
      templateUrl: 'resources/new.html'
      parent: angular.element(document.body)
      resolve:
        item: ['ResourceStore', (ResourceStore)->
          ResourceStore.get 
            id: item_id
          .$promise
        ]
    .then (answer)->
      $scope.status = 'You said the information was "' + answer + '".'
    , ()->
      $scope.status = 'You cancelled the dialog.'
]
SettingsItemController = ['$scope', '$mdDialog', '$http', 'origin', ($scope, $mdDialog, $http, item)->
  $scope.item = item
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