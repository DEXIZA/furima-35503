function item (){
  const articleText  = document.getElementById("item-price");
  articleText.addEventListener("keyup", () => {
    const countVal = articleText.value;
    // 入力数字の取得
    const charNum  = document.getElementById("add-tax-price");
    // 手数料ID取得
    charNum.innerHTML = Math.floor(countVal*0.1);
    // 取得数字から手数料計算＆切り捨て＆viewへ反映
    const commission = charNum.innerHTML
    // 利益計算の為一度変数へ

    const profitNum = document.getElementById("profit");
    profitNum.innerHTML = Math.floor(countVal-commission);

  });
};

window.addEventListener('load', item);