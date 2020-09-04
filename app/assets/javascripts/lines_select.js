$(function(){
  $(document).on("change", ".js_pref_select",function(){
    let lines_element = $(this).closest(".row").find(".js_line_select")
    let stations_element = $(this).closest(".row").find(".js_station_select")
    lines_element.empty()
    // 選択し直した際にセレクトに元々入ってる路線を削除する
    lines_element.append("<option>路線</option>"); 
    // emptyで削除するとセレクトボックスに何も表示されなくなるためinclude_blankの代わりに「路線」を表示させる
    stations_element.empty()
    // 選択し直した際にセレクトに元々入ってる駅名を削除する
    stations_element.append("<option>駅名</option>"); 
    // emptyで削除するとセレクトボックスに何も表示されなくなるためinclude_blankの代わりに「駅名」を表示させる
    $.ajax({
      url: "/api/v1/lines?pref=" + $(this).val(),
      dataType : 'json',
    }).done(function (data){
      console.log('done')
      let options = []
      Object.keys(data.result).forEach(key =>
        options.push($('<option>').val(data.result[key]).text(key))
      )
      console.log(options)
      lines_element.append(options)
    }).fail(function (data) {
      //通信失敗の際に表示させる
　　　　alert('通信に失敗しました。');
    });
  })
});

