function commission (){
  const articleText = document.getElementById("item-price");

  articleText.addEventListener("keyup", () => {

    console.log(articleText.value);
    const priceVal  = articleText.value;
    const commissionVal = document.getElementById("add-tax-price");
    const calculatedValue = Math.floor(priceVal * 0.1);
    commissionVal.innerHTML = `${calculatedValue}`;

    const profitVal = document.getElementById("profit");
    
    const totalValue = parseInt(priceVal) + parseInt(calculatedValue);
    profitVal.innerHTML = `${totalValue}`;
  });
};

window.addEventListener('turbo:load', commission);
