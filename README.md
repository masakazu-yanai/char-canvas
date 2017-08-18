CharCanvas.js
==========================

JavaScript用のライブラリです。文字キャンバスに対して処理を行ない、アスキーアートを作成します。



## Installation

### In Browser:

	<script src="char-canvas/char-canvas.js"></script>

**CharCanvas** というオブジェクトがグローバルに定義されます。



### In Node.js:

	var CharCanvas = require('./char-canvas');

「node_modules」に入れた場合は以下です。

	var CharCanvas = require('char-canvas');



## 文字キャンバスの作成と出力

キャンバスの「横幅」「高さ」「塗り潰す文字」を指定して文字キャンバスを作成します。文字キャンバスを文字列化する際は「toString()」、コンソールに出力する際は「print()」で行えます。

塗り潰す文字は「単一の文字」あるいは「文字の配列」を指定できます。配列の場合は、左上から1要素ずつ並べて埋めていきます。

まずは「単一の文字の背景」を作り、出力します。

	// 単一文字の背景
	var cc = new CharCanvas(70, 20, '-');
	cc.print();

出力結果です。

	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------

次は「配列の背景」を作り、出力します。

	// 配列の背景
	var cc = new CharCanvas(70, 20, ['*', '+', ':']);
	cc.print();

出力結果です。

	*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*
	+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+
	:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:
	*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*
	+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+
	:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:
	*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*
	+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+
	:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:
	*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*
	+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+
	:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:
	*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*
	+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+
	:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:
	*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*
	+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+
	:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:
	*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*
	+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+:*+



## 使い方1 - 円、四角、ラグビーボール

まずは、簡単な使い方として、「円」「四角」「ラグビーボール」を作成して描画します。

	var cc = new CharCanvas(70, 20, '-');

	cc.fillFnc('areaCircle', '@', 16, 10, 14, 7);

	cc.fillFnc('areaRect', ['/', ':',  '/'], 20, 7, 30, 7);

	var mask = cc.areaCircle(45, 10, 14, 7)
	    .opAnd(cc.areaCircle(57, 10, 14, 7));
	cc.fillArea(mask, '*');

	cc.print();

出力結果です。

	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	---------@@@@@@@@@@@@@@@--------------------------***-----------------
	-------@@@@@@@@@@@@@@@@@@@----------------------*******---------------
	-----@@@@@@@@@@@@@@@@@@@@@@@------------------***********-------------
	----@@@@@@@@@@@@@@@@/://://://://://://://://*************------------
	---@@@@@@@@@@@@@@@@@://://://://://://://://***************-----------
	---@@@@@@@@@@@@@@@@@//://://://://://://://:***************-----------
	---@@@@@@@@@@@@@@@@@/://://://://://://://:/***************-----------
	---@@@@@@@@@@@@@@@@@://://://://://://://://***************-----------
	---@@@@@@@@@@@@@@@@@//://://://://://://://:***************-----------
	----@@@@@@@@@@@@@@@@/://://://://://://://://*************------------
	-----@@@@@@@@@@@@@@@@@@@@@@@------------------***********-------------
	-------@@@@@@@@@@@@@@@@@@@----------------------*******---------------
	---------@@@@@@@@@@@@@@@--------------------------***-----------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------

「fillFnc」は、「fillFnc(エリア関数の名前, 塗り潰し文字か配列, 以下はエリア関数の引数)」と指定して、塗り潰し描画を行ないます。エリア関数には、「areaCircle(中心X, 中心Y, 半径X、半径Y)」「areaRect(左上X, 左上Y, 横幅, 高さ)」 などがあります。

	cc.fillFnc('areaCircle', '@', 16, 10, 14, 7);

	cc.fillFnc('areaRect', ['/', ':',  '/'], 20, 7, 30, 7);

エリア関数は、実行した文字キャンバスと、同じサイズの新しいキャンバスを作成します。このキャンバスは、バイナリ キャンバスと呼ばれ、0と1の数字で構成されています。

