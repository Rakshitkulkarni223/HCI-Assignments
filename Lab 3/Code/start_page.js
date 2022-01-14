var timeleft = 10;

var animals_name = ["Giraffe", "Woodpecker", "Camel", "Starfish", "Koala",
    "Alligator", "Tiger", "Bear", "Blue whale", "Coyote",
    "Chimpanzee", "Raccoon", "Lion", "Arctic wolf", "Crocodile",
    "Dolphin", "Elephant", "Squirrel", "Snake", "Kangaroo",
    "Hippopotamus", "Elk", "Fox", "Gorilla", "Bat", "Hare", "Toad", "Frog",
    "Deer", "Rat", "Badger", "Lizard", "Mole", "Hedgehog", "Otter", "Reindeer"];

const len = animals_name.length;

var isthere = [];


var downloadTimer = setInterval(function () {
    if (timeleft <= 0) {
        localStorage.setItem('isthere', JSON.stringify(isthere));
        window.location.href = "guess_animals.html";
        clearInterval(downloadTimer);
    }
    document.getElementById("progressBar").value = 10 - timeleft;
    timeleft -= 1;
}, 1000);

function GetRandom()
{
    var index = Math.floor(Math.random() * len);
    if(!(isthere.includes(index)))
    {
        return index;
    }
    return GetRandom();
}

for(var i=0;i<10;i++)
{
    var index = GetRandom();
    var animal_list = document.getElementById(`${i + 1}`);
    animal_list.innerHTML = animals_name[index];
    isthere.push(index);
}