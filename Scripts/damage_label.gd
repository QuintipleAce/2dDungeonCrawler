extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var timer = Timer.new()
	#timer.wait_time = 0.2
	#timer.one_shot = true
	#add_child(timer)
	#timer.timeout.connect(_on_timer_timeout)
	#timer.start()
	
	#if not $Timer.timeout.is_connected(_on_timer_timeout):
	get_child(0).timeout.connect(_on_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout():
	label_settings.font_color = Color(0.714, 0.0, 0.0, 1.0)
	label_settings.font_size = 3
	position = Vector2(-9.5, -11.5)
	
	var tween = self.create_tween()
	tween.tween_property(self, "label_settings:font_size", 5, 0.5)
	tween.parallel().tween_property(self, "position", Vector2(10, -22), 0.5)
	#tween.parallel().tween_property(self, "label_settings:font_color", Color(0.712, 0.0, 0.0, 0.5), 0.5)
	
	await tween.finished
	queue_free()
