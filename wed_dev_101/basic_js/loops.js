let cats = ['Bill', 'Jeff', 'Pete', 'Biggles', 'Jasmin']
let info = 'my cats are called '

cats.forEach(cat => {
    if (cats.indexOf(cat) === 4) {
        info+= cat + '.'
    } else {
        info+= cat + ', '
    }
    
});

console.log(info)


let contacts = ['Stiven:1111111','babo:1213111']

let para = document.querySelector('p')
let input = document.querySelector('input')
let btn = document.querySelector('button') 

btn.addEventListener('click', function(){
    let search_input = input.value.toLowerCase()

    input.value = '' // resettig input field onclick
    input.focus() // makes on the input after btn is clicked

    for (let index = 0; index < contacts.length; index++) {

        split_contacts = contacts[index].split(':')

        if (search_input === split_contacts[0].toLowerCase()){
            para.textContent = `${split_contacts[0]}'s number is ${split_contacts[1]}.`
            break
        }else {
            para.textContent = 'Contact not found'
        }

        
    }

})