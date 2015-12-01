angular.module 'gs.settings', [
  'ui.router',
  'ngMaterial'
  'gs.settings.origins',
  'gs.settings.operators',
  'gs.settings.resources',
  'gs.settings.paymentTypes'
]
.factory 'SettingsStore', ['$store', '$rootScope', ($store, $rootScope)->
  $store '/api/:uuid/config',
    uuid: $rootScope.gsUuid
]
.config ['$stateProvider', ($stateProvider)->
  $stateProvider
  .state 'gs.settings',
    abstract: true
    url: '/settings/:uuid'
    templateUrl: 'settings',
    controller: 'Settings',
    resolve:
      gsUuid: ['$stateParams', '$rootScope', ($stateParams, $rootScope)->
        $rootScope.gsUuid = $stateParams.uuid
      ]
      settings: [ 'SettingsStore', (SettingsStore)->
        SettingsStore.get().$promise
      ]
    params:
      uuid: undefined
  .state 'gs.settings.system',
    url: '/system'
    templateUrl: 'settings/system'
  .state 'gs.settings.operators',
    url: '/operators'
    controller: 'SettingsOperatorsCtrl as c'
    templateUrl: 'settings/operators'
    resolve:
      operators: ['OperatorStore', (OperatorStore)->
        OperatorStore.query().$promise
      ]
  .state 'gs.settings.origins',
    url: '/origins'
    controller: 'SettingsOriginsCtrl as c'
    templateUrl: 'settings/origins',
    resolve:
      origins: ['OriginStore', (OriginStore)->
        OriginStore.query().$promise
      ]
  .state 'gs.settings.paymentTypes',
    url: '/payment_types'
    templateUrl: 'settings/payment_types'
    controller: 'SettingsPaymentTypesCtrl'
    resolve: 
      payment_types: ['PaymentTypeStore', (PaymentTypeStore)->
        PaymentTypeStore.query().$promise
      ]
  .state 'gs.settings.taxGroups',
    url: '/tax_groups'
    templateUrl: 'tax_groups'
  .state 'gs.settings.resourceTypes',
    url: '/resource_types'
    templateUrl: 'resourceTypes',
    resolve: {
      resources: ['ResourceTypeStore', (ResourceStore)->
        ResourceTypeStore.query().$promise
      ]
    }
  .state 'gs.settings.resources',
    url: '/resources'
    templateUrl: 'resources',
    resolve: {
      resources: ['ResourceStore', (ResourceStore)->
        ResourceStore.query().$promise
      ]
    }
  .state 'gs.settings.departments',
    url: '/departments'
    templateUrl: 'departments'
  .state 'gs.settings.plus',
    url: '/plus'
    templateUrl: 'plus'
]  
.controller 'Settings', ['$scope', '$state', '$mdSidenav', ($scope, $state, $mdSidenav)->
  $scope.isSetting = (setting)->
    $state.includes setting
  $scope.toggleSidenav = ()->
    $mdSidenav('sidenav').toggle()
]
