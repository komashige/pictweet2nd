document.addEventListener('DOMContentLoaded', () => {
  // Canvas要素を取得
  const canvas = new fabric.Canvas('drawingCanvas');
  let isDrawing = false;

  // ペンツールボタンのクリックハンドラ
  document.getElementById('penTool').addEventListener('click', () => {
    isDrawing = true;
    canvas.isDrawingMode = true;
    canvas.freeDrawingBrush.color = 'red'; // 線の色
    canvas.freeDrawingBrush.width = 5;    // 線の太さ
  });

    // 消しゴムボタンのクリックハンドラ
    document.getElementById('eraserTool').addEventListener('click', () => {
      isDrawing = false;
      canvas.isDrawingMode = false;
    });
  
    // マウスがCanvasの範囲内にあるかどうかを確認
    canvas.on('mouse:down', (event) => {
      if (isDrawing) {
        const pointer = canvas.getPointer(event.e);
        if (pointer.x >= 0 && pointer.x <= canvas.width && pointer.y >= 0 && pointer.y <= canvas.height) {
          // マウスがCanvasの範囲内にある場合、描画を許可
          // 以下、描画処理を追加
        }
      }
    });

    // 保存ボタンのクリックイベント
    document.querySelector('form').addEventListener('submit', (e) => {
      e.preventDefault(); // デフォルトのフォーム送信を停止

      // Canvasのデータを取得
      const drawingData = canvas.toDataURL();

      // hidden inputを作成して、フォームに追加
      const hiddenInput = document.createElement('input');
      hiddenInput.setAttribute('type', 'hidden');
      hiddenInput.setAttribute('name', 'tweet[drawing_data]');
      hiddenInput.setAttribute('value', drawingData);
      e.target.appendChild(hiddenInput);

      // フォームを再度送信
      e.target.submit();
    // 描画の制約を追加
    // ...
    });
});  