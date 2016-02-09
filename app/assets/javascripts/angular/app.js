var app = angular.module("app", ["ui.router", "restangular"]);
app.config(function($stateProvider, $urlRouterProvider, $locationProvider) {
  $locationProvider.html5Mode({
    enabled: true,
    requireBase: false
  });

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
