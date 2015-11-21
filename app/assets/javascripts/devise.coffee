angular.module 'gs.devise', [
  'ui.router'
]
.run ['$rootScope', '$state', ($rootScope, $state) ->
  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    $state.go 'gs.logIn' if error.status is 401
]
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'gs.logIn',
    url: '/accounts/sign_in',
    templateUrl: 'accounts/sign_in'
  .state 'gs.signUp', 
    url: '/accounts/sign_up',
    templateUrl: 'accounts/sign_up'
  .state 'gs.passwordRecovery', 
    url: '/accounts/password/new',
    templateUrl: 'accounts/password/new'
]
