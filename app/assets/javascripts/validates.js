$('form').on('submit', function() {
  var error; // エラー用の変数を定義
  if ( error ) {
      // エラーが見つかった場合

      return false;
  } else {
      // エラーがなかった場合
      return true;
  }
});

$(function () {


  function setErrorMessage(selector, string) {
      $(selector).next('.error-message').text(string).removeClass('hide');
  }

  $("form.js").on('submit', function (e) {

      let error = 0;

      let error_message = '必須項目です';
      let error_num = '半角数字のみです';

      // 名前
      if ($(".vali_name").val() == "") {
          error++;
          setErrorMessage('.vali_name', error_message);
      }

      if (error) {
          return false;
      }
  });

});

$(function() {

  function setErrorMessage(selector, string) {
    $(selector).next('.error-message').text(string).removeClass('hide');
  }
  $("form.item_new_form").on("submit",function(){
      var error = 0;
      var error_message = '<span class="error">必須項目です</span>';
      var error_num = '<span class="error">半角数字のみです</span>';

  //↓このように書いても反映されません、むしろバグ？ります...
  error_message.remove();
  error_num.remove();

      
      if($("#item_name").val()==""){
          // $('#item_name').after(error_message);   
          error++;
          setErrorMessage('#item_name', error_message);   
      }

      if ($(".vali_name").val() == "") {
        error++;
        setErrorMessage('.vali_name', error_message);
    }

    if (error) {
        return false;
    }
      // 年齢
      if($("#item_description").val()==""){
          $('#item_description').after(error_message);  
      }else if(!$("#item_description").val()==""){
          $('#item_description').after(error_num);  
      }

      // 都道府県
      if($("#item_item_status").val()==""){
          $('#item_item_statu').after(error_message);

      }

      // 評価の理由
      if($(".vali_comment").val()==""){
          $('.vali_comment').after(error_message);

      }

      return false;

  });


});