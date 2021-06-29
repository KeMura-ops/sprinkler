## アプリケーション概要
#### ※Gifが表示されていない箇所が複数ありますので、お手数ですがリンク先で挙動をご確認下さい。
<a href="https://gyazo.com/bec45f1856abfd6f8e50601f1598725c"><img src="https://i.gyazo.com/bec45f1856abfd6f8e50601f1598725c.gif" alt="Image from Gyazo" width="1000"/></a>
<h2 align="center">Sprinkler</h2>

<p align="center">
  <a href="https://rubyonrails.org/">
    <img src="https://palan.co.jp/wp-content/uploads/2020/12/Ruby_On_Rails_Logo.svg_.png" width="80px;">
  </a>
 <br>
  <a href="https://www.mysql.com/jp/">
   <img src="https://d1.awsstatic.com/asset-repository/products/amazon-rds/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png" width="36px;">
  </a>
  <a href="https://github.com/heartcombo/devise">
    <img src="https://camo.githubusercontent.com/debcb0b244c5029ae11baf93c481d4ba980055df6e75abc23df12cc6f8cb71f1/68747470733a2f2f7261772e6769746875622e636f6d2f6865617274636f6d626f2f6465766973652f6d61737465722f6465766973652e706e67" width="36px;">
  </a>
  <a href="https://bulma.io/">
    <img src="https://bulma.io/images/bulma-logo.png" width="36px;">
  </a>
  <a href="https://jp.heroku.com/">
    <img src="https://tech-camp.in/note/wp-content/uploads/Heroku.png" width="36px;">
  </a>
    <a href="https://aws.amazon.com/jp/s3/">
    <img src="https://d1.awsstatic.com/icons/jp/console_s3_icon.64795d08c5e23e92c12fe08c2dd5bd99255af047.png" width="36px;">
  </a>
</p>

## アプリケーション名
### Sprinkler(スプリンクラー)

## アプリケーションのURL
### **https://sprinkler-32865.herokuapp.com**

## 制作背景
私の身近なところにプロのイラストレーター志望の方が居るので、イラストレーターを目指している方、イラストを書き始めた初心者の方が気軽に作品を投稿して交流することが出来るSNSアプリケーションを作ろうと思い至り、作成したアプリケーションです。ツイッターやインスタグラムをイメージして作りました。ログインすることでタイムライン機能、フォロー機能、いいね機能などを利用することができます。またこのアプリケーションは「Heroku」でデプロイされていますが、「AWS S3」を導入し画像表示を可能にしています。

## ピックアップ機能紹介
### レスポンシブWEBデザイン
<a href="https://gyazo.com/f4dbe763bedc1bd4ca9da093898f549b"><img src="https://i.gyazo.com/f4dbe763bedc1bd4ca9da093898f549b.gif" alt="Image from Gyazo" width="562"/></a>
<p>スマートフォンやタブレットでもビューが崩れることなく表示させるためアプリをレスポンシブWEBデザインに対応させました。特にヘッダーについては、ハンバーガメーニューに格納しタップ（クリック）したら表示される仕様にしました。またその他のページ、例えば投稿画像を表示するページなどでHTML/CSSフレームワークであるBulmaを使用しレスポンシブ化を実現しています。</p>
<a href="https://gyazo.com/94ff34b7b3109fd31f5fe381d9737a4b"><img src="https://i.gyazo.com/94ff34b7b3109fd31f5fe381d9737a4b.jpg" alt="Image from Gyazo" width="569"/></a>

### フォロー機能
<a href="https://gyazo.com/9c5af344b9aa028862db2e085b8423fd"><img src="https://i.gyazo.com/9c5af344b9aa028862db2e085b8423fd.png" alt="Image from Gyazo" width="1043"/></a>
<p>現在のSNSアプリケーションにおいて欠かせない機能がこのフォロー機能です。ユーザー同士を繋げるという大きな役割を果たす機能であると感じるため実装が必要不可欠な機能です。自分以外のユーザーをフォロー出来るようにして、対象のフォロー/フォロワーを表示出来るようにしました。また自分自身をフォロー出来ないようにして、代わりにプロフィール編集ボタンを配置しました。</p>
<a href="https://gyazo.com/cabc2758bc54c74c940db55d4b89286e"><img src="https://i.gyazo.com/cabc2758bc54c74c940db55d4b89286e.gif" alt="Image from Gyazo" width="1000"/></a>

### いいね機能(Ajax)
<a href="https://gyazo.com/caf2a5a6f581ebe1ecf269b1fcb27774"><img src="https://i.gyazo.com/caf2a5a6f581ebe1ecf269b1fcb27774.gif" alt="Image from Gyazo" width="1000"/></a>
<p>Ajax（非同期通信）でのいいね機能を実装しました。タイムラインの中でいいねを押してもどのページに遷移されることなく複数の投稿にそのまま「いいね」を押すことが出来ていることを確認出来るかと思います。実際に非同期で実装するにあたりHTMLが切り替わらないということがあり苦労した部分はありますが、「jQuery」を用いることで解決出来ました。</p>

### タグのインクリメンタルサーチと画像プレビュー機能
<a href="https://gyazo.com/6ff56984027879783c636eed99575f9d"><img src="https://i.gyazo.com/6ff56984027879783c636eed99575f9d.png" alt="Image from Gyazo" width="1050"/></a>
<p>作品の投稿を便利なものにするために、タグのインクリメンタルサーチと投稿画像のプレビュー機能をJavaScriptを用いて非同期で実装しました。「Tag」に「t」と入力した段階で下に「test」というあらかじめデータベースに登録されてある「タグ」を検索候補として表示させています。そして投稿する画像ファイルを選択した段階でプレビューできるようにしています。これにより投稿する画像の間違いを防ぐことができます。</p>

### データベースER図
<a href="https://gyazo.com/75505feb14e52398bb3bcff35874b32f"><img src="https://i.gyazo.com/75505feb14e52398bb3bcff35874b32f.png" alt="Image from Gyazo" width="536"/></a>
<p>以上は不格好ではありますが、データベースのER図です。機能追加ごとにデータベースのアップデートが必要であればアップデートします。</p>

### 今後の実装について
<p>今後はユーザー同士で直接やりとりが出来るダイレクトメッセージ機能と、フォローやいいねされた場合に通知が送られる通知機能を実装出来ればしていきたいです。またユーザーのプロフィール画像も自由に変更出来れば良いのではないかと感じています。</p>

### 使用ツール
HTML, CSS,JavaScript, jQuery, bulma, Font Awesome, Ruby, Ruby on Rails, MySQL, Heroku, AWS S3

### Special Thanks
<p>イラストレーションとロゴデザインの提供、作成は岡 虎次郎氏によるものです。この度はありがとうございました。</p>
<a href="https://twitter.com/oka_kojiro10">Twitter</a>
<a href="https://www.pixiv.net/users/62951419">pixiv</a>