バイナリ キャンバスでは、背景を0、円や矩形を1として塗り潰します。

エリア関数で作成したバイナリ キャンバスは、and、or、not、xor演算ができます。「opAnd」でAND演算、「opOr」でOR演算、「opNot」でNOT演算、「opXor」でXOR演算になります（「op」はoperationの略です）。

以下では、作成したエリアをAND演算しています。

	var mask = cc.areaCircle(45, 10, 14, 7)
	    .opAnd(cc.areaCircle(57, 10, 14, 7));

作成したエリアは、「fillArea(バイナリ キャンバス, 塗り潰し文字か配列)」で塗り潰せます。

	cc.fillArea(mask, '@');


## 使い方2 - 分裂する円（線 端開き、塗り、線 端閉じ）

次に、分裂する円を3種類描画します。

	var cc = new CharCanvas(70, 20, '-');

	var mask = cc.areaCircle(-1, 10, 8, 6)
	    .opXor(cc.areaCircle(12, 10, 8, 6));
	cc.strokeArea(mask, '@');

	var mask = cc.areaCircle(30, 10, 8, 6)
	    .opXor(cc.areaCircle(40, 10, 8, 6));
	cc.fillArea(mask, '&');

	var mask = cc.areaCircle(58, 10, 8, 6)
	    .opXor(cc.areaCircle(71, 10, 8, 6));
	cc.strokeArea(mask, '@', true);

	cc.print();

出力結果です。

	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	@@@@----@@@@@@@@@---------&&&&&&&&&-&&&&&&&&&---------@@@@@@@@@----@@@
	----@--@---------@-------&&&&&&&&&&-&&&&&&&&&&-------@---------@--@--@
	-----@@-----------@-----&&&&&&&&&&---&&&&&&&&&&-----@-----------@@---@
	----@--@-----------@---&&&&&&&&&&-----&&&&&&&&&&---@-----------@--@--@
	----@--@-----------@---&&&&&&&&&&-----&&&&&&&&&&---@-----------@--@--@
	----@--@-----------@---&&&&&&&&&&-----&&&&&&&&&&---@-----------@--@--@
	----@--@-----------@---&&&&&&&&&&-----&&&&&&&&&&---@-----------@--@--@
	----@--@-----------@---&&&&&&&&&&-----&&&&&&&&&&---@-----------@--@--@
	-----@@-----------@-----&&&&&&&&&&---&&&&&&&&&&-----@-----------@@---@
	----@--@---------@-------&&&&&&&&&&-&&&&&&&&&&-------@---------@--@--@
	@@@@----@@@@@@@@@---------&&&&&&&&&-&&&&&&&&&---------@@@@@@@@@----@@@
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------

「strokeArea(バイナリ キャンバス, 塗り潰し文字か配列)」は、エリアの外周を線として描画する関数です。

この関数で線を描画をした際、キャンバスの端にかかった部分をどう描くか、2種類の方法があります。1つは無視する方法。もう1つは端を閉じる方法です。この違いは「strokeArea()」の第3引数で指定します。

以下では端を閉じず、

	cc.strokeArea(mask, '@');

	---------------------
	---------------------
	---------------------
	---------------------
	---------------------
	@@@@----@@@@@@@@@----
	----@--@---------@---
	-----@@-----------@--
	----@--@-----------@-
	----@--@-----------@-
	----@--@-----------@-
	----@--@-----------@-
	----@--@-----------@-
	-----@@-----------@--
	----@--@---------@---
	@@@@----@@@@@@@@@----
	---------------------
	---------------------
	---------------------
	---------------------


以下では端を閉じます。

	cc.strokeArea(mask, '@', true);

	--------------------
	--------------------
	--------------------
	--------------------
	--------------------
	----@@@@@@@@@----@@@
	---@---------@--@--@
	--@-----------@@---@
	-@-----------@--@--@
	-@-----------@--@--@
	-@-----------@--@--@
	-@-----------@--@--@
	-@-----------@--@--@
	--@-----------@@---@
	---@---------@--@--@
	----@@@@@@@@@----@@@
	--------------------
	--------------------
	--------------------
	--------------------



