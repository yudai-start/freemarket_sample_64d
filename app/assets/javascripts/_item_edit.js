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
                  <img class="edit-image-preview" src="${src}"> 
                  `
        //image_box__container要素の前にhtmlを差し込む
        $(".edit-image-preview").remove() 
        $('.label').prepend(html);
      }
      fileReader.readAsDataURL(file);
    });
});


