extends RichTextLabel

@export var typing_speed: float = 0.05
@export var texture_rect: TextureRect

var is_typing: bool = false
var current_line: int = 0

var dialogue = [
	{ "text": "Iwish I had more things to say but it feels so empty now...", "image": preload("res://assets/img_line01.png") },
	{ "text": "The only thing I can do is showing weird images", "image": preload("res://assets/img_line02.png") },
	{ "text": "Sometimes I wonder if you feel the same.", "image": preload("res://assets/img_line03.png") },
]

func _ready():
	texture_rect.texture = dialogue[0].image
	type_text()

func type_text():
	is_typing = true
	text = dialogue[current_line].text
	visible_characters = 0
	var tween = create_tween()
	tween.tween_property(self, "visible_characters", get_total_character_count(),
						 get_total_character_count() * typing_speed)
	await tween.finished
	is_typing = false

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if is_typing:
			visible_characters = -1
			is_typing = false
		else:
			current_line += 1
			if current_line < dialogue.size():
				texture_rect.texture = dialogue[current_line].image
				type_text()


func _on_button_pressed():
	pass # Replace with function body.
