# git-flow-hook

git-flowをゆるく利用するための拡張スクリプト集です。

[bleis-tift氏](https://github.com/bleis-tift)の[Git-Hooks](https://github.com/bleis-tift/Git-Hooks)を元に作成されています。スクリプト自体は元のライセンスを引き継ぎ、NYSLで配布します。

## インストール

インストールはコマンドラインから下記のコマンドを実行することで行えます。
Cygwinの場合はsudo不要です。

git拡張コマンド(/usr/local/binにインストールされます。一度のみの実行で問題ありません)
 * sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/eaglesakura/git-flow-hook/master/installer/install-commands.sh)"

gitリポジトリのフックスクリプト(.git/hooksにインストールされます。リポジトリごとに実行しなければなりません)
 * cd git_repository_root
 * sh -c "$(curl -fsSL  https://raw.githubusercontent.com/eaglesakura/git-flow-hook/master/installer/install-hooks.sh)"

## git拡張コマンド

### 前提条件

git-flowを利用するため、下記のコマンドが実行済であることが前提となります。

<pre>
cd git_repository_root
git flow init
</pre>

### git mktopic

issule(チケット)の対応を開始する際に実行します。

 * git-flowのfeatureを利用します
 * Redmineやgitのissue番号と連動します
 * 以後、全てのコメントに"refs #issule番号"が自動付与されます

使用例(issue 3103への対応を行う場合)
<pre>
git mktopic 3103
#  feature/id/3103/master ブランチが作られます
</pre>

### git endtopic

issule(チケット)の対応を完了する際に実行します。

 * git-flowのfeatureを利用します
 * コメントの最後に"closes #issue番号"が自動的に付与されます
 * git-flowによってdevelopに自動的にマージされ、ブランチは削除されます

使用例
<pre>
git endtopic
</pre>

### git mksubtopic

issule(チケット)の対応中、更にブランチを分岐させる場合に使用します。

 * git-flowのfeatureは継続して使用されます

使用例(issue 3103番対応中に、コードのリファクタリングをしたくなった場合)
<pre>
git mksubtopic refactor
#  feature/id/3103/refactor ブランチが作られます
</pre>

### git endsubopic

サブトピックの対応が完了した場合に使用します。

 * git-flowのfeatureは継続して使用されます
 * feature/id/$issule番号/master に自動的にマージされます
 * マージ後、サブトピックは削除されます

使用例
<pre>
git endsubopic
#  feature/id/3103/master ブランチとのマージが行われます
#  feature/id/3103/refactor ブランチが削除されます
</pre>

## hookスクリプトによる制限追加

hookスクリプトをインストールすることで、リポジトリに対して下記の制限を追加することができます。

### masterブランチでの直接的なコミット禁止

 masterブランチでコミットを行おうとした場合、コミットを強制キャンセルします。masterブランチは必ずdevelopからmergeやpull requestを経由して編集することとなります。

### issule番号の付与

 feature/id/${issue番号}/${トピック名} の命名規則に従ったブランチで作業している場合、自動的にコメントに対してissule番号が付与されます。

 付与される書式は"refs #issule番号"で、githubやRedmineでは自動的にチケットとコミットが連動するようになります。

## ライセンス

<pre>
A. 本ソフトウェアは Everyone'sWare です。このソフトを手にした一人一人が、
   ご自分の作ったものを扱うのと同じように、自由に利用することが出来ます。

  A-1. フリーウェアです。作者からは使用料等を要求しません。
  A-2. 有料無料や媒体の如何を問わず、自由に転載・再配布できます。
  A-3. いかなる種類の 改変・他プログラムでの利用 を行っても構いません。
  A-4. 変更したものや部分的に使用したものは、あなたのものになります。
       公開する場合は、あなたの名前の下で行って下さい。

B. このソフトを利用することによって生じた損害等について、作者は
   責任を負わないものとします。各自の責任においてご利用下さい。

C. 著作者人格権は eaglesakura に帰属します。著作権は放棄します。

D. 以上の３項は、ソース・実行バイナリの双方に適用されます。
</pre>
