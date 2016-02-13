angular
    .module("app", ['restangular', 'ui.router'])
        .config([
            '$stateProvider',
            '$urlRouterProvider',
            '$locationProvider',
            function($stateProvider, $urlRouterProvider, $locationProvider) {

                $stateProvider
                    .state('/', {
                      url: '/',
                      templateUrl: 'client_views/tasks.html',
                      controller: 'todoListCtrl'
                    })

                    .state('edit', {
                      url: '/:id/edit',
                      templateUrl: 'client_views/edit.html',
                      controller: 'editTodoListCtrl'
                    });

                    //.state('/admin', {
                    //  url: '/admin'
                    //});

                $urlRouterProvider.otherwise('/');

                $locationProvider.html5Mode({
                  //enabled: true,
                  //requireBase: false
                });
            }
        ]);
