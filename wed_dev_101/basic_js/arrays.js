// basically a list 

let cars = ['Saab','Volvo','BMW']
console.log(cars[0])

// objects - like dictionaries

let person = {
    first_name: "Bob",
    last_name: "Doe",
    age: 46

}

console.log(person.first_name) //returns Bob

console.log(cars.length) // 3

console.log(cars.sort()) //soring arrays

// looping through arrays

nums = [1,2,3,4,5]
 //using for loops, similar to c++
for (let index = 0; index < nums.length; index++) {
    console.log(nums[index]*2)
    
    
}

//.foreach method, closest to python
nums.forEach(element => {
    num = element + 6

    console.log(num)
});

// toString() - converts array elements to string seperated by comma

console.log(cars.toString())//BMW,Saab,Volvo
    // .join() works the same way except you can specify the seperator

console.log(cars.join(", "))//BMW, Saab, Volvo



// pop() - works like python
    //removes last item and retuns it
 //cars.push("Ford")

//push() - adds item to end of array, like append in python
    //returns new array length

//shift() - like popping, but with the first element 

//unshift() - adds element to beginning of array

// splice() takes where to start, how many elements to be removed, and elements to added
//nums = [1,2,3,4,5]
nums.splice(2,1,"boop") //[1,2,'boop',4,5]
console.log(nums)