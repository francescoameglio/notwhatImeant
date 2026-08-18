extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	hide()
	pass # Replace with function body.

func _on_dialogic_signal(argument: String):
	if argument == "play_idle":
		show()
		play("moving")
	if argument == "hide_sprite":
		hide()
