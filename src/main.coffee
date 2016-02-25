canvas = document.getElementById('canvas')
context = canvas.getContext('2d')

canvas.width = window.innerWidth
canvas.height = window.innerHeight

img = new Image()
img.src = "img/player.png"
img.onload = ->
	context.drawImage(img, 10, 10, 32, 32)

lastKeyPressed = 0
lastUpdate = 0
x = 0
y = 0
A = 97
D = 100
S = 115
W = 119	

document.body.onkeypress = (e) ->
	processInput(e.keyCode || e.which);

processInput = (keyCode) ->
	lastKeyPressed = keyCode;

calcSpeed = (delta, pixelsPerSec) ->
	((pixelsPerSec * delta) / 1000)

update = (delta) ->
	if lastKeyPressed is A then x -= calcSpeed(delta, 100)
	else if lastKeyPressed is D then x += calcSpeed(delta, 100)
	else if lastKeyPressed is W then y -= calcSpeed(delta, 100)
	else if lastKeyPressed is S then y += calcSpeed(delta, 100)
	else lastKeyPressed = null

render = ->
	context.clearRect(0, 0, canvas.width, canvas.height)
	context.drawImage(img, x, y, 32, 32)

run = ->
	time = new Date().getTime()
	delta = time - lastUpdate
	update(delta)
	render()
	lastUpdate = new Date().getTime()
	window.requestAnimationFrame(run)

lastUpdate = new Date().getTime()
window.requestAnimationFrame(run)