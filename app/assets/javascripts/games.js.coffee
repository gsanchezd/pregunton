load "games#new", (controller, action) ->
  max_time = 15 * gon.questions_count
  time = max_time
  playing = 1
  saved = 0

  setInterval (->
    if playing == 1 
      time -= 1
      update_scores()
      update_timer()
      check_game_completed()
    else
      update_time_score()
      if saved == 0
        
        saved = 1

    return
  ), 1000 


  check_game_completed = ->
    if gon.answers_count >= gon.questions_count
      playing = 0
    if time <= 0
      playing = 0

  update_scores = ->
    $('#score').html(gon.score + " puntos")

  update_timer = ->
    $('#clock').html(time)

  update_time_score = ->
    $('#timescore').html(time / 5 + " puntos por tiempo")



