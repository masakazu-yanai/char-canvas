rem=0;/* This is bat file
node "%~0" %*
::pause
pause
exit
*//* This is JS, arg is process.argv */
(function() {
	//------------------------------------------------------------
	// モジュールの読み込み
	var CharCanvas = require('./char-canvas');

	// 単一文字の背景
	console.log('単一文字の背景');
	var cc = new CharCanvas(70, 20, '-');
	cc.print();

	// 配列の背景
	console.log('配列の背景');
	var cc = new CharCanvas(70, 20, ['*', '+', ':']);
	cc.print();

	// 円、四角、ラグビーボール
	console.log('円、四角、ラグビーボール');
	var cc = new CharCanvas(70, 20, '-');

	cc.fillFnc('areaCircle', '@', 16, 10, 14, 7);
	cc.fillFnc('areaRect', ['/', ':',  '/'], 20, 7, 30, 7);

	var mask = cc.areaCircle(45, 10, 14, 7)
		.opAnd(cc.areaCircle(57, 10, 14, 7));
	cc.fillArea(mask, '*');

	cc.print();

	// 三日月（塗り、線）、リング
	console.log('三日月（塗り、線）、リング');
	var cc = new CharCanvas(70, 20, '-');

	var mask = cc.areaCircle(15, 10, 14, 7)
		.opNot(cc.areaCircle(25, 10, 14, 7));
	cc.fillArea(mask, '@');

	var mask = cc.areaCircle(30, 10, 14, 7)
		.opNot(cc.areaCircle(40, 10, 14, 7));
	cc.strokeArea(mask, '@');

	var mask = cc.areaCircle(50, 10, 14, 7)
		.opNot(cc.areaCircle(50, 10, 10, 5));
	cc.fillArea(mask, '@');

	cc.print();

	// 分裂する円（線 端開き、塗り、線 端閉じ）
	console.log('分裂する円（線 端開き、塗り、線 端閉じ）');
	var cc = new CharCanvas(70, 20, '-');

	var mask = cc.areaCircle(29, 6, 10, 5)
		.opXor(cc.areaCircle(41, 6, 10, 5));
	cc.fillArea(mask, '&');

	var mask = cc.areaCircle(-1, 16, 10, 5)
		.opXor(cc.areaCircle(13, 16, 10, 5));
	cc.strokeArea(mask, '@');

	var mask = cc.areaCircle(57, 16, 10, 5)
		.opXor(cc.areaCircle(71, 16, 10, 5));
	cc.strokeArea(mask, '@', true);

	cc.print();

	// パス
	console.log('パス');
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

	// 文字列の描画
	console.log('文字列の描画');
	var cc = new CharCanvas(70, 20, '-');
	cc.drawText(10, 5, 'hello world!\nThis is a CharCanvas.');
	cc.drawTextZ(10, 10, 'こんにちは世界!!\nこれは、文字キャンバスです。');
	cc.print();
})();

