angular.module 'gs.settings.origins', [
  'ngResource'
]
.factory 'OriginStore', ['$resource', ($resource)->
  console.log 'OriginStore'
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
        # origin: ['$http', ($http)->
          # $http.get 'origins/'+origin_id
          # .then (resp)->
            # resp.data
        # ]
        origin: ['OriginStore', (OriginStore)->
          console.log 'resolve'
          OriginStore.get 
            id: origin_id
        ]
    .then (answer)->
      $scope.status = 'You said the information was "' + answer + '".'
    , ()->
      $scope.status = 'You cancelled the dialog.'
]
OriginController = ['$scope', '$mdDialog', '$http', 'origin', ($scope, $mdDialog, $http, origin)->
  console.log origin
  $scope.item = origin
  $scope.hide = ()->
    $mdDialog.hide()
  $scope.cancel = ()->
    $mdDialog.cancel()
  $scope.save = ()->
    console.log 'Save'
    if $scope.item.id
      operation = $http.put 'origins/'+$scope.item.id, $scope.item
    else
      operation = $http.post 'origins', $scope.item
    operation.then ()->
      $mdDialog.hide('OK')
    .catch (resp)->
      console.error resp
]