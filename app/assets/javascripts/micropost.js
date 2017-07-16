$(document).ready(function() {
  $("#micropost_picture").bind("change", function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert('Maximum file size is 5M');
    }
  });

  $('body').on('click', '.delete-micropost', function(e){
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
        self.closest('.posts > .post-id').hide();
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
