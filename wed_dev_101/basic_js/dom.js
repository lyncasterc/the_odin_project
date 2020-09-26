// Query selectors 
    //element.querySelector(selector) returns first match of selector
    // element.querySelectorAll(selectors) returns nodelist 
        //nodelist is diff. from array, doesn't have all the array methods. can convert into array with Array.from()
// Creating elements
    // document.createElement(tagname[options])
        // const div = document.createElement('div')
        // doesnt put the element into DOM, just creates it in memory

// Append elements
    // parentNode.appendChild(childNode) appends childNode as the last child of parentNode

//remove elements
    //parentNode.removeChild(child) removes child from parenNode in the DOM

//altering elements
    //const div = document.createElement('div')
    // div.style.color = 'blue'

    // div.style.cssText = 'color: blue; background: white;'

    //kebab-cased css rules are accessed with camel case
        //div.style.backgroundColor



//gets the existing element in dom with id of container
let container = document.querySelector('#container')

//creates a new div
let content = document.createElement('div')

//adds text in this new div
content.textContent = 'SUUUUUUP'

//adds new div to existing element
container.appendChild(content)

let red_p = document.createElement('p')
red_p.textContent = 'Hey, I\'m red'
red_p.style.color = 'red'
container.appendChild(red_p)

let blue_h3 = document.createElement('h3')
blue_h3.textContent = 'I\'m a blue h3'
blue_h3.style.color = 'blue'
container.appendChild(blue_h3)

let div = document.createElement('div')
div.style.cssText = 'border: 5px solid black; background-color: pink '
let div_h1 = document.createElement('h1')
div_h1.textContent = 'I\'m in a div'
div.appendChild(div_h1)

let div_p = document.createElement('p')
div_p.textContent = 'ME TOO'
div.appendChild(div_p)

container.appendChild(div)


let btn = document.querySelector('#btn')
let btn2 = document.querySelector('#btn2')
let btn3 = document.querySelector('#btn3')

btn.addEventListener('click', () => {
    alert("Hello World")
})

function alert_btn2_function(){
    alert('YAAAAAAAAY!')
}

btn2.addEventListener('click', alert_btn2_function)

btn3.addEventListener('click',function(e){
    console.log(e) //provides info on the event
    console.log(e.target) //logs what was the target of the event (in this clase, the btn was the target)
    e.target.style.background = 'blue' //changes the target's background color
})

