
//function hoge() {
//  console.log('hoge clicked')
//}

$(function(){
  $(document).on("change", ".js_pref_select",function(){
    let lines_element = $(this).closest(".row").find(".js_line_select")
    let stations_element = $(this).closest(".row").find(".js_station_select")
    lines_element.empty()
   lines_element.append("<option>〜　　路　線　　〜</option>"); 
    stations_element.empty()
   stations_element.append("<option>〜　　駅　名　　〜</option>"); 
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
      //通信失敗
　　　　alert('通信に失敗しました。');
    });
  })
//   $(document).ready(function(){
//     let prefecture_element = $(".js_pref_select").val()
//     let lines_element = $(".js_line_select")
//     let stations_element = $(".js_station_select")
//     $(".js_pref_select").each(function(i, elem) {
//       var select_line = $(lines_element[i]).val()
//       var z = $(lines_element[i])
//     　console.log(typeof(lines_element[i]));
//     　$(lines_element[i]).empty()
//     　$(lines_element[i]).append("<option>路線</option>"); 
//       $(stations_element[i]).empty()
//       $(stations_element[i]).append("<option>駅名</option>"); 
//       $.ajax({
//         url: "/api/v1/lines?pref=" + $(elem).val(),
//         dataType : 'json',
//       }).done(function (data){
//         console.log('done')
//         console.log(data)
//         let options = []
//         Object.keys(data.result).forEach(key =>
//           options.push($('<option>').val(data.result[key]).text(key))
//         )
//         console.log(options)
//         $(lines_element[i]).append(options)
//       }).fail(function (data) {
//         //通信失敗
//   　　　　alert('通信に失敗しました。');
//       });
//       console.log('---------')
//     　console.log(select_line)
//     　$(z).val(select_line)
// });

    // console.log(prefecture_element)
  // })
});

