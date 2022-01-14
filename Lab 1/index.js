var canvas = document.getElementById('myCanvas');
var mainCanvas = document.querySelector("#myCanvas");
var mainContext = mainCanvas.getContext("2d");
var canvasWidth = mainCanvas.width;
var canvasHeight = mainCanvas.height;
var radius = 0;
var canx = 0;
var cany = 0;
var dx;
var dy;
var i = 0;
var mouseX = 0;
var mouseY = 0;
var dist;
var dia;
var diameter = [];
var distance = [];
var time = [];
var id1 = [];
var d1;
var d2;
var dista = 0;
var mt;
var id;


function playSound() {
    var audio = document.getElementById("create_circle");
    audio.play();
}
function end_Sound() {
    var audio = document.getElementById("end");
    audio.play();
}



drawCircle();
mainCanvas.onclick = next();

function drawCircle() {


    mainContext.clearRect(0, 0, canvasWidth, canvasHeight);

    mainContext.fillStyle = "transparent";
    mainContext.fillRect(0, 0, canvasWidth, canvasHeight);

    mainContext.beginPath();
    radius = Math.floor(Math.random() * (80 - 10)) + 10;
    canx = Math.floor(Math.random() * (800 - 150)) + 150;
    cany = Math.floor(Math.random() * (400 - 150)) + 150;
    dia = 2 * radius;
    diameter.push(dia);
    localStorage.setItem('diameter1', diameter);
    distance.push(dista);
    localStorage.setItem('distance1', distance);

    if (i == 0) {
        mt = ((Math.abs(cany + canx * (Math.log2(dia)))) / 1000).toFixed(2);
        time.push(mt);
        localStorage.setItem('time1', time);
        id = Math.abs(Math.log2(dia).toFixed(2));
        id1.push(id);
        localStorage.setItem('id2', id1);
    }
    else {
        mt = ((Math.abs(cany + canx * (Math.log2((2 * dista) / dia)))) / 1000).toFixed(2);
        time.push(mt);
        localStorage.setItem('time1', time);
        id = Math.abs(Math.log2((2 * dista) / dia).toFixed(2));
        id1.push(id);
        localStorage.setItem('id2', id1);
    }

    mainContext.arc(canx, cany, radius, 0, Math.PI * radius, false);
    mainContext.closePath();

    mainContext.fillStyle = 'hsl(' + 360 * Math.random() + ', 50%, 50%)';
    mainContext.fill();

}

function graph() {


    canvas.style.marginLeft = "1%";

    var new_diameter = new Array();

    var new_time = new Array();

    for (var i = 0; i < 30; i++) {
        new_diameter[i] = diameter[i];
    }

    new_diameter.sort((a, b) => a - b);

    var dict = {};


    for (var i = 0; i < 30; i++) {
        dict[diameter[i]] = time[i];
    }


    for (var i = 0; i < 30; i++) {
        new_time[i] = dict[new_diameter[i]]
    }

    var details = [];

    for (var i = 0; i < 30; i++) {
        var d = {};
        d["x"] = new_diameter[i];
        d["y"] = time[i];
        details.push(d);
    }


    new Chart("myCanvas", {
        type: "line",
        data: {
            labels: new_diameter,
            datasets: [{
                fill: false,
                lineTension: 0,
                backgroundColor: "rgba(0,0,255,1.0)",
                borderColor: "#FBEF05",
                data: new_time
            }]
        },
        options: {
            responsive: false,
            maintainAspectRatio: false,
            legend: { display: false },
            scales: {
                xAxes: [{
                    ticks: {
                        fontColor: "#04FBEE",
                    },
                    scaleLabel: {
                        display: true,
                        labelString: 'Diameter of Circle',
                        fontColor: "white",
                    },
                }],
                yAxes: [{
                    ticks: {
                        fontColor: "#04FBEE",
                    },
                    scaleLabel: {
                        display: true,
                        labelString: 'Selection Time',
                        fontColor: "white",
                    },
                }],
            }
        }
    });

    let table = document.createElement('table');
    table.className = "table_creation";
    let thead = document.createElement('thead');
    let tbody = document.createElement('tbody');

    table.appendChild(thead);
    table.appendChild(tbody);


    document.getElementById('table_creation').appendChild(table);


    let row_1 = document.createElement('tr');
    let heading_1 = document.createElement('th');
    heading_1.innerHTML = "Sr. No.";
    let heading_2 = document.createElement('th');
    heading_2.innerHTML = "Selection Time";
    let heading_3 = document.createElement('th');
    heading_3.innerHTML = "Target Circle Distances";
    let heading_4 = document.createElement('th');
    heading_4.innerHTML = "Circle Diameter";

    row_1.appendChild(heading_1);
    row_1.appendChild(heading_2);
    row_1.appendChild(heading_3);
    row_1.appendChild(heading_4);

    thead.appendChild(row_1);


    var time2 = localStorage.getItem('time1').split(',');
    var distance2 = localStorage.getItem('distance1').split(',');
    var diameter2 = localStorage.getItem('diameter1').split(',');



    for (var i = 0; i < 30; i++) {

        let row = document.createElement('tr');
        let row_data_1 = document.createElement('td');
        row_data_1.innerHTML = i + 1;
        let row_data_2 = document.createElement('td');
        row_data_2.innerHTML = time2[i];
        let row_data_3 = document.createElement('td');
        row_data_3.innerHTML = distance2[i];
        let row_data_4 = document.createElement('td');
        row_data_4.innerHTML = diameter2[i];

        row.appendChild(row_data_1);
        row.appendChild(row_data_2);
        row.appendChild(row_data_3);
        row.appendChild(row_data_4);

        tbody.appendChild(row);
    }

    document.getElementById("table_creation").style.marginLeft = "49%";
    document.getElementById("table_creation").style.marginTop = "1%";
    document.getElementById("table_creation").style.marginBottom = "3%";
}

function next() {
    mainContext.canvas.addEventListener('click', function (event) {
        d1 = mouseX - canx;
        d2 = mouseY - cany;

        mouseX = event.clientX - mainContext.canvas.offsetLeft;
        mouseY = event.clientY - mainContext.canvas.offsetTop;

        dx = mouseX - canx;
        dy = mouseY - cany;

        dist = Math.sqrt((dx * dx) + (dy * dy));
        dista = Math.round(Math.sqrt((d1 * d1) + (d2 * d2)));
        if (i <= 29) {
            if (dist <= radius) {
                i++;
                drawCircle();
                playSound();
            }
        }
        else if (i == 30) {
            playSound();
            graph();
            end_Sound();
        }
    });
}