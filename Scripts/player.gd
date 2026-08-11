extends CharacterBody2D


var speed: int = 300
var dir: Vector2 = Vector2.ZERO
var bullet_scene = preload("res://Scenes/bullet.tscn")
var bullet: Node2D

func _physics_process(delta: float) -> void:
	dir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = dir * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("action"):
		bullet = bullet_scene.instantiate()
		shoot(bullet, get_local_mouse_position())
		

func shoot(bullet: Area2D, mouse_pos: Vector2):
	bullet.position = position
	bullet.rotation = mouse_pos.angle()
	bullet.dir = mouse_pos.normalized()
	get_tree().current_scene.find_child("Bullets").add_child(bullet)
	print("helloo")
