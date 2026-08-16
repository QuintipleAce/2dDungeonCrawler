extends CharacterBody2D

var DamageUI_scene = preload("res://Scenes/damage_ui.tscn")
const speed = 300.0
var HP = 1000000
var damage_texts: Array = []

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass


func hit(damage):
	$damageLabel.text = str(damage)
	var damage_text = $damageLabel.duplicate() as Label
	add_child(damage_text)
	
	#damage_texts.append(damage_text)
	
	damage_text.get_child(0).start()
	damage_text.visible = true
	var tween = create_tween()
	tween.tween_property(damage_text, "label_settings:font_size", 16, 0.2)
	tween.parallel().tween_property(damage_text, "position", Vector2(0.0, -22), 0.2)
	
	HP -= damage
	print(HP)


#func _on_timer_timeout() -> void:
	#var tween = create_tween()
	#tween.tween_property(damage_texts[0], "label_settings:font_size", 9, 5)
	#tween.parallel().tween_property(damage_texts[0], "position", Vector2(10, -22), 5)
	#
	#print(damage_texts)
	#await tween.finished
	##damage_texts[0].queue_free()
	##damage_texts.remove_at(0)
	#print(damage_texts)
	#print("hello")
