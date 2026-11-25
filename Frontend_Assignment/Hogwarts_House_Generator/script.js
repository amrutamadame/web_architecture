const button = document.querySelector("#generateButton");
const nameInput = document.querySelector("#nameInput");
const result = document.querySelector("#result");
const tryAgain = document.querySelector("#tryAgain");
const result2 = document.querySelector("#result2");

const houses = ["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"];

const houseColors = {
  Gryffindor: "red",
  Hufflepuff: "goldenrod",
  Ravenclaw: "blue",
  Slytherin: "green",
};

const houseTraits = {
  Gryffindor: "Bravery, courage, chivalry, daring, and nerve",
  Hufflepuff: "Hard work, loyalty, patience, fairness, and dedication",
  Ravenclaw: "Intelligence, wisdom, wit, creativity, and curiosity",
  Slytherin:
    "Ambition, cunning, resourcefulness, leadership, and determination",
};

let name = "";

// Function to randomly assign a Hogwarts house
function assignHouse() {
  if (name.trim() === "") {
    result.textContent = "Please enter your name!";
    result.style.color = "black";
    return;
  } else {
    const randomIndex = Math.floor(Math.random() * houses.length);
    const randomHouse = houses[randomIndex];

    result.textContent = `${name.trim()} belongs in ${randomHouse}!`;
    result.style.color = houseColors[randomHouse];
    result2.textContent = `Key Traits : ${houseTraits[randomHouse]}`;
    result2.style.color = houseColors[randomHouse];
  }
}

// Find My House button
button.addEventListener("click", function () {
  name = nameInput.value;
  assignHouse();
});

// Try Again button
tryAgain.addEventListener("click", function () {
  assignHouse();
});
