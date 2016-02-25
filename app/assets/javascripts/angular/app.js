angular
    .module("app", ['restangular', 'ui.router', 'ngFileUpload', 'ngAnimate', 'ui.bootstrap', 'ui.bootstrap.datetimepicker'])
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
            updateValueProject: function(newValue) {
              value = newValue;
            },
            getValueProject: function() {
              return value;
            },
            updateValueTask: function(newValue) {
              value = newValue;
            },
            getValueTask: function() {
              return value;
            }

          }
        });
