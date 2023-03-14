tool
extends Panel

const TEXT_MARGIN = 5

var font_color : Color
var legend_array: Array # [label: String, color: Color, pos: Vector2]

onready var default_font: Font = Control.new().get_font("font")

func _draw():
	var new_rect := Rect2()

	for legend in legend_array:
		draw_string(default_font, legend[2], legend[0], font_color)
		var legend_size := default_font.get_string_size(legend[0])
		var color_rect := Rect2(legend[2] + Vector2(legend_size.x + TEXT_MARGIN, -legend_size.y), Vector2(legend_size.y, legend_size.y))
		draw_rect(color_rect, legend[1])
		draw_rect(color_rect, Color.white, false, 1.0)
	
	_update_box(new_rect)

func _update_box(rect_extents):
	rect_position = rect_extents.position
	rect_size = rect_extents.size
