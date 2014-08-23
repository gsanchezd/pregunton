load "games#new", (controller, action) ->
  time = 20 * gon.questions_count
  playing = 1

  setInterval (->
    step()
    $('#clock').html(time)
    $('#score').html(gon.score + " puntos")
    return
  ), 1000 

  step = ->
    if time <= 0 and playing == 1 # Lose by time 
      playing = 0
      alert('perdiste')
    else if time > 0 and answers_completed()
      time -= 1

  answers_completed = ->
    if gon.answers_count < gon.questions_count
      return true
    else
      $('#timescore').html(time / 4 + " puntos por tiempo")
      return false


