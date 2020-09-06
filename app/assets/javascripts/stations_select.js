
$(function(){
  $(document).on("change", ".js_line_select",function(){
    let stations_element = $(this).closest(".row").find(".js_station_select")
    stations_element.empty()
    // 選択し直した際にセレクトに元々入ってる駅名を削除する
    stations_element.append("<option>駅　　名</option>"); 
    // emptyで削除するとセレクトボックスに何も表示されなくなるためinclude_blankの代わりに「駅名」を表示させる
    $.ajax({
      url: "/api/v1/stations?line=" + $(this).val(),
      dataType : 'json',
    }).done(function (data){
      let options = []
      console.log(data)
      Object.keys(data.result).forEach(key =>
        options.push($('<option>').val(data.result[key]).text(key))
      )
      stations_element.append(options)
    }).fail(function (data) {
      //通信失敗の際に表示させる
　　　　alert('通信に失敗しました。');
    });
  })
});