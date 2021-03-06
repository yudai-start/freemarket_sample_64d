$(function(){
  $("#name").on('submit', function(){
    var error = 0;
    var error_message = '<span class="error">必須項目です</span>';
    var error_format = '<span class="error">フォーマットが不適切です</span>';
    var error_registered = '<span class="error">入力頂いたメールアドレスは登録済みです。</span>';
    var error_recaptcha = '<span class="error">チェックが必要です</span>';

    var regex_email    = new RegExp(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/);
    var regex_password = new RegExp(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}/i);
    var email = $("#email").val();
    var password = $("#password").val();
    var maillist = $("#maillist").val();
    var response = grecaptcha.getResponse();


    $(".error").remove()

    if($("#nickname").val()==""){
      $(".post-singnup1-nickname").after(error_message);
      error++;
    }

    if(email.match(regex_email)){
      if(maillist.indexOf(email) >= 0){
        $(".post-singnup1-email").after(error_registered);
        error++;
      }
    }else{
      $(".post-singnup1-email").after(error_format);
      error++;
    }
    
    if(password.match(regex_password)){
    }else{
      $(".post-singnup1-password").after(error_format);
      error++;
    }

    if($("#family_name").val()=="" || $("#first_name").val()==""){
      $(".post-singnup1-name-kanji").after(error_message);
      error++;
    }

    if($("#family_name_kana").val()=="" || $("#first_name_kana").val()==""){
      $(".post-singnup1-name-kana").after(error_message);
      error++;
    }
    if(response.length == 0){
      $(".recaptcha").after(error_recaptcha);
      error++;
    }

    if (error){
      return false;
    }
  });

  $(function() {
    $('#passcheck').change(function(){
        if ( $(this).prop('checked') ) {
            $('#password').attr('type','text');
        } else {
            $('#password').attr('type','password');
        }
    });
});
});