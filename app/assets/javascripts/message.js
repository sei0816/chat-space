$(function(){
  function buildHTML(message){
    if (message.image) {
      var html = `<div class="message-list">
                    <div class="message-header">
                      <div class="message-header__curent-name">
                        ${message.user_name}
                      </div>
                      <div class="message-header__time-date">
                        ${message.created_at}
                      </div>
                    </div>
                    <div class="talk">
                      <p class="talk__content">
                        ${message.content}
                      </p>
                    </div>
                    <img src=${message.image} >
                  </div>`
      return html;
    } else {
      var html = `<div class="message-list">
                    <div class="message-header">
                      <div class="message-header__curent-name">
                        ${message.user_name}
                      </div>
                      <div class="message-header__time-date">
                        ${message.created_at}
                      </div>
                    </div>
                    <div class="talk">
                      <p class="talk__content">
                        ${message.content}
                      </p>
                    </div>
                  </div>`
      return html;
    };
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
    })
  })
});