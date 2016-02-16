/**
 * Created by fod on 11.01.16.
 */
angular.module("app")
  .controller("editTaskCtrl", [
    '$scope',
    'Restangular',
    '$stateParams',
    '$state',
    'projectId',
    function($scope, Restangular, $stateParams, $state, projectId) {
      $scope.project_id = projectId.getValue();
      $scope.task = Restangular.one('projects', $scope.project_id).one('tasks', $stateParams.id).get().$object;

      $scope.save = function() {
        Restangular.copy($scope.task).save();
        $state.go('/');
      };

      $scope.cancel = function() {
        $state.go('/');
      };

      $scope.getError = function(error) {
        if (angular.isDefined(error)) {
          if (error.required) {
            return "Input no be blank"
          }
        }
      };
  }]);