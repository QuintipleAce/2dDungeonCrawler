extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_child(0).timeout.connect(_on_timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self, "label_settings:font_size", 9, 0.5)
	tween.parallel().tween_property(self, "position", Vector2(10, -22), 0.5)
	tween.parallel().tween_property(self, "label_settings:font_color", Vector4(182,0,0,0), 0.5)
	
	await tween.finished
	queue_free()
	print("hello")
