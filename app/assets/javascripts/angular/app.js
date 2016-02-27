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
                    controller: "editProjectCtrl"
                  })

                  .state('edit', {
                    url: '/project/:project_id/task/:id/edit',
                    templateUrl: 'client_views/editTask.html',
                    controller: 'editTaskCtrl'
                  });


                $urlRouterProvider.otherwise('/');

            }
        ]);


