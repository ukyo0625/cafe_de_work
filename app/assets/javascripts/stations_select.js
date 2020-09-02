
$(function(){
  $(document).on("change", ".js_line_select",function(){
    let stations_element = $(this).closest(".row").find(".js_station_select")
    stations_element.empty()
    stations_element.append("<option>〜　　駅　名　　〜</option>"); 

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
      //通信失敗
　　　　alert('通信に失敗しました。');
    });
  })
});