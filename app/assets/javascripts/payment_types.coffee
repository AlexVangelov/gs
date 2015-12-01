angular.module 'gs.settings.paymentTypes', [
  'gs.utils.store'
]
.factory 'PaymentTypeStore', ['$store', '$rootScope', ($store, $rootScope)->
  $store '/api/:uuid/payment_types/:id',
    uuid: $rootScope.gsUuid
    id: '@_id'
  ,
    update: 
      method: 'PUT'
]
.controller 'SettingsPaymentTypesCtrl', ['$scope', 'payment_types', ($scope, payment_types)->
  $scope.payment_types = payment_types
]
