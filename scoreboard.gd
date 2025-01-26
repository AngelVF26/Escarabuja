extends Node

var puntos 

var Scores = {
	"nombre1" : "", "puntos1" : 0,
	"nombre2" : "", "puntos2" : 0,
	"nombre3" : "", "puntos3" : 0,
	"nombre4" : "", "puntos4" : 0,
	"nombre5" : "", "puntos5" : 0,
	"nombre6" : "", "puntos6" : 0,
	"nombre7" : "", "puntos7" : 0,
	"nombre8" : "", "puntos8" : 0,
	"nombre9" : "", "puntos9" : 0
}

var dictTemp : Dictionary

func _setPuntos(points):
	puntos = points
func _getPuntos():
	return puntos
