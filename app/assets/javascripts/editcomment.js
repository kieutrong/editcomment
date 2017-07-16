$(document).ready(function(){
  // $('body').on('click', '#edit_comment', function(e){
  //   e.preventDefault();
  //   var id = $(this).closest('.user_comment').attr('id');
  //   var value = $(this).closest('.user_comment').find('.content_commented').text();
  //   $('#new-content-comment').val(value).focus();
  //   // $('#comment_submit').attr('id', 'comment_edit');
  //   $(".btn_comment").prop('id', 'comment_edit');
  //   $('body').on('click', '#comment_edit', function(e) {
  //     e.preventDefault();
  //     var params = {
  //       comment: {
  //         content: $('#new-content-comment').val()
  //       }
  //     }
  //     $.ajax({
  //       url: $('#new_comment').attr('action') + '/' + id,
  //       type: 'put',
  //       dateType: 'json',
  //       data: params,
  //       success: function(result){
  //         $('body').find('#' + id).html(result.html);
  //         $('#new-content-comment').val('');
  //       },
  //       error: function(error){
  //         console.log(error);
  //       }
  //     });
  //     $('#comment_edit').attr('id', 'comment_submit');
  //   });
  // });

  $('body').on('click', '#edit_comment', function(event) {
      event.preventDefault();
      var comment_id = $(this).data('id');
      $.ajax({
        type: 'GET',
        dateType: 'json',
        url: '/comments/'+ comment_id + '/edit/',
        success: function(data){
          var form = $(data.html).attr('class', 'update-comment');
          $('#comment-' + comment_id).replaceWith(form);
        }
      });
    });

    $('body').on('submit', '.update-comment', function(event) {
      event.preventDefault();
      var params = $(this).serialize();
      var comment_id = $(this).data('id');
      $.ajax({
        type: 'PATCH',
        dateType: 'json',
        data: params,
        url: '/comments/'+ comment_id,
        success: function(data){
          $('#edit_comment_' + comment_id).replaceWith(data.html);
        }
      });
      return false;
    });
});
