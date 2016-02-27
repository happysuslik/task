/**
 * Created by fod on 17.02.16.
 */
angular.module("app")
  .controller("commentCtrl", [
    '$scope',
    'Restangular',
    'Upload',
    '$stateParams',
    function($scope, Restangular, Upload, $stateParams) {

      Restangular.one('projects', $stateParams.project_id).one('tasks', $stateParams.id).all('comments').getList().then(function(comments) {
        $scope.comments = comments;
      });

      $scope.upload = function (file) {

          Upload.upload({
            url: $scope.comments.getRestangularUrl(),
            method: 'POST',
            fields: { 'comment[description]': $scope.comment.description, 'comment[task_id]': $stateParams.id, 'comment[avatar]' : file },
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
        Restangular.one('projects', $stateParams.project_id).one('tasks', $stateParams.id).one('comments', comment.id).remove();
        $scope.comments.splice($scope.comments.indexOf(comment), 1);
      };

      $scope.getError = function(error) {
        if (angular.isDefined(error)) {
          if (error.required) {
            return "input can not be blank"
          }
        }
      };
    }
  ]);
