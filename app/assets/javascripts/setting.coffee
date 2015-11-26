angular.module 'gs.settings', [
  'ui.router',
  'gs.settings.origins'
]
.config ['$stateProvider', ($stateProvider)->
  $stateProvider
  .state 'gs.settings',
    abstract: true
    url: '/settings'
    templateUrl: 'settings',
    resolve:
      settings: [ '$http', ($http)->
        $http.get('settings')
      ]
  .state 'gs.settings.system',
    url: '/system'
    templateUrl: 'account'
  .state 'gs.settings.origins',
    url: '/origins'
    controller: 'SettingsOriginsCtrl as c'
    templateUrl: 'origins',
    resolve: {
      origins: ['OriginStore', (OriginStore)->
        OriginStore.query()
      ]
    }
  .state 'gs.settings.resources',
    url: '/resources'
    templateUrl: 'resources'
  .state 'gs.settings.paymentTypes',
    url: '/payment_types'
    templateUrl: 'payment_types'
  .state 'gs.settings.operators',
    url: '/operators'
    templateUrl: 'operators'
  .state 'gs.settings.taxGroups',
    url: '/tax_groups'
    templateUrl: 'tax_groups'
  .state 'gs.settings.departments',
    url: '/departments'
    templateUrl: 'departments'
  .state 'gs.settings.plus',
    url: '/plus'
    templateUrl: 'plus'
]  
