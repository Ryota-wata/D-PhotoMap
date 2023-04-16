// photo.js

document.addEventListener("turbolinks:load", function() {
    const parkSelect = document.getElementById('photo_park');
    const areaSelect = document.getElementById('photo_area');
  
    // 初期表示時に、セレクトボックスの値をもとに、エリアの選択肢を設定する
    updateAreaOptions(parkSelect.value);
  
    // パークのセレクトボックスが変更されたら、エリアの選択肢を更新する
    parkSelect.addEventListener('change', (event) => {
      const park = event.target.value;
      updateAreaOptions(park);
    });
  
    // エリアの選択肢を更新する関数
    function updateAreaOptions(park) {
      areaSelect.innerHTML = '';
  
      if (park === '東京ディズニーランド') {
        addOption(areaSelect, 'ワールドバザール', 'world_bazaar');
        addOption(areaSelect, 'アドベンチャーランド', 'adventureland');
      } else if (park === '東京ディズニーシー') {
        addOption(areaSelect, 'メディテレーニアンハーバー', 'mediterranean_harbor');
        addOption(areaSelect, 'ミステリアスアイランド', 'mysterious_island');
      }
    }
  
    // セレクトボックスに、選択肢を追加する関数
    function addOption(selectBox, text, value) {
      const option = document.createElement('option');
      option.text = text;
      option.value = value;
      selectBox.add(option);
    }
  });
  