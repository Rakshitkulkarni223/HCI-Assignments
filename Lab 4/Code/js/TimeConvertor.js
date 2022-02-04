function getinfo() {

    if (resultFrom == null) {
        alert("Please Select Base Time Type!!!");
        return;
    }

    else if (searchValue == null) {
        alert("Please enter time to be converted!!");
        return;
    }

    else if (resultTo == null) {
        alert("Please Select Target Time Type!!!");
        return;
    }
    else if (searchValue < 0) {
        alert("Please enter time greater than 0!!!");
        return;
    }


    let fromRate = time_api[resultFrom];
    let toRate = time_api[resultTo];

    finalTime.style.display = "block";

    let res = ((toRate / fromRate) * searchValue);

    finalValue.innerHTML = `${searchValue} ${resultFrom} = ${res} ${resultTo}`;

    finalTime.style.display = "block";

}


var search = document.querySelector(".searchBox");
var convert = document.querySelector(".convert");
var fromCurrecy = document.querySelector(".from");
var toCurrecy = document.querySelector(".to");
var finalValue = document.querySelector(".finalValue");
var finalTime = document.getElementById("finalTime");
var resultFrom;
var resultTo;
var searchValue;

const time_api = {
    "Nanosecond": 1e+9,
    "Microsecond": 1e+6,
    "Millisecond": 1000,
    "Second": 1,
    "Minute": 1/60,
    "Hour": 1/3600,
    "Day": 1/86400,
    "Week": 1/604800,
    "Month": 1/2.628e+6,
    "Calendar year": 1/3.154e+7,
    "Decade": 1/3.154e+8,
    "Century": 1/3.154e+9
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
