var app = angular.module("app", ["ui.router", "restangular"]);
app.config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/home');

    $stateProvider
        .state('/home', {
            url: '/home',
            templateUrl: 'client_views/tasks.html',
            controller: 'todoListCtrl'
        })
        .state('edit', {
            url: '/:id/edit',
            templateUrl: 'client_views/edit.html',
            controller: 'editTodoListCtrl'
        })
});
