let map;
let marker;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
    zoom: 18,
    center: { lat: 35.6329, lng: 139.8804 },
    mapTypeId: 'satellite',
    heading: 180,
    restriction: {
      latLngBounds: {
        north: 35.63666632775198,
        south: 35.62193630211798,
        west: 139.8745356094571,
        east: 139.89240645368025
      },
      strictBounds: true
    }
  });

  // select要素を取得
  const parkSelect = document.getElementById('park-select');

  // セレクトボックスが変更された時に呼ばれる関数
  function changeMap() {
    // 選択したテーマパークによって中心点と地図の種類を変更
    if (parkSelect.value === 'ディズニーランド') {
      map.setCenter({lat: 35.632896, lng: 139.880394});
      map.setMapTypeId('satellite');
    } else if (parkSelect.value === 'ディズニーシー') {
      map.setCenter({lat: 35.62576389318218, lng: 139.88454133123065});
      map.setMapTypeId('satellite');
    }
  }

  // 選択したパークによって地図を変更
  parkSelect.addEventListener('change', changeMap);

  //mapをクリックしたときのイベントを設定
  google.maps.event.addListener(map, 'click', mylistener);

  //mapをクリックしたときのイベント
  function mylistener(event) {
    //クリックした場所にマーカーを設置
    if (marker) {
      marker.setMap(null);
    }
    marker = new google.maps.Marker({
      position: event.latLng,
      map: map,
    });
    
    // 緯度と経度を取得して、フォームに設定
    document.getElementById("photo_latitude").value = marker.getPosition().lat();
    document.getElementById("photo_longitude").value = marker.getPosition().lng();
  };
}

window.initMap = initMap;

