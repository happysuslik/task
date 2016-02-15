/**
 * Created by fod on 15.02.16.
 */
angular.module("app")
    .controller("editProjectCtrl", [
      '$scope',
      'Restangular',
      '$stateParams',
      '$state',
      function($scope, Restangular, $stateParams, $state) {
        $scope.project = Restangular.one('projects', $stateParams.id).get().$object;

        $scope.save = function() {
          Restangular.copy($scope.project).save();
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