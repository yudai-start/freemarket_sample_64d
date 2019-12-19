$(function(){
  $('#input').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    var data = $('#input').val(); // val()でフォームのvalueを取得(数値)
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.ex-pbright1').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('.ex-pbright1').prepend('¥') // 手数料の前に¥マークを付けたいので
    $('.ex-pbright2').html(profit)
    $('.ex-pbright2').prepend('¥')
    $('#price').val(profit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    if(profit == '') {   // もし､計算結果が''なら表示も消す｡
    $('.ex-pbright2').html('');
    $('.ex-pbright1').html('');
    }
  })
})


$(function() {

  // function setErrorMessage(selector, string) {
  //   $(selector).next('.error-message').text(string).removeClass('.error_message');
  // }
  
  $("form.item_new_form").on('submit',function(){
      var error = 0;
      var error_message = '<div><span class="error">必須項目です</span></div>';       //フォームが空のときに差し込まれるエラーメッセージ
      var error_num = '<span class="error">半角数字のみです</span>';


    $(".error").remove()    //エラーが出ている状態でボタンを押した時にエラーが何度も表示されないように一度削除

      if($("#item_images_attributes_0_image").val()==""){     //フォームの値がからとときの条件式
        $('.label').after(error_message);                     //指定したクラスの後に要素を差し込む
      }
      if($("#item_name").val()==""){
        $('#item_name').after(error_message);  
        error++;      //この記述がないとすぐにrenderされてしまうので入れていますが、理由はわかりません
      }
      
      
      if($("#item_description").val()==""){
          $('#item_description').after(error_message);  
      }
    
      if($("#item_item_status_id").val()==""){
          $('#item_item_status_id').after(error_message);
      }
      if($("#item_shipping_fee_defrayer_id").val()==""){
        $('#item_shipping_fee_defrayer_id').after(error_message);
      }
      if($("#item_ship_from_prefecture").val()==""){
        $('#item_ship_from_prefecture').after(error_message);
      }
      if($("#item_ship_date_id").val()==""){
        $('#item_ship_date_id').after(error_message);
      }
      if($("#input").val()==""){
        $('#for-error-message').before(error_message);    //inputのafterでいい位置に表示できなかったので、
      }else if(!$("#input").val().match(/^\d+$/)){        //一つ下の要素のbefore（前）に表示させてます
        $('#for-error-message').before(error_num);
      }
        
      
    
    if (error) {
      alert("入力の正しく無い箇所があります");
      return false;
  }

  });


});