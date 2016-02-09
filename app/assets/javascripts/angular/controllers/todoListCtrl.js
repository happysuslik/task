/**
 * Created by fod on 02.01.16.
 */
angular.module("app")
  .controller("todoListCtrl", function($scope, Restangular, $state) {
    $scope.refresh = function() {
      Restangular.all('tasks').getList().then(function(tasks) {
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

    $scope.addTask = function(task) {
      $scope.task = {};
      $scope.tasks.post(task).then(function(response) {
        $scope.tasks.push(response);
      });
      $scope.task.text = '';
      $scope.myForm.$setPristine();
    };

    $scope.destroy = function(task) {
      Restangular.one('tasks', task.id).remove();
      $scope.tasks.splice($scope.tasks.indexOf(task), 1);
    };

    $scope.editCheckBox = function(task) {
      Restangular.copy(task).save();
    };

    $scope.edit = function(task) {
      $state.go('edit', task);
    };

    $scope.refresh();
  });