## 使い方3 - パス

次は、パスを使った描画です。

	var cc = new CharCanvas(70, 20, '-');

	var x = 0;
	var ln = cc
	    .moveTo(x + 4,  1)
	    .lineTo(x + 16, 18)
	    .lineTo(x + 22, 6)
	    .lineTo(x + 15, 12)
	    .lineTo(x + 2,  12)
	    .close();
	cc.fillArea(ln, '@');

	var x = 22;
	var ln = cc
	    .moveTo(x + 4,  1)
	    .lineTo(x + 16, 18)
	    .lineTo(x + 22, 6)
	    .lineTo(x + 15, 12)
	    .lineTo(x + 2,  12)
	    .close()
	    .fillPath();
	cc.fillArea(ln, '@');

	var x = 44;
	var ln = cc
	    .areaPath(
	        x + 4,  1,
	        x + 16, 18,
	        x + 22, 8,
	        x + 15, 12,
	        x + 2,  12)
	    .fillPath();
	cc.fillArea(ln, ['*', '+']);

	cc.print();

以下、出力結果です。

	----------------------------------------------------------------------
	----@---------------------@---------------------*---------------------
	----@@--------------------@@--------------------*+--------------------
	----@@--------------------@@--------------------*+--------------------
	---@--@------------------@@@@-------------------*+*-------------------
	---@---@-----------------@@@@@------------------*+*+------------------
	---@----@-------------@--@@@@@@-------------@---*+*+*-----------------
	---@----@------------@---@@@@@@------------@---+*+*+*-----------------
	---@-----@----------@@---@@@@@@@----------@@---+*+*+*+------------*---
	---@------@-------@@@----@@@@@@@@-------@@@----+*+*+*+*---------*+----
	--@-------@------@--@---@@@@@@@@@------@@@@----+*+*+*+*-------*+*+----
	--@--------@----@--@----@@@@@@@@@@----@@@@-----+*+*+*+*+----*+*+*-----
	--@@@@@@@@@@@@@@---@----@@@@@@@@@@@@@@@@@@----*+*+*+*+*+*+*+*+*+*-----
	------------@-----@---------------@@@@@@@---------------*+*+*+*+------
	-------------@----@----------------@@@@@@----------------+*+*+*-------
	--------------@--@------------------@@@@------------------*+*+*-------
	---------------@-@-------------------@@@-------------------+*+--------
	---------------@@--------------------@@--------------------+*+--------
	----------------@---------------------@---------------------*---------
	----------------------------------------------------------------------

パスの描画では、「moveTo(X座標, Y座標)」「lineTo(X座標, Y座標)」「close()」でパスのエリアを作成します。「fillPath()」を使うと、作成したパスの内側を塗り潰したエリアを作成します。

また、「areaPath(X座標0, Y座標0, X座標1 Y座標1, …)」を使い、「moveTo()」「lineTo()」の代わりに線のエリアを作成することもできます。



## 使い方4 - 文字列の描画

ここでは、文字列の描画を行ないます。

	var cc = new CharCanvas(70, 20, '-');
	cc.drawText(10, 5, 'hello world!\nThis is a CharCanvas.');
	cc.drawTextZ(10, 10, 'こんにちは世界!!\nこれは、文字キャンバスです。');
	cc.print();

以下、出力結果です。

	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------hello world!------------------------------------------------
	----------This is a CharCanvas.---------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------こんにちは世界!!--------------------------------------------
	----------これは、文字キャンバスです。--------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	----------------------------------------------------------------------

「drawText」で指定位置に文字列を描画できます。ただし、半角限定です。

「drawTextZ」では、全角を考慮して描画します。内部的には、「'全', '\t', '角', '\t'」のようにデータを保持し、「toStiring」する際に「\t」を削除しています。このように、2文字分の領域を使い、全角文字を描画するようにしています。

そのため、全角文字を描画したところに、図形を重ねると破綻します。日本語の文字列は、最後に描画するようにして下さい。



