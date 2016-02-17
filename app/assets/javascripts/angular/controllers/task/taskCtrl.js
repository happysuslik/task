/**
 * Created by fod on 02.01.16.
 */
angular.module("app")
  .controller("taskCtrl", [
    '$scope',
    'Restangular',
    '$state',
    'Id',
    function($scope, Restangular, $state, Id) {

      $scope.refresh = function() {
        Restangular.one('projects', $scope.project.id).all('tasks').getList().then(function(tasks) {
          $scope.tasks = tasks;
        });
      };

      $scope.getError = function(error) {
        if (angular.isDefined(error)) {
          if (error.required) {
            return "Input no be blank"
          }
        }
      };

      $scope.addTask = function(task, project) {
        $scope.project = project;
        $scope.task = {};
        $scope.tasks.post(task, task.project_id = project.id).then(function(response) {
          $scope.tasks.push(response);
        });
        $scope.task.text = '';
        $scope.myForm.$setPristine();

      };

      $scope.destroy = function(task) {
        Restangular.one('projects', $scope.project.id).one('tasks', task.id).remove();
        $scope.tasks.splice($scope.tasks.indexOf(task), 1);
      };

      $scope.editCheckBox = function(task) {
        Restangular.copy(task).save();
      };

      $scope.edit = function(task, project) {
        Id.updateValue(project.id);
        $state.go('edit', task);

      };

      $scope.refresh();

  }]);

