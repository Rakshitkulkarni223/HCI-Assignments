var ul_ele = document.getElementById("check");

var animals_name = ["Giraffe", "Woodpecker", "Camel", "Starfish", "Koala",
    "Alligator", "Tiger", "Bear", "Blue whale", "Coyote",
    "Chimpanzee", "Raccoon", "Lion", "Arctic wolf", "Crocodile",
    "Dolphin", "Elephant", "Squirrel", "Snake", "Kangaroo",
    "Hippopotamus", "Elk", "Fox", "Gorilla", "Bat", "Hare", "Toad", "Frog",
    "Deer", "Rat", "Badger", "Lizard", "Mole", "Hedgehog", "Otter", "Reindeer"];

const newLine = "\r\n"

for (var i = 1; i <= 36; i++) {
    var li_ele = document.createElement('li');

    var input_ele = document.createElement('input');
    input_ele.type = "checkbox";
    input_ele.value = animals_name[i - 1];
    input_ele.id = `animal_${i}`;


    var label_ele = document.createElement('label');
    label_ele.id = `animal_${i}_label`;
    label_ele.htmlFor = `animal_${i}`;

    label_ele.appendChild(document.createTextNode(animals_name[i - 1]));

    ul_ele.appendChild(li_ele);
    li_ele.appendChild(input_ele);
    li_ele.appendChild(label_ele);

}

function check() {
    var checked_names = [];

    var correct_identified = [];

    var isthere = JSON.parse(localStorage.getItem('isthere'));


    for (var i = 1; i <= 36; i++) {
        var checked = document.querySelector(`#animal_${i}:checked`);

        if (checked != null) {
            checked_names.push(i);
        }
    }

    if (checked_names.length < 10) {
        alert(`You selected ${checked_names.length} animals name!!${newLine}Please select ${10 - checked_names.length} more animals name!!`);
        return;
    }
    else if (checked_names.length > 10) {
        alert(`You selected ${checked_names.length} animals name!!${newLine}Please select only 10 animals name!!`);
        return;
    }
    else {

        for (var i = 1; i <= 36; i++) {
            var checked = document.querySelector(`#animal_${i}:checked`);

            if (checked != null) {
                checked_names.push(i);


                var label = document.getElementById(`animal_${i}_label`).style;
                if (isthere.includes(i - 1)) {
                    label.backgroundColor = "#6FF06D";
                    label.padding = "3.2%";
                    label.borderRadius = "15px";
                    correct_identified.push(i - 1);
                }
                else {
                    label.backgroundColor = "#F81308";
                    label.padding = "3.2%";
                    label.borderRadius = "15px";
                }
            }
        }

        const score = correct_identified.length;

        document.getElementById("display_result").style.display = "none";
        document.getElementById("score_board").style.display = "block";
        document.getElementById("score").innerHTML = score;

        if (score == 0) {
            alert(`Poor!!!😕🙁${newLine}Keep trying to become Fair!!`);
        }
        else if (score >= 1 && score <= 4) {
            alert(`Fair!!!🙂${newLine}Keep trying to become Good!!`);
        }
        else if (score >= 5 && score <= 6) {
            alert(`Good!!!😇😊${newLine}Keep trying to become Very Good!!`);
        }
        else if (score >= 7 && score <= 9) {
            alert(`Very Good!!!🤩${newLine}Keep trying to become Excellent!!`);
        }
        else if (score == 10) {
            alert(`Excellent!!!😎🤩${newLine}Congratulations🎉🎊✨ you did it👏!!!`);
        }

    }

}


