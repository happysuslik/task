/**
 * Created by fod on 11.01.16.
 */
angular.module("app")
  .controller("editTaskCtrl", [
    '$scope',
    'Restangular',
    '$stateParams',
    '$state',
    'Id',
    function($scope, Restangular, $stateParams, $state, Id) {
      $scope.project_id = Id.getValue();
      $scope.task = Restangular.one('projects', $scope.project_id).one('tasks', $stateParams.id).get().$object;
      Id.updateValue($stateParams.id);

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