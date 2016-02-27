/**
 * Created by fod on 02.01.16.
 */
angular.module("app")
  .controller("taskCtrl", [
    '$scope',
    'Restangular',
    '$state',
    '$timeout',
    function($scope, Restangular, $state, $timeout) {

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

      $scope.task_result = function() {
        $scope.result = [];
        angular.forEach($scope.tasks, function(obj) {
          $scope.result.push(obj);
        });

      };

      $scope.up = function(task) {
        $scope.task_result();
        if (task.priority != 0) {
          angular.forEach($scope.result, function(obj) {
            if(obj.priority == task.priority - 1) {
              $scope.task_down = obj;
            }
          });
          $scope.task_down.priority += 1;
          $timeout(function() {
            Restangular.copy($scope.task_down).save();
          }, 250);
          task.priority -= 1;
          Restangular.copy(task).save();
        }
      };

      $scope.down = function(task) {
        $scope.task_result();
        if (task.priority != $scope.result.length - 1) {
          angular.forEach($scope.result, function(obj) {
            if(obj.priority == task.priority + 1 ) {
              $scope.task_up = obj;
            }
          });
          $scope.task_up.priority -= 1;
          $timeout(function() {
            Restangular.copy($scope.task_up).save();
          }, 250);
          task.priority += 1;
          Restangular.copy(task).save();
        }
      };

      $scope.destroy = function(task) {
        Restangular.one('projects', $scope.project.id).one('tasks', task.id).remove();
        $scope.tasks.splice($scope.tasks.indexOf(task), 1);
        $timeout(function() {
          $scope.refresh();
        }, 250);

      };

      $scope.editCheckBox = function(task) {
        Restangular.copy(task).save();
      };

      $scope.edit = function(task, project) {
        $state.go('edit', {project_id: project.id, id: task.id});
      };


      $scope.onTimeSet = function (newDate, oldDate, task) {
        task.deadline =  newDate;
        Restangular.copy(task).save();
      };

      $scope.classPriority = function (task) {
        var classPriority = angular.element(document).find('#task'+ task.id).selector;
        return classPriority;
      };



      $scope.refresh();

  }]);

