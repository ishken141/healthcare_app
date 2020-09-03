$(function(){
  function buildHTML(message){
    if ( message.image == "default.png") {
      var html =
        `<div class="MessageInfo__userimage">
          <img src="/assets/default.png" width="100px" height="100px" style="border-radius: 50%;">
        </div>
        <div class="MessageBox">
          <div class="Message">
            ${message.text}
          </div>
          <div class="MessageInfo">
            <div class="MessageInfo__userName">
              <p>${message.user_name}</p>
            </div>
            <a class="f000" rel="nofollow" data-method="delete" href="/users/${message.user_id}/messages/${message.id}">削除
            </a>
            </div> 
            </div>
        </div>`
      return html;
    }
    else {
      var html =
        `<div class="MessageInfo__userimage">
          <img src="${message.image}" width="100px" height="100px" style="border-radius: 50%;">
        </div>
        <div class="MessageBox">
          <div class="Message">
            ${message.text}
          </div>
          <div class="MessageInfo">
            <div class="MessageInfo__userName">
              ${message.user_name}
            </div>
                <a class="f000" rel="nofollow" data-method="delete" href="/users/${message.user_id}/messages/${message.id}">削除
                </a>
          </div>
          </div>
        </div>`
  return html;
  };
}

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(data){
      var html = buildHTML(data);
      if (data.text == "") {
        return false
      } else {
        $('.MessageField').append(html);
      }
      $('.form-area').val('');
      $('.submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});