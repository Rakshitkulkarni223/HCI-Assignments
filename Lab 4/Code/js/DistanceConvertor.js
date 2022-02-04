function getinfo() {

    if (resultFrom == null) {
        alert("Please Select Base Distance Type!!!");
        return;
    }

    else if (searchValue == null) {
        alert("Please enter value to be converted!!");
        return;
    }

    else if (resultTo == null) {
        alert("Please Select Target Distance Type!!!");
        return;
    }
    else if(searchValue<0)
    {
        alert("Please enter value greater than 0!!!");
        return;
    }


    let fromRate = distance_api[resultFrom];
    let toRate = distance_api[resultTo];

    finalDistance.style.display = "block";

    let res=((toRate / fromRate) * searchValue);

    finalValue.innerHTML =`${searchValue} ${resultFrom} = ${res} ${resultTo}`;

    finalDistance.style.display = "block";

}


var search = document.querySelector(".searchBox");
var convert = document.querySelector(".convert");
var fromCurrecy = document.querySelector(".from");
var toCurrecy = document.querySelector(".to");
var finalValue = document.querySelector(".finalValue");
var finalDistance = document.getElementById("finalDistance");
var resultFrom;
var resultTo;
var searchValue;

const distance_api={
    "kilometre" : 1,
    "Metre" : 1000,
    "Centimetre" : 100000,
    "Millimetre" : 1e+6,
    "Micrometres" : 1e+9,
    "Nanometre" : 1e+12,
    "Mile" : 1/1.609,
    "Yard" : 1094,
    "Foot" : 3281,
    "Inch" : 39370,
    "Nautical mile" : 1/1.852
}


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
