var brackets = [];
var first_basement;
var building_data = {top_floor: 0, bottom_floor: 0, ending_floor: 0, floors: [0]}

function noop() {
}

function importBrackets(data, callback) {
  callback = callback || noop;
  brackets = [];
  top_floor = 0;
  bottom_floor = 0;
  var position = 0;
  var move = 0;
  for (var i = 0; i < data.length; i++) {
    if(data[i] == "("){
      position += 1;
      move += 1;
      brackets.push( {move: move, direction: "up", position: position} )
    }
    else if(data[i] == ")"){
      position -= 1;
      move += 1;
      brackets.push( {move: move, direction: "down", position: position} )
    }
  }
  for (var i = 0; i < brackets.length; i++) {
    if (brackets[i].position > building_data.top_floor){
      building_data.top_floor = brackets[i].position;
    }
  }
  for (var i = 0; i < brackets.length; i++) {
    if (brackets[i].position < building_data.bottom_floor){
      building_data.bottom_floor = brackets[i].position;
    }
  }
  for (var i = 0; i < building_data.top_floor - building_data.bottom_floor; i++) {
    building_data.floors[i] = building_data.bottom_floor + i;
  }
  building_data.ending_floor = brackets[brackets.length - 1].position;
  callback();
}

function update(){
  buildApartment();
  showMoves();
}

function buildApartment() {
  var floors = d3.select('#building').selectAll('.building-floor').data(building_data.floors)
  floors.enter().append('span').attr('class', 'building-floor')
  floors.text(function(d, i){return d})
  floors.exit().remove()
}

function showMoves() {
  var floors = d3.select('#floors').selectAll('.floor').data(brackets)
  floors.enter().append("span").attr('class', 'floor')
  floors.text(function(d, i){return d.position})
  floors.exit().remove()
}
// --- Day 1: Not Quite Lisp ---
//
// Santa was hoping for a white Christmas, but his weather machine's "snow" function is powered by stars, and he's fresh out! To save Christmas, he needs you to collect fifty stars by December 25th.
//
// Collect stars by helping Santa solve puzzles. Two puzzles will be made available on each day in the advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!
//
// Here's an easy puzzle to warm you up.
//
// Santa is trying to deliver presents in a large apartment building, but he can't find the right floor - the directions he got are a little confusing. He starts on the ground floor (floor 0) and then follows the instructions one character at a time.
//
// An opening parenthesis, (, means he should go up one floor, and a closing parenthesis, ), means he should go down one floor.
//
// The apartment building is very tall, and the basement is very deep; he will never find the top or bottom floors.
//
// For example:
//
// (()) and ()() both result in floor 0.
// ((( and (()(()( both result in floor 3.
// ))((((( also results in floor 3.
// ()) and ))( both result in floor -1 (the first basement level).
// ))) and )())()) both result in floor -3.
// To what floor do the instructions take Santa?
//

// Now, given the same instructions, find the position of the first character that causes him to enter the basement (floor -1). The first character in the instructions has position 1, the second character has position 2, and so on.
//
// For example:
//
// ) causes him to enter the basement at character position 1.
// ()()) causes him to enter the basement at character position 5.
// What is the position of the character that causes Santa to first enter the basement?
