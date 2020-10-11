// objects are like python dictionaries
//key-value pairs: keys can be strings or not strings, multiple words in keys have to be in string quotes , values can be anything

let bob = {
    name: 'Bob',
    age: 24,
    height: 70,
    employment: 'unemployed'
}
//accessing propery values of objects

console.log(bob.name) //Bob
console.log(bob.employment) //unemployed

//you can add a propery 
bob.isAdmin = true
console.log(bob.isAdmin) // true

//deleting a propery
delete bob.employment
console.log(bob.employment) // undefined

//bracket notation
console.log(bob['age']) //24




//property value shorthand 

function makeUser(name,age){
    return {
        name: name,
        age: age,
    }
}
console.log(makeUser('stiven',35)) //{ name: 'stiven', age: 35 }
//Same thing as above
function makeUser(name,age){
    return {
        name,
        age,
    }
}


//property existence test
    //"key" in object

let user = {}
console.log("name" in user) // false

let user2 = {
    name: 'billy',
    age: 32,
}

console.log("name" in user2) // true

for (const key in user2) {
    console.log(key)  //name,age
}
//UNRELATED, FOR IN  WORKS WITH ARRAYS SORT OF LIKE PYTHON.
    // i is the index of the elements
    //shorter syntax for a regular for loop?
let num = [1,2,3,4,5]

for(i in num) {
    console.log(i) //0, 1, 2, 3,4
    console.log(num[i]) //1,2,3,4,5
}


let boop ={

}


function is_empty(obj){
    for(key in obj){
        if (key in obj){
            return false
        }
    }
    return true
}

console.log(is_empty(boop))
boop.age = 100
console.log(is_empty(boop))


let salaries = {
    John: 100,
    Ann: 160,
    Pete: 130
}

let sum = 0
for(salary in salaries){
    sum+=salaries[salary]
}
console.log(sum)

function multiply_numeric(obj){
    for(key in obj){
        if (typeof(obj[key]) == 'number') {
            obj[key]*=2
        }
    }
}
multiply_numeric(salaries)
console.log(salaries) 