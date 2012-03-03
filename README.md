
# ＴＶスケジューラー用ひかりTVプラグイン
[ＴＶスケジューラー](http://www.valsoft.jp/delphi/tvs2hp.html)用の
[ひかりTV](http://www.hikaritv.net/)プラグインです。

番組表取得、番組予約、予約状況照会の機能があります。


## 必要なもの
+ Java JRE
 - Java5以降？。[JRuby](http://jruby.org/)の実行環境として。
+ [google Chrome](http://www.google.co.jp/chrome/intl/ja/landing_ch.html)
 - ブラウザです。スクレイピングのためのJavascriptエンジンとして使用します。


## ファイル構成
+ TVS
 - TVスケジューラーのプラグインファイル
+ chrome_extension
 - Chrome拡張のファイル


## インストール方法
### Chrome拡張導入
chrome_extension/config.jsの中のUSERNAMEとPASSWORDを
ひかりTVのユーザー名及びパスワードに書き換えます。（今のところ平文です）

Chromeのレンチアイコンより「オプション」→「拡張機能」を選択し、
「パッケージ化されていない拡張機能を読み込む」ボタンを押下し、
チェックアウトしたchrome_extensionディレクトリーを選択します。

登録されたら拡張のIDが表示されるので控えておきます。

### プラグイン導入
+ TVS/Plug-In/hikaritv/plugin.cmdの編集
 - 上記IDで以下の行を書き換えます。
> set EXTENSION_ID=mclgockfjnhckopglabjdikdpilpglfd

 - 取得チャンネルの設定を以下の行を書き換えて行います。
> set CH_LIST=350,351,352,380,821

 - TVスケジューラーのインストールディレクトリーを設定します。
> set TVS_HOME=c:\Tool\tvs21230

 - その他、必要に応じて JAVA_HOMEを設定してください。


## 使い方
（あとで書く）

## 謝辞
以下の公開ソフトウェアを使用させていただくことで本プラグインが実現できました。感謝いたします。

+ TVスケジューラー
+ Google Chormeブラウザ
+ JRuby
+ nkf
+ JQuery
+ jquery.form

## ライセンス
BSDライセンス

