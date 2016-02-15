/**
 * Created by fod on 15.02.16.
 */
angular.module("app")
  .controller("projectCtrl", [
     '$scope',
      'Restangular',
      '$state',
      function($scope, Restangular, $state) {

        $scope.getProject = function() {
          Restangular.all('projects').getList().then(function(projects) {
            $scope.projects = projects;
          });
        };

        $scope.getError = function(error) {
          if (angular.isDefined(error)) {
            if (error.required) {
              return "Input no be blank"
            }
          }
        };

        $scope.addProject = function(project) {
          $scope.project = {};
          $scope.projects.post(project).then(function(project) {
            $scope.projects.push(project);
          });
          $scope.project.title = '';
          $scope.myForm.$setPristine();
        };

        $scope.destroy = function(project) {
          Restangular.one('projects', project.id).remove();
          $scope.projects.splice($scope.projects.indexOf(project), 1);
        };

        $scope.edit = function(project) {
          $state.go('project/edit', project);
        };

        $scope.getProject();
      }
  ]);