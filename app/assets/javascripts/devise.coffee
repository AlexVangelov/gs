angular.module 'gs.devise', [
  'ui.router'
]
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'gs.logIn',
    url: '/sign_in',
    templateUrl: 'accounts/sign_in'
  .state 'gs.signUp', 
    url: '/sign_up',
    templateUrl: 'accounts/sign_up'
  .state 'gs.passwordRecovery', 
    url: '/password_recovery',
    templateUrl: 'accounts/password/new'
]
