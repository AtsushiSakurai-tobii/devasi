#test git

##GitHub SSHの公開鍵作成
#1.Git Bashを起動する

#2.ディレクトリの作成
# $mkdir /c/Users/asi/.ssh
# $ssh-keygen -t rsa -C "atsushi.sakurai@tobii.co.jp"

#3.鍵の作り場所を指定する
# : /c/Users/asi/.ssh

#4.パスワードの指定
# : tobii

#5.秘密鍵と公開鍵が作成される
#  秘密鍵:id_rsa
#  公開鍵:id_rsa.pub

#6.GitHubへ公開鍵の設定
#github にアクセスし、ログインしてください。
#画面右上の [ Account Settings ] からアカウントの設定画面へ行き
#[ SSH Public Keys ] をクリックして、 SSH 公開鍵設定画面へ行きます。
#[ Add another public key ] と書かれたリンクをクリックすると入力フォームが出てきます。
#そこに先ほど作成した公開鍵の中身をコピペする。

#7.SSH接続確認
# $ssh -T git@github.com
# $yes
# $tobii

# ***Enter passphrase for key …と聞かれたら"tobii"と入力する

##Gitの設定
#1.GitHub連携するためのアクセストークン等のgit設定を行う
# $ git config --global user.name "AtsushiSakurai-tobii"
# $ git config --global user.email "atsushi.sakurai@tobii.co.jp"

#2.アクセストークンの設定
# GitHub->AccountSetting>Applications>Personal Access Tokens
# Create new token
# Token description: tobii1 *任意な項目を入力する
# Create Token

#3.Comandline
# $ git config --global github.user AtsushiSakurai-tobii(Username)
# $ git config --global github.token 生成したToken

#↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
##リポジトリの作成(Github)
#1.リポジトリの作成
# GitHub->(右上)Create a new repo
# Repository name: test
# Description    : test
# Publir         : selected
# Initialize this repository with a README: checked
# Add gitgnore: selected "R"
# Create repository

##リポジトリ作成(Local)
# $ mkdir test
# $ git init(初期化)

##READMEファイルを作成(Local)
# $ touch README
# Editorにて編集する
# save

##ローカルリポジトリにファイルをコミットする
# $ git add README
# $ git commit -m '1st commit test' (コメントを記載する)

##リモートリポジトリにアップする
# $ git remote add origin git@github.com:AtsushiSakurai-tobii/test.git
# $ git puch -u origin master
#   Enter passphrase for key '/c/Users/asi/.ssh/id_rsa':tobii #2回入力する

##GitHubへのアップロード完了

##Rstudioでのバージョン管理
# http://d.hatena.ne.jp/EulerDijkstra/20130327/1364392046
#1. Project>Create new project

#初期リポジトリ作成時にコミットErrorとなるため以下を実行する
# $ git fetch
# $ git status
# $ git merge origin/master
# $ git status
# $ git push -u origin master
# $ git push

# ***Enter passphrase for key …と聞かれたら"tobii"と入力する

#Rstudio updateしたらComment(Commit message)を入力して"Commit"する