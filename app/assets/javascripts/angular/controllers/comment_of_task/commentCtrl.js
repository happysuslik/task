/**
 * Created by fod on 17.02.16.
 */
angular.module("app")
  .controller("commentCtrl", [
    '$scope',
    'Id',
    'Restangular',
    function($scope, Id, Restangular) {
      $scope.task_id = Id.getValue();
      Restangular.one('tasks', $scope.task_id).all('comments').getList().then(function(comments) {
        $scope.comments = comments;
      });

      $scope.addComment = function(comment) {
        $scope.comment = {};
        $scope.comments.post(comment, comment.task_id = $scope.task_id).then(function(responce) {
          $scope.comments.push(responce);
        });
        $scope.comment.description = '';
        $scope.commentForm.$setPristine();
      };

      $scope.destroy = function(comment) {
        Restangular.one('tasks', $scope.task_id).one('comments', comment.id).remove();
        $scope.comments.splice($scope.comments.indexOf(comment), 1);
      };

      $scope.getError = function(error) {
        if (angular.isDefined(error)) {
          if (error.required) {
            return "Input no be blank"
          }
        }
      };
    }
  ]);
