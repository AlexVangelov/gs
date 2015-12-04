angular.module 'gs.settings.paymentTypes', [
  'gs.utils.store'
]
.factory 'PaymentTypeStore', ['$store', '$rootScope', ($store, $rootScope)->
  $store '/api/:uuid/payment_types/:id',
    uuid: ()->
      $rootScope.gsUuid
    id: '@_id'
  ,
    update: 
      method: 'PUT'
]
.controller 'SettingsPaymentTypesCtrl', ['$scope', 'paymentTypes', ($scope, paymentTypes)->
  $scope.paymentTypes = paymentTypes
]
