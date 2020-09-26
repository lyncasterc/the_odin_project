// .indexOf() - searches string for first occurence word, returns index of the word or -1 if it was not found
    //also takes second start position argument

let greeting = "Hi Mom";
let pos = greeting.indexOf("Hi");
console.log(pos); //returns 0


// .lastIndexOf() searches string for last occurence of word, returns index or -1 if not found


let string = "Hello my fellow friends";
let keyword = "my";


function search_string(keyword,string){
    
    

    if (string.indexOf(keyword) != -1) {
        return keyword;
    } else {
        return `"${keyword}" is not in the string.`;
    }
}


console.log(search_string(keyword,string));


// slice() - extracts part of string and returns extracted part
    //takes start and end position arguments
    //if only one argument is passed in, starts at that position and returns the rest of the string
    //takes negative indexes to start from reverse

let str = "Apple, Banana, Kiwi";
let res = str.slice(15,19);
console.log(res); //returns Kiwi

// .substring() is pretty much the same, expect doesnt take negative indexes

// replace() - takes old substring, new substring and replaces it. returns a new string
    //is case sensitive
    // use /WORD/i to make case-insenstive, wehre WORD is the old substring

let names = "Bob, Dob, Mob";
let name = names.replace("Mob","Stiven");
console.log(name)

//  .toUpperCase(), .toLowerCase()
// word1.concat(" ",word2) - joins strings

// arrow function notation
let sum = (a,b) => a+b;

console.log(sum(1,2)) 

