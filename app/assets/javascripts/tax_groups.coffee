angular.module 'gs.settings.taxGroups', [
  'gs.utils.store'
]
.factory 'TaxGroupStore', ['$store', '$rootScope', ($store, $rootScope)->
  $store '/api/:uuid/tax_groups/:id',
    uuid: ()->
      $rootScope.gsUuid
    id: '@_id'
  ,
    update: 
      method: 'PUT'
]
