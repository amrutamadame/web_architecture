//1.Remove First and Last Character

function removeChar(str) {
  //You got this!
  if (str.length > 2) {
    return str.slice(1, -1);
  } else {
    return "";
  }
}

//2. Counting sheep...
function countSheeps(sheep) {
  // TODO
  return sheep.filter(Boolean).length;
}

//3. String ends with?
function solution(str, ending) {
  // TODO: complete
  return str.endsWith(ending);
}

//4. Odd or Even?
function oddOrEven(array) {
  //enter code here
  const sum = array.reduce((acc, num) => acc + num, 0);
  return sum % 2 === 0 ? "even" : "odd";
}
