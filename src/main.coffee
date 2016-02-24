canvas = document.getElementById('canvas')
context = canvas.getContext('2d')

canvas.width = window.innerWidth
canvas.height = window.innerHeight

img = new Image()
img.src = "img/player.png"
img.onload = ->
	context.drawImage(img, 10, 10, 32, 32)