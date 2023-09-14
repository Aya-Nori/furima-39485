function commission (){
  console.log("手数料の計算機能を実装");
  const articleText = document.getElementById("item-price");

  articleText.addEventListener("keyup", () => {

    console.log(articleText.value);
    const priceVal  = articleText.value;
    console.log("経過確認");
    const commissionVal = document.getElementById("add-tax-price");
    const calculatedValue = Math.floor(priceVal * 0.1);
    commissionVal.innerHTML = `${calculatedValue}`;

    const profitVal = document.getElementById("profit");
    
    const totalValue = parseInt(priceVal) + parseInt(calculatedValue);
    profitVal.innerHTML = `${totalValue}`;
  });
};

window.addEventListener('turbo:load', commission);
