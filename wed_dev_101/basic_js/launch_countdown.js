let output = document.querySelector('.output');
output.innerHTML = '';



// const para = document.createElement('p'); - creates new paragraph 

// para.textContent = ; sets content of para

// output.appendChild(para); - appends para to div

let i = 10;

for (let index = 0; index <= 10 ; index++) {
    const para = document.createElement('p')

    if (i===10) {
        para.textContent = `Countdown ${i}`
    } else if (i===0) {
        para.textContent = 'Blast off!'
    }else{
        para.textContent = `${i}`
    }
    output.appendChild(para)
    i--
    
}

