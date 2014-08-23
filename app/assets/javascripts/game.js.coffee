time = 10
playing = 1

setInterval (->
	step()
	$('#clock').html(time)

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
		return false

