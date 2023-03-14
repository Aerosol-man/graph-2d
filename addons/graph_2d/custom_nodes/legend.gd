tool
extends Panel

const TEXT_MARGIN = 5
const BACKGROUND_MARGIN = 3

var font_color : Color
var legend_array: Array # [label: String, color: Color, pos: Vector2]

onready var default_font: Font = Control.new().get_font("font")

func _draw():
	draw_set_transform(-rect_global_position, 0.0, Vector2.ONE)  # Global Coordinates
	var new_rect := Rect2(rect_global_position, Vector2.ONE)

	for legend in legend_array:
		draw_string(default_font, legend[2], legend[0], font_color)
		var string_size := default_font.get_string_size(legend[0])
		var color_rect := Rect2(legend[2] + Vector2(string_size.x + TEXT_MARGIN, -string_size.y), Vector2(string_size.y, string_size.y))
		draw_rect(color_rect, legend[1])
		draw_rect(color_rect, Color.white, false, 1.0)
		
		new_rect = new_rect.expand(legend[2] + string_size)
		new_rect = new_rect.merge(color_rect)
		new_rect = new_rect.grow(BACKGROUND_MARGIN)
	
	_update_box(new_rect)

func get_text_size() -> Vector2:
	var out := rect_global_position
	
	for legend in legend_array:
		var string_size := default_font.get_string_size(legend[0])
		out.x = max(out.x, legend[2].x + string_size.x + TEXT_MARGIN + string_size.y + BACKGROUND_MARGIN)
	
	out.y = legend_array[-1].y + BACKGROUND_MARGIN
	
	return out

func _update_box(rect_extents):
	rect_position = rect_extents.position
	rect_size = rect_extents.size
