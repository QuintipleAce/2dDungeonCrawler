extends CharacterBody2D


@export var speed: int = 300
@export var dash_speed: int = 500
@export var dash_time: float = 0.3
@export var dash_cooldown: float = 1.0

var dir: Vector2 = Vector2.ZERO
var last_dir: Vector2 = Vector2.RIGHT
var projectile_scene = preload("res://Scenes/projectile.tscn")
var projectile: Node2D
var is_dashing: bool = false
var able_dash: bool = true


func _ready() -> void:
	$dashTimer.wait_time = dash_time
	$dashCooldownTimer.wait_time = dash_cooldown

func _physics_process(delta: float) -> void:
	if not is_dashing:
		dir = Input.get_vector("left", "right", "up", "down").normalized()
		velocity = dir * speed
	direction()
	dash()
	move_and_slide()
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


func dash():
	if able_dash:
		if Input.is_action_just_pressed("CONdash"):
			is_dashing = true
			able_dash = false
			velocity = last_dir * dash_speed
			$dashTimer.start()
			
		if Input.is_action_just_pressed("KBMdash"):
			is_dashing = true
			able_dash = false
			velocity = last_dir * dash_speed
			$dashTimer.start()


func _on_dash_timer_timeout() -> void:
	is_dashing = false
	$dashCooldownTimer.start()


func _on_dash_cooldown_timer_timeout() -> void:
	able_dash = true
