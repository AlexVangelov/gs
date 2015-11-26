angular.module 'gs.settings.origins', [
  'ngResource'
]
.factory 'OriginStore', ['$resource', ($resource)->
  $resource '/origins/:id', 
    id: '@_id'
  ,
    update: 
      method: 'PUT'
]
.controller 'SettingsOriginsCtrl', ['$scope', '$mdDialog', 'origins', ($scope, $mdDialog, origins)->
  $scope.items = origins
  $scope.edit = (origin_id)->
    $mdDialog.show
      controller: OriginController
      templateUrl: 'origins/new.html'
      parent: angular.element(document.body)
      resolve:
        origin: ['OriginStore', (OriginStore)->
          OriginStore.get 
            id: origin_id
        ]
    .then (answer)->
      $scope.status = 'You said the information was "' + answer + '".'
    , ()->
      $scope.status = 'You cancelled the dialog.'
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
      operation = $scope.item.$update $scope.item
    else
      operation = $scope.item.$save()
    operation.then ()->
      $mdDialog.hide('OK')
    .catch (resp)->
      console.error resp
  $scope.delete = ()->
    $scope.item.$delete
      id: $scope.item.id
    .then ()->
      $mdDialog.hide('OK')
]