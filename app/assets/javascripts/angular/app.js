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
                    templateUrl: 'client_views/edit.html',
                    views: {
                      "": {
                        templateUrl: 'client_views/editTask.html',
                        controller: 'editTaskCtrl'
                      },
                      "comments@edit": {
                        //url: '/projects/:project_id/tasks/:task_id/comments',
                        //templateUrl: 'client_views/comments.html'
                        template: "<h1>Test</h1>"
                      }
                    }

                    //"comments": {
                    //  templateUrl: 'client_views/comments.html',
                    //  controller: "commentCtrl"
                    //}

                  });


                $urlRouterProvider.otherwise('/');

            }
        ]);


