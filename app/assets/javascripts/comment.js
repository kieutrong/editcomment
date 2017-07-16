$(document).ready(function() {
  $('.new_comment').submit(function(e){
    e.preventDefault();
    var params = $(this).serialize();
    var self = $(this);
    $.ajax({
    url: self.attr('action'),
    type: 'POST',
    data: params,
    dataType: 'json',
    success: function(response) {
      if(response.status == 'success'){
        self.next().prepend(response.html);
        $('.text_comment').val('');
      }
    },
    error:function (xhr, ajaxOptions, thrownError){
        console.log('error...', xhr);
    },
    complete: function(){
    }
  });
    return false;
  });

  $('body').on('click', '.delete_comment', function(e){
    e.preventDefault();
    var params = $(this).serialize();
    var self = $(this);
    $.ajax({
    type: 'DELETE',
    url: self.attr('href'),
    data: params,
    dataType: 'json',
    success: function(response) {
      if(response.status == 'success'){
        self.closest('.user_comment').hide();
      }
    },
    error:function (xhr, ajaxOptions, thrownError){
        console.log('error...', xhr);
    },
    complete: function(){
    }
  });
    return false;
  });
});
