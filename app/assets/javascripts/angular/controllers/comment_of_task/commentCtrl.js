/**
 * Created by fod on 17.02.16.
 */
angular.module("app")
  .controller("commentCtrl", [
    '$scope',
    'Id',
    'Restangular',
    'FileUploader',
    function($scope, Id, Restangular, FileUploader) {
      $scope.task_id = Id.getValue();
      Restangular.one('tasks', $scope.task_id).all('comments').getList().then(function(comments) {
        $scope.comments = comments;
      });

      $scope.uploader = new FileUploader();

      var controller = $scope.controller = {
        isImage: function(item) {
          var type = '|' + item.type.slice(item.type.lastIndexOf('/') + 1) + '|';
          return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
        }
      };

      $scope.addComment = function(comment) {

        $scope.comment = {};
        $scope.files = [];

        angular.forEach($scope.uploader.queue, function(item) {
          $scope.files.push(item.file);
        });
        
        $scope.comments.post(comment, comment.task_id = $scope.task_id, comment.avatars = $scope.files).then(function(responce) {
          $scope.comments.push(responce);
        });
        $scope.comment.description = '';
        $scope.uploader.clearQueue();
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
