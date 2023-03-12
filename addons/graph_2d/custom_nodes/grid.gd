tool
extends Control

var vert_grid: Array
var hor_grid: Array
var color := Color(1,1,1,0.3)

func _draw() -> void:
	for line in hor_grid:
		draw_line(line[0], line[1], color)
		
	for line in vert_grid:
		draw_line(line[0], line[1], color)
