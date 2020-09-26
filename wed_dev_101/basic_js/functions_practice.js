let add7 = (a) => a+7

console.log(add7(2))

let multiply = (a,b) => (a*b)

console.log(multiply(2,2))

function capitalize(str) {
    let first_letter = str.slice(0,1).toUpperCase()
    let substring = str.slice(1)
    return first_letter + substring

}

console.log(capitalize("Hello is the bird"))