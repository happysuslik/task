/**
 * Created by fod on 17.02.16.
 */
angular.module("app")
  .controller("commentCtrl", [
    '$scope',
    'Id',
    'Restangular',
    'Upload',
    function($scope, Id, Restangular, Upload) {
      $scope.task_id = Id.getValue();
      Restangular.one('tasks', $scope.task_id).all('comments').getList().then(function(comments) {
        $scope.comments = comments;
      });

      $scope.upload = function (file) {

          Upload.upload({
            url: $scope.comments.getRestangularUrl(),
            method: 'POST',
            fields: { 'comment[description]': $scope.comment.description, 'comment[task_id]': $scope.task_id, 'comment[avatar]' : file },
            file: file
          }).then(function (response) {
               $scope.comments.push(response.data);
          });
        $scope.comment.description = '';
        $scope.picFile = '';
        $scope.commentForm.$setPristine();
      };

      $scope.remove = function() {
        $scope.picFile = '';
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
