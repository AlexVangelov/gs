angular.module 'gs.util.flash', [
  'ui.router'
]
.value '$flash', 
  alert: undefined,
  notice: undefined
.run ['$rootScope', '$flash', ($rootScope, $flash)->
  carry = true
  $rootScope.$on '$stateChangeStart', ()->
    hasFlash = $flash.alert or $flash.notice
    if hasFlash and !carry
      $flash.alert = undefined
      $flash.notice = undefined
      carry = true
    else
      carry = false
]
.directive 'flashMessages', ['$flash', ($flash)->
  {
    restrict: 'AE',
    template: '<md-subheader ng-show="alert()" class="md-warn md-no-sticky">{{alert()}}</md-subheader>',
    link: (scope, element, attrs)->
      scope.alert = ()->
        $flash.alert
      scope.notice = ()->
        $flash.notice
  }
]