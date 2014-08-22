
time = 180
playing = 1

setInterval (->
	step()
	$('#clock').html(time)

	return
), 1000 

step = ->
	if time <= 0 and playing == 1
		playing = 0
		alert('perdiste')
	else if time > 0
		time -= 1

