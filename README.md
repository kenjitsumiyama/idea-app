# アプリケーション名
idea-app

## アプリケーション概要
普段の生活の中で思いついたアイデアを、投稿やコメントできるサービスです。
「こんなサービスあったらいいな」
「こんな商品があったら絶対に買う」
など思いつくアイデアをなんでも是非投稿してみて下さい。
## URL
https://idea-app-30488.herokuapp.com

## テスト用アカウント
### Basic認証
<br>ID/Pass
<br>ID: admin
<br>Pass: 2222

### テスト用アカウント等
#### ユーザー１
<br>メールアドレス名: test1@gmail 
<br>パスワード: test1111

#### ユーザー２
<br>メールアドレス: test2@gmail
<br>パスワード: test2222
 
## 利用方法
トップページにて、サインイン、ログインする。
ログインしたユーザーはアイデア、コメントを投稿できる。
自分の投稿したアイデアは編集、削除ができる。
自分の投稿したコメントは削除ができる。
ユーザー名をクリックするするとユーザーの詳細をページに移行。

## 目指した課題解決
アイデアはあるけど個人の力で実現するのは難しい...という人と、実現する力はあるけどアイデアが思い浮かばない...という人の両者が活用できるサービスを作ろうと思い、アイデア投稿サイトである「idea-app」を制作しました。

## 洗い出した要件
| 優先順位 (高：3、中：2、低：1)| 機能   | 目的   | 詳細   | ストーリー  | 見積も（所要時間）|
| -- | -- | -- | -- | -- | -- |
|３| トップページ | ログインできているかどうかを表示 | サインイン/ログインページ表示 |ログインしているとアイデアを投稿できる|3|		
|３	|ユーザー登録|	ユーザーの情報を登録する | ログインして投稿、編集、削除、コメントを行えるようにする	| 名前、メール、パスワードをフォームに入力。登録されるとトップページに遷移する |	３|
|３|	投稿機能|	アイデアを投稿する|	フォームに記述する,正しく登録されればトップページに遷移する|	トップページに投稿が表示される|	３|
|３	|一覧機能	|全てアイデアを一覧を表示する|	投稿が新しい順に表示される|	トップページ下部に様々なユーザーが投稿したアイデアを表示、タイトル、投稿者名、をクリックすると詳細ページに移行する	|３
|３|	詳細機能|	アイデアの詳細な情報を表示する|	クリックすると詳細ページに遷移する|タイトルと内容が表示される、コメント欄が表示される|	３
|３|	編集機能|	ログインしていて、かつ自分が投稿したアイデアを編集を可能にする|	ログインしていて、かつ自分が投稿したアイデアを編集を可能にする|	編集完了すると詳細ページに編集完了のコメントが表示される|	３|
|３|	削除機能|	投稿したアイデアを削除する|	編集ページにて削除ボタンをクリックしたら情報が削除され遷移する	|削除完了すると削除完了のコメントが表示される、トップページ のリンク先が表示される|	２|
|３	|コメント機能|	アイデアに対してコメントができる|	詳細ページにコメントが表示される|	コメントを投稿でき新しい投稿順に表示される|	５|
|２|	コメント削除機能|	自分のコメントを削除できる|	自分のコメントにはコメント削除ボタンが表示される|	削除完了すると削除完了のコメントが表示され詳細ページに戻る|	２|

## 実装した機能についてのGIFと説明
実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。

## 実装予定の機能
いいね機能、検索機能

## データベース設計
![image](https://user-images.githubusercontent.com/71744673/98804411-80693580-2459-11eb-8952-cb86f8550cdd.png)


## ローカルでの動作方法

git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
* has_many :items
* has_many :comments

## ideas テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_many :comments
## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    |text        | null: false                    |
| user_id | references | null: false, foreign_key: true |
| idea_id | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :idea
