let center = { lat: 35.6329, lng: 139.8804 };
let map;
let marker = null;

function initMap() {
  geocoder = new google.maps.Geocoder()

  let map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17,
    center: center,
    heading: 90,
    mapTypeId: 'satellite',
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
    if (parkSelect.value === 'land') {
      map.setCenter({lat: 35.632896, lng: 139.880394});
      map.setMapTypeId('satellite');
      map.setHeading(90);
    } else if (parkSelect.value === 'sea') {
      map.setCenter({lat: 35.626739, lng: 139.884270});
      map.setMapTypeId('satellite');
      map.setHeading(180);
    }
  }

  // イベントリスナーを登録
  parkSelect.addEventListener('change', changeMap);

  map.addListener('click', function(e) {
    if (marker !== null) {
      // マーカーをマップから削除
      marker.setMap(null);
      marker = null;
      return;
    }
  
    // マーカーを生成
    marker = new google.maps.Marker({
      position: e.latLng,
      map: map,
    });

    // 緯度と経度を取得して、フォームに設定
   document.getElementById("photo_latitude").value = marker.getPosition().lat();
   document.getElementById("photo_longitude").value = marker.getPosition().lng();
  });

}

window.initMap = initMap;
  