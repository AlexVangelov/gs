angular.module 'gs.settings', [
  'ui.router',
  'ngMaterial'
  'gs.settings.origins',
  'gs.settings.operators',
  'gs.settings.resources',
  'gs.settings.paymentTypes',
  'gs.settings.taxGroups',
  'gs.settings.resourceTypes'
]
.factory 'SettingsStore', ['$store', '$rootScope', ($store, $rootScope)->
  $store '/api/:uuid/config',
    uuid: ()->
      $rootScope.gsUuid
]
.config ['$stateProvider', ($stateProvider)->
  $stateProvider
  .state 'gs.settings',
    abstract: true
    url: '/settings/:uuid'
    templateUrl: 'settings'
    controller: 'Settings'
    resolve:
      settings: ['$rootScope', '$stateParams', 'SettingsStore', ($rootScope, $stateParams, SettingsStore)->
        $rootScope.gsUuid = $stateParams.uuid
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
      paymentTypes: ['PaymentTypeStore', (PaymentTypeStore)->
        PaymentTypeStore.query().$promise
      ]
  .state 'gs.settings.taxGroups',
    url: '/tax_groups'
    templateUrl: 'settings/tax_groups'
    controller: ['$scope', 'taxGroups', ($scope, taxGroups)->
      $scope.taxGroups = taxGroups
    ]
    resolve:
      taxGroups: ['TaxGroupStore', (TaxGroupStore)->
        TaxGroupStore.query().$promise
      ]
  .state 'gs.settings.resourceTypes',
    url: '/resource_types'
    templateUrl: 'settings/resource_types'
    controller: ['$scope', 'resourceTypes', ($scope, resourceTypes)->
      $scope.resourceTypes = resourceTypes
    ]
    resolve: {
      resourceTypes: ['ResourceTypeStore', (ResourceTypeStore)->
        ResourceTypeStore.query().$promise
      ]
    }
  .state 'gs.settings.resources',
    url: '/resources'
    templateUrl: 'settings/resources'
    controller: ['$scope', 'resources', 'resourceTypes', ($scope, resources, resourceTypes)->
      $scope.resources = resources
    ]
    resolve:
      resources: ['ResourceStore', (ResourceStore)->
        ResourceStore.query().$promise
      ]
      resourceTypes: ['ResourceTypeStore', (ResourceTypeStore)->
        ResourceTypeStore.query().$promise
      ]
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
