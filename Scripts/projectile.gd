extends Area2D

var speed: int = 5
var dir: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$despawnTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += speed * dir
	
	



func _on_despawn_timer_timeout() -> void:
	queue_free()
