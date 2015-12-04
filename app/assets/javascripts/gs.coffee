angular.module 'gs', [
  'ui.router', 
  'ngMessages', 
  'ngMaterial',
  'gs.devise',
  'gs.utils',
  'gs.business',
  'gs.settings'
]
.controller 'GsCtrl', ['$scope', '$http', '$state', '$templateCache', '$mdDialog', ($scope, $http, $state, $templateCache, $mdDialog)->
  $scope.logOut = (url)->
    $http.delete(url).then (resp)->
      $templateCache.removeAll()
      $state.go 'gs.devise.logIn', {},
        reload: true
  $scope.resourceDialog = (template, id, collection)->
    console.log template.replace("/","_").concat("_").concat(id)
    if id is 'new'
      initiator = '.add-item-btn'
    else
      initiator = '#'.concat(template.replace("/","_")).concat("_").concat(id)
    resource = {}
    for item in collection
      if item.id is id
        resource = item
        break
    $mdDialog.show
      openFrom: initiator
      closeTo: if id is 'new' then undefined else initiator
      controller: ['$scope', '$mdDialog', 'resource', ($scope, $mdDialog, resource)->
        $scope.originalResource = resource
        $scope.resource = angular.copy(resource)
        $scope.cancel = $mdDialog.cancel
        $scope.save = ()->
          if resource.id
            $scope.resource.$update
              id: resource.id
            .then (resp)->
              $mdDialog.hide 
                resource: $scope.resource
                action: 'update'
          else
            $scope.resource.$save().then (resp)->
              $mdDialog.hide 
                resource: $scope.resource
                action: 'add'
        $scope.destroy = ()->
          $scope.resource.$delete
            id: resource.id
          .then (resp)->
            $mdDialog.hide 
              resource: $scope.resource, 
              action: 'destroy'
      ]
      templateUrl: template
      parent: angular.element(document.body)
      resolve:
        resource: ()->
          if resource.id
            resource.$get
              id: resource.id
          else
            collection.$new resource
    .then (result)->
      if result.resource
        for item in collection
          if item.id is result.resource.id
            existingResource = item
            break
        if existingResource
          if result.action is 'destroy'
            index = collection.indexOf existingResource
            collection.splice index, 1 unless index < 0
          else
            angular.extend existingResource, result.resource
        else if result.action is 'add'
          collection.push result.resource
]
.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', '$httpProvider', ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider)->
  $urlRouterProvider.otherwise "/"
  
  $locationProvider.html5Mode true
  
  $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
  
  $stateProvider
  .state 'gs',
    abstract: true
    template: '<ui-view layout="column" flex></ui-view>',
    controller: "GsCtrl"
  .state 'gs.index',
    url: '/',
    controller: 'BusinessCtrl'
    templateUrl: 'businesses.html'
    resolve:
      businesses: ['BusinessStore', (BusinessStore)->
        BusinessStore.query().$promise
      ]
]
