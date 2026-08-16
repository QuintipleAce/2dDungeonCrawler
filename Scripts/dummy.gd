extends CharacterBody2D

const speed = 300.0
var HP = 1000000

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass


func pathfind():
	pass


func hit(damage):
	$damageLabel.text = str(damage)
	$damageLabel.label_settings.font_color = Color(0.714, 0.0, 0.0, 1.0)
	$damageLabel.label_settings.font_size = 3
	$damageLabel.position = Vector2(-9.5, -11.5)
	
	var damage_text = $damageLabel.duplicate()
	add_child(damage_text)
	
	damage_text.get_node("Timer").start()
	damage_text.visible = true
	var tween = create_tween()
	tween.tween_property(damage_text, "label_settings:font_size", 16, 0.2)
	tween.parallel().tween_property(damage_text, "position", Vector2(0.0, -22), 0.2)
	
	HP -= damage
