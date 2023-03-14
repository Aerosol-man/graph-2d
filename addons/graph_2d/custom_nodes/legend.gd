tool
extends Panel

var default_font: Font
var legend_array: Array # [label: String, color: Color, pos: Vector2]

func _ready():
	default_font = Control.new().get_font("font")

func _draw():
	var new_rect := Rect2()

	for legend in legend_array:
		draw_string(default_font, legend[2], legend[0], legend[1])
	
	_update_box(new_rect)

func _update_box(rect_extents):
	rect_position = rect_extents.position
	rect_size = rect_extents.size
