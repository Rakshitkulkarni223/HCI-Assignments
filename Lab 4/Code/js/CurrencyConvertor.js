const getinfo = async (event) => {

    event.preventDefault();

    if (resultFrom == null) {
        alert("Please Select Base Currency Type!!!");
        return;
    }

    else if (searchValue == null) {
        alert("Please enter amount to be converted!!");
        return;
    }

    else if (resultTo == null) {
        alert("Please Select Target Currency Type!!!");
        return;
    }
    else if(searchValue<0)
    {
        alert("Please enter amount greater than 0!!!");
        return;
    }


    const api = "https://api.exchangerate-api.com/v4/latest/USD";

    const data = await fetch(api);

    const jsdata = await data.json();

    const currency = [jsdata];

    let fromRate = currency[0].rates[resultFrom];
    let toRate = currency[0].rates[resultTo];

    finalAmount.style.display = "block";

    let res=((toRate / fromRate) * searchValue).toFixed(4);

    finalValue.innerHTML =`${searchValue} ${resultFrom} = ${res} ${resultTo}`;

    finalAmount.style.display = "block";


}


var search = document.querySelector(".searchBox");
var convert = document.querySelector(".convert");
var fromCurrecy = document.querySelector(".from");
var toCurrecy = document.querySelector(".to");
var finalValue = document.querySelector(".finalValue");
var finalAmount = document.getElementById("finalAmount");
var resultFrom;
var resultTo;
var searchValue;


fromCurrecy.addEventListener('change', (event) => {
    resultFrom = `${event.target.value}`;
});


toCurrecy.addEventListener('change', (event) => {
    resultTo = `${event.target.value}`;
});

search.addEventListener('input', updateValue);

function updateValue(e) {
    searchValue = parseFloat(e.target.value);
}

convert.addEventListener("click", getinfo);

function clearVal() {
    window.location.reload();
    document.getElementsByClassName("finalValue").innerHTML = "";
};
