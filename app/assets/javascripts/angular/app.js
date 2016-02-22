angular
    .module("app", ['restangular', 'ui.router', 'ngFileUpload', 'ngAnimate'])
        .config([
            '$stateProvider',
            '$urlRouterProvider',
            '$locationProvider',
            function($stateProvider, $urlRouterProvider) {

                $stateProvider
                  .state('/', {
                    url: '/',
                    templateUrl: 'client_views/index.html',
                    controller: 'projectCtrl'
                  })

                  .state('project/edit', {
                    url: '/project/:id/edit',
                    templateUrl: 'client_views/editProject.html',
                    controller: 'editProjectCtrl'
                  })

                  .state('edit', {
                    url: '/task/:id/edit',
                    templateUrl: 'client_views/edit.html',
                    controller: 'editTaskCtrl'
                  });

                $urlRouterProvider.otherwise('/');

            }
        ])
        .factory('Id', function(){
          var value = '';
          return {
            updateValue: function(newValue) {
              value = newValue;
            },
            getValue: function() {
              return value;
            }
          }
        });
