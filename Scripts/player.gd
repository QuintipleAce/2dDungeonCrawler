extends CharacterBody2D


var speed: int = 300
var dir: Vector2 = Vector2.ZERO
var last_dir: Vector2 = Vector2.RIGHT
var projectile_scene = preload("res://Scenes/bullet.tscn")
var projectile: Node2D

func _physics_process(delta: float) -> void:
	dir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = dir * speed
	move_and_slide()
	direction()
	shoot()
	

func shoot():
	
	if Input.is_action_just_pressed("KBMaction"):
		var mouse_pos = get_local_mouse_position()
		projectile = projectile_scene.instantiate()
		projectile.position = position
		projectile.rotation = mouse_pos.angle()
		projectile.dir = mouse_pos.normalized()
		get_tree().current_scene.find_child("Projectiles").add_child(projectile)

	if Input.is_action_just_pressed("CONaction"):
		projectile = projectile_scene.instantiate()
		projectile.position = position
		projectile.rotation = $MeshInstance2D.rotation
		projectile.dir = last_dir
		get_tree().current_scene.find_child("Projectiles").add_child(projectile)
	
	
func direction():
	if !dir == Vector2.ZERO:
		$MeshInstance2D.rotation = dir.angle()
		last_dir = dir
