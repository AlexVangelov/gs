angular.module 'gs.devise', [
  'ui.router'
]
.run ['$rootScope', '$state', ($rootScope, $state) ->
  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error)->
    if error.status is 401
      console.log error.data
      $state.go 'gs.devise.logIn' if error.status is 401
]
.controller 'DeviseCtrl', ['$scope', '$http', '$state', ($scope, $http, $state)->
  self = @
  $scope.account = {}
  $scope.authenticate = (url)->
    $http.post(url, account: $scope.account).then (resp)->
      $state.go 'gs.index'
]
.config ['$stateProvider', ($stateProvider)->
  $stateProvider
  .state 'gs.devise',
    abstract: true
    template: '<ui-view></ui-view>',
    controller: 'DeviseCtrl'
  .state 'gs.devise.logIn',
    url: '/accounts/sign_in',
    templateUrl: 'accounts/sign_in'
  .state 'gs.devise.signUp', 
    url: '/accounts/sign_up',
    templateUrl: 'accounts/sign_up'
  .state 'gs.devise.passwordRecovery', 
    url: '/accounts/password/new',
    templateUrl: 'accounts/password/new'
]