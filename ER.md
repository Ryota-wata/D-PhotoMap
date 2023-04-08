### ER図
[![Image from Gyazo](https://i.gyazo.com/0f2b00f53adf584ce5c4dd77067601ad.png)](https://gyazo.com/0f2b00f53adf584ce5c4dd77067601ad)

### 各テーブルの説明
Usersテーブル
 ユーザー登録に必要な情報を管理
  Name：ユーザー名 ※必須
  Email：メールアドレス ※必須
  Password：パスワード ※必須
  Crypted _password：パスワード（暗号化） ※必須

Photosテーブル
 写真投稿に必要な情報を管理
  Day：投稿日 ※必須
  Park：投稿写真のカテゴリのうち、パークの選択（ランドorsシー）
  Area：投稿写真のカテゴリのうち、エリアの選択（アドベンチャーランド等）
  Body：本文
  Image：投稿写真 ※必須
  Latitude：ピンを立てたGoogleMap上の緯度
  Longitude：ピンを立てたGoogleMap上の経度
  Created_at：作成日時
  Updated _at：更新日時
  User_id：写真を投稿したユーザーのID（外部キー）

Diariesテーブル
 日記投稿に必要な情報を管理
  Day：投稿日 ※必須
  Title：タイトル ※必須
  Body：本文
  Lottely_facility：抽選した施設名
  Lottely_time：抽選した時間
  Lottely_result：抽選結果
  Created_at：作成日時
  Updated _at：更新日時
  User_id：日記を投稿したユーザーのID（外部キー）