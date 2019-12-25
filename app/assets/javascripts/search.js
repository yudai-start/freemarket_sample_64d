$(function() {
    $('.item_search').on('submit', function(e) {
      e.preventDefault();
      // var formData = new FormData(".search-main__contensts__left__said-bar__word__search");
      var input = $('#q_item_status_id_in_3').val();
      // var input = new String ("{"name_cont"=>"ooo", "price_gteq"=>"500", "price_lteq"=>"900", "item_status_id_in"=>["", "1", "2", "3", "4", "5", "6"], "shipping_fee_defrayer_id_in"=>["", "1", "2"], "status_in"=>["", "1", "2"]}");
      console.log(input)
      // var input = $('.item_search').val();
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "GET",
        data: {q:{ "name_cont": "ooo" } },
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data) {
        console.log(data);
      });
   });
});