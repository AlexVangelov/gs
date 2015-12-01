angular.module 'gs.sale', [
  'ui.router', 
  'ngMessages', 
  'ngMaterial'
]
.controller 'GsSaleCtrl', ['$scope', '$http', '$state', '$templateCache', '$mdDialog', ($scope, $http, $state, $templateCache, $mdDialog)->
  console.log "init"
]
.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', '$httpProvider', ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider)->
  # $urlRouterProvider.when '/sale/:uuid', ['$location', ($location)->
    # console.log 'when'
    # console.log $location
    # '/sale'
  # ]
  #$urlRouterProvider.otherwise '/salez'
  
  $locationProvider.html5Mode true
  
  $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
  
  $stateProvider
  .state 'gs',
    abstract: true
    template: '<ui-view layout="column" flex></ui-view>',
  .state 'gs.sale',
    url: '/sale/:uuid'
    template: '<ui-view layout="column" flex>sale interface</ui-view>',
    controller: "GsSaleCtrl"
    resolve:
      gsUuid: ['$stateParams', '$rootScope', ($stateParams, $rootScope)->
        $rootScope.gsUuid = $stateParams.uuid
      ]
      config: ['$rootScope', ($rootScope)->
        console.log $rootScope.gsUuid
      ]
]