angular.module 'gs.util.help', [
  'ngMaterial'
]
.directive 'helpCard', [()->
  {
    restrict: 'AE',
    template: '<md-card class="help-card" ng-class="{open: help}">'+
              '  <md-card-title>'+
              '    <md-card-title-text>'+
              '      <span class="md-headline">Help Tutorial</span>'+
              '    </md-card-title-text>'+
              '  </md-card-title>'+
              '  <md-card-content>'+
              '    What is it and how it works...'+
              '  </md-card-content>'+
              '  <md-card-actions layout="row" layout-align="center center">'+
              '    <md-button ng-click="help = !help" class="md-fab md-raised help-close-btn">'+
              '      <span class="close-label">Close</span>'+
              '      <span class="open-label">?</span>'+
              '    </md-button>'+
              '  </md-card-actions>'+
              '</md-card>'
  }
]