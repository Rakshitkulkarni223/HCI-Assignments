function getinfo() {

    if (resultFrom == null) {
        alert("Please Select Base Temperature Type!!!");
        return;
    }

    else if (searchValue == null) {
        alert("Please enter value to be converted!!");
        return;
    }

    else if (resultTo == null) {
        alert("Please Select Target Temperature Type!!!");
        return;
    }



    var res;

    if (resultFrom == resultTo) {
        res = searchValue;
    }
    else if (resultFrom == "Celsius" && resultTo == "Fahrenheit") {
        res = ((searchValue * (9 / 5)) + 32).toFixed(2);
    }
    else if (resultFrom == "Celsius" && resultTo == "Kelvin") {
        res = (searchValue + 273.15).toFixed(2);
    }
    else if (resultFrom == "Fahrenheit" && resultTo == "Celsius") {
        res = ((searchValue - 32) * 5 / 9).toFixed(2);
    }
    else if (resultFrom == "Fahrenheit" && resultTo == "Kelvin") {
        res = (((searchValue - 32) * 5 / 9) + 273.15).toFixed(2);
    }
    else if (resultFrom == "Kelvin" && resultTo == "Fahrenheit") {
        res = (((searchValue - 273.15) * (9 / 5)) + 32).toFixed(2);
    }
    else if (resultFrom == "Kelvin" && resultTo == "Celsius") {
        res = (searchValue - 273.15).toFixed(2);
    }

    finalTemperature.style.display = "block";

    if (resultTo == "Celsius") {
        finalValue.innerHTML = `${searchValue} ${resultFrom} = ${res} °C`;
    }
    else if (resultTo == "Kelvin") {
        finalValue.innerHTML = `${searchValue} ${resultFrom} = ${res} K`;
    }
    else if (resultTo == "Fahrenheit") {
        finalValue.innerHTML = `${searchValue} ${resultFrom} = ${res} °F`;
    }

    finalTemperature.style.display = "block";

}


var search = document.querySelector(".searchBox");
var convert = document.querySelector(".convert");
var fromCurrecy = document.querySelector(".from");
var toCurrecy = document.querySelector(".to");
var finalValue = document.querySelector(".finalValue");
var finalTemperature = document.getElementById("finalTemperature");
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
