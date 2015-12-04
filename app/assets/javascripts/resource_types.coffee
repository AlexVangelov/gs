angular.module 'gs.settings.resourceTypes', [
  'gs.utils.store'
]
.factory 'ResourceTypeStore', ['$store', '$rootScope', ($store, $rootScope)->
  $store '/api/:uuid/resource_types/:id',
    uuid: ()->
      $rootScope.gsUuid
    id: '@_id'
  ,
    update: 
      method: 'PUT'
]
