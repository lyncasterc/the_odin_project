const people = ['Chris', 'Anne', 'Colin', 'Terri', 'Phil', 'Lola', 'Sam', 'Kay', 'Bruce'];

const admitted = document.querySelector('.admitted')
const refused = document.querySelector('.refused')

admitted.textContent = 'Admit: '
refused.textContent = 'Refuse: '

people.forEach(person => {
    if (person === 'Chris' || person === 'Lola' ){
        refused.textContent+= person + ', '
        
    } else {
        admitted.textContent+= person + ', '
    }

});