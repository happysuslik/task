/**
 * Created by fod on 11.01.16.
 */
angular.module("app")
  .controller("editTaskCtrl", [
    '$scope',
    'Restangular',
    '$stateParams',
    '$state',
    function($scope, Restangular, $stateParams, $state) {

      $scope.task = Restangular.one('projects', $stateParams.project_id).one('tasks', $stateParams.id).get().$object;

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
            return "input can not be blank"
          }
        }
      };
  }]);