// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require('./photo')
//= require jquery3
//= require rails-ujs
//= require_tree .
 
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function() {
    // 選択肢が変更されたら呼び出される関数
    var parkSelect = $('#photo_park');
  var areaSelect = $('#photo_area');
  if (parkSelect.val() == "東京ディズニーランド") {
    setAreasForTokyoDisneyland();
  } else if (parkSelect.val() == "東京ディズニーシー") {
    setAreasForTokyoDisneySea();
  }

  // 選択肢が変更されたら更新
  parkSelect.change(function() {
    if (parkSelect.val() == "東京ディズニーランド") {
      setAreasForTokyoDisneyland();
    } else if (parkSelect.val() == "東京ディズニーシー") {
      setAreasForTokyoDisneySea();
    }
  });

  function setAreasForTokyoDisneyland() {
    areaSelect.html("<option value='ワールドバザール'>ワールドバザール</option><option value='アドベンチャーランド'>アドベンチャーランド</option><option value='ウエスタンランド'>ウエスタンランド</option><option value='クリッターカントリー'>クリッターカントリー</option><option value='ファンタジーランド'>ファンタジーランド</option><option value='トゥーンタウン'>トゥーンタウン</option><option value='トゥモローランド'>トゥモローランド</option>");
  }

  function setAreasForTokyoDisneySea() {
    areaSelect.html("<option value='メディテレーニアンハーバー'>メディテレーニアンハーバー</option><option value='アメリカンウォーターフロント'>アメリカンウォーターフロント</option><option value='ポートディスカバリー'>ポートディスカバリー</option><option value='ロストリバーデルタ'>ロストリバーデルタ</option><option value='アラビアンコースト'>アラビアンコースト</option><option value='マーメイドラグーン'>マーメイドラグーン</option><option value='ミステリアスアイランド'>ミステリアスアイランド</option>");
  }
});
  