angular
    .module("app", ['restangular', 'ui.router'])
        .config([
            '$stateProvider',
            '$urlRouterProvider',
            '$locationProvider',
            function($stateProvider, $urlRouterProvider) {

                $stateProvider
                    //.state('/', {
                    //  url: '/',
                    //  templateUrl: 'client_views/tasks.html',
                    //  controller: 'todoListCtrl'
                    //})

                    .state('/', {
                      url: '/',
                      templateUrl: 'client_views/index.html',
                      controller: 'projectCtrl'
                    })

                    .state('project/edit', {
                      url: '/:id/edit',
                      templateUrl: 'client_views/editProject.html',
                      controller: 'editProjectCtrl'
                    })

                    .state('edit', {
                      url: '/:id/edit',
                      templateUrl: 'client_views/edit.html',
                      controller: 'editTodoListCtrl'
                    });

                $urlRouterProvider.otherwise('/');

            }
        ]);