## 使い方5 - 文字列の描画 図形として

Webブラウザ限定の機能です。HTML5のCanvasを利用しています。

	var cc = new CharCanvas(70, 40, '-');
	var mask = cc.areaText(2, -3, '顔貌', 20, 'sans-serif', 0.85, 1.7)
	     .opOr(cc.areaText(5, 17, '売人', 20, 'sans-serif', 0.85, 1.6));
	cc.fillArea(mask, '#');
	cc.print();

以下、出力結果です。

	----------------------------------------------------------------------
	--------#####-----------------------------#####---------####----------
	--------#####------################----######---------#####-----------
	--#################-----####--------#########----##################---
	---#####----####--------##--------######--###########----------####---
	-----###----####---##############----################----------####---
	-----####---####---####------####----##########--##################---
	--#####################------####------########--####----------####---
	--####------##-----##############----##########--####----------####---
	--####--######-----####------####-####----######-####----------####---
	--#######----------####------####------#########-##################---
	--####-------#####-##############----#####--####-----####-####--------
	--####----######---####------####-####----######-----####-####--------
	--####--#####------####------####--------#######-----####-####--------
	--#######----#####-####------####------####-####---####---####--------
	--####------######-##############---######--####---####---####--#####-
	-###------######----#####--###----####------####-####-----####--#####-
	-###---######------######--######---------###########-----####--#####-
	-########------######---------#####----###########--------#########---
	----------------------------------------------------------------------
	----------------------------------------------------------------------
	-----------------####-------------------------------------------------
	-----------------####----------------------------####-----------------
	-----#############################---------------####-----------------
	-----------------####----------------------------####-----------------
	-----------------####----------------------------####-----------------
	------###########################----------------####-----------------
	-------------------------------------------------####-----------------
	-------------------------------------------------####-----------------
	-----#############################--------------#####-----------------
	-----####---------------------####--------------#######---------------
	-----####----####----####-----####--------------#######---------------
	-------------####----####---------------------####---####-------------
	-------------####----####---------------------####---####-------------
	-------------####----####--------------------####-----####------------
	-----------####------####-----####---------####---------####----------
	---------####--------####-----####-------####------------######-------
	------######---------####-----####----######---------------######-----
	-----####------------############----####---------------------####----
	----------------------------------------------------------------------

「areaText(左上X, 左上Y, 文字列, 文字サイズ, フォント, 太さ, 横幅の比率)」で文字列を描画します。

「文字列」は1行限定です。改行は考慮していません。

「太さ」は1.0～0.0の数値です。1にすると、Canvasに描画した文字列の、アンチエイリアス部分を全て描画します。0にすると、アンチエイリアス部分は完全に無視します。

「横幅」の比率を大きくすると、横長の文字になります。半角文字は縦長なので、正方形に全角文字を描画したい際は、2を指定するとよいでしょう。



## 詳しい使い方

各APIの使い方は、「char-canvas.js」内に、コメントとして直接記入しています。それほど長いコードではないので、直接参考にして下さい。



## 開発の背景

CodeIQというサイトで、アスキーアートを題材にした問題を、一時期よく出題していました。その時の経験を元に、アスキーアート用のライブラリを作りたいと思ったのが切っ掛けです。



## その他

作者は小説も書いています。文藝春秋から「ハッカー探偵 鹿敷堂桂馬」シリーズとして出ています。プログラマーが探偵役として活躍する小説なので、是非読んで下さい。

+ [裏切りのプログラム　ハッカー探偵 鹿敷堂桂馬](http://crocro.com/novel/item/uragiri-no-program/)
+ [顔貌売人　ハッカー探偵 鹿敷堂桂馬](http://crocro.com/novel/item/gannbou-baininn/)

![裏切りのプログラム　ハッカー探偵 鹿敷堂桂馬](kasikidou1-obi-h300.png)
![顔貌売人　ハッカー探偵 鹿敷堂桂馬](kasikidou2-obi-h300.png)



## License

MIT
