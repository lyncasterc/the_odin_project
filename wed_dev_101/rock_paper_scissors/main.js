const rock = document.querySelector('#rock')
const paper = document.querySelector('#paper')
const scissors = document.querySelector('#scissors')
const draw_rock = document.querySelector('#draw-rock')
const draw_paper = document.querySelector('#draw-paper')
const draw_scissors = document.querySelector('#draw-scissors')
const draw_message = document.querySelector('#draw-message')
const lose_message = document.querySelector('#lose-message')
const win_message = document.querySelector('#win-message')


const rps_choices = [rock,paper,scissors]
const computer_choices = [draw_rock,draw_paper,draw_scissors]

//randomly choices rps for computer
function computer_play() {
    let random_element = computer_choices[Math.floor(Math.random()*computer_choices.length)];
    return random_element
}
// removes buttons that were not clicked
function remove_elements(player_choice) {
    rps_choices.forEach(choice => {
                
        if (choice.id !== player_choice.id) {

            choice.classList.toggle('fade-away')
        
            choice.addEventListener('transitionend', () => {
                choice.remove()
                
            })
        }

    });
}

//main
function play_round(player_choice,computer_choice){

    // player rock choice
    if (player_choice === rock) {
        
        // removing hover, making button unclickable
        player_choice.classList.remove('btn-hover')
        player_choice.classList.add('selected')

        remove_elements(player_choice)

        //draw
        if (computer_choice === draw_rock) {

            // adds computer choice pic in dom
            setTimeout(() => {
                computer_choice.classList.toggle('fade-in')
            
            }, 800);
            //adds the game messge
            setTimeout(() => {
                draw_message.style.cssText = "opacity: 1; z-index: 1; "
            }, 1200);
        }

        //player loses
        if (computer_choice===draw_paper) {
            
            setTimeout(() => {
                computer_choice.classList.toggle('fade-in')
            
            }, 800);

            setTimeout(() => {
                lose_message.style.cssText = "opacity: 1; z-index: 1; "
            }, 1200);
        }

        //player wins
        if (computer_choice===draw_scissors) {
            setTimeout(() => {
                computer_choice.classList.toggle('fade-in')
            
            }, 800);

            setTimeout(() => {
                win_message.style.cssText = "opacity: 1; z-index: 1; "
            }, 1200);
            
        }

    }



    if (player_choice === paper) {
        
        player_choice.classList.remove('btn-hover')
        player_choice.classList.add('selected')
        remove_elements(player_choice)
        player_choice.classList.add('player-choice-position')


    }







}













rock.addEventListener('click', function() {
    play_round(rock,computer_choice=computer_play())
})

paper.addEventListener('click', function(){
    play_round(paper,draw_rock)
})



