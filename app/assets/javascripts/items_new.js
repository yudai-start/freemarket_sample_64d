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
$('form.item_new_form').ready( function(){
  $(this.form).find("textarea, :text, select").val("").end().find(":checked").prop("checked", false);
  });

$(function() {
  
  $("form.item_new_form").on('submit',function(){                               //$("フォームのクラス名").on('イベント')
      var error = 0;
      var error_message = '<div><span class="error">必須項目です</span></div>';       //フォームが空のときに差し込まれるエラーメッセージ
      var error_num = '<span class="error">半角数字のみです</span>';


    $(".error").remove()    //エラーが出ている状態でボタンを押した時にエラーが何度も表示されないように一度削除
    　if(document.URL.match("new")) {
      　    //指定する文字列がURLに含まれる場合に実行する内容
        if($("#item_images_attributes_0_image").val()==""){     //画像フォームの値が空のときの条件式    
          $('.item-image-label').after(error_message);             
          error++;      //指定したクラスの後に要素を差し込む    $('要素名').after(差し込むメッセージ);
        }
      }
      
      if($("#item_name").val()==""){                          //商品名が空の時の条件式
        $('#item_name').after(error_message);  
        error++;      //この記述がないとすぐにrenderされてしまうので入れていますが、理由はわかりません
      }
      
      if($("#item_description").val()==""){                     //商品説明が空の時
          $('#item_description').after(error_message);  
          error++;
      }
    
      if($("#item_item_status_id").val()==""){                  //商品状態が空の時
          $('#item_item_status_id').after(error_message);
          error++;
      } 
      if($("#item_shipping_fee_defrayer_id").val()==""){              //送料の負担が空の時
        $('#item_shipping_fee_defrayer_id').after(error_message);
        error++;
      }
      if($("#item_ship_from_prefecture").val()==""){                  //発送元の地域が空の時
        $('#item_ship_from_prefecture').after(error_message);
        error++;
      }
      if($("#item_ship_date_id").val()==""){                            //発送までの日数が空の時
        $('#item_ship_date_id').after(error_message);
        error++;
      }
      if($("#input").val()==""){                          //価格が空の時、
        $('#for-error-message').before(error_message);   
        error++; //inputのafterでいい位置に表示できなかったので、
      }else if(!$("#input").val().match(/^\d+$/)){        //一つ下の要素のbefore（前）に表示させてます
        $('#for-error-message').before(error_num);     
        error++;    //elsifで半角の数字以外を入力した時に、
      }
        
    if (error) {                                            //エラーがあったときにアラートを表示
      alert("入力の正しく無い箇所があります");
      return false;                                         //エラーがあったときにボタンをキャンセル
    }
  });
});


$(function(){
  //querySelectorでfile_fieldを取得
  // var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
    $('#item_images_attributes_0_image').change(function(){
      //選択したfileのオブジェクトをpropで取得
      var file = $('input[type="file"]').prop('files')[0];
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      var fileReader = new FileReader();
      //読み込みが完了すると、srcにfileのURLを格納
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= ` 
                  <img class="item-image-preview" src="${src}">
                  `
        //image_box__container要素の前にhtmlを差し込む
        $(".item-image-preview").remove() 
        $('.item-image-label').prepend(html);
      }
      fileReader.readAsDataURL(file);
    });
});