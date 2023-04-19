$(function() {
  // 初期表示
  $("#photo_park").trigger("change");
  
  // イベントリスナの設定
  $("#photo_park").on("change", function() {
    var park = $(this).val();
    var areas;
 
    switch (park) {
      case "東京ディズニーランド":
        areas = ["ワールドバザール", "アドベンチャーランド"];
        break;
      case "東京ディズニーシー":
        areas = ["メディテレーニアンハーバー", "アメリカンウォーターフロント"];
        break;
      default:
        areas = [];
    }
 
    // エリアリストを更新する
    var options = "";
    for (var i = 0; i < areas.length; i++) {
      options += "<option value=\"" + areas[i] + "\">" + areas[i] + "</option>";
    }
    $("#photo_area").html(options);
  });
});

  