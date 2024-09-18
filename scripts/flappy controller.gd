extends Node2D

@export var down_rock_resource = preload("res://scenes/down_rock.tscn")
@export var up_rock_resource = preload("res://scenes/up_rock.tscn")
@export var plane_resource = preload("res://scenes/plane.tscn")
@onready var rockTimer = $rockTimer
@onready var game_over_control = $Control
@onready var plane = plane_resource.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(plane)
	plane.global_position = Vector2(324, 324)
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass
 
func plane_hit():
	$Node2D/thud.play()
	rockTimer.stop()
	game_over_control.visible = true
	$Control/AnimationPlayer.play("slide")
	plane.process_mode = Node.PROCESS_MODE_DISABLED

func _on_rock_timer_timeout() -> void:
	var up_rock = up_rock_resource.instantiate()
	var down_rock = down_rock_resource.instantiate()
	
	if randf() < .5:
		add_child(down_rock)
		down_rock.global_position = Vector2(1500, 50)
	else:
		add_child(up_rock)
		up_rock.global_position = Vector2(1500, 600)


func _on_button_pressed() -> void:
	plane.global_position.y = 324
	plane.process_mode = Node.PROCESS_MODE_ALWAYS
	rockTimer.start()
	game_over_control.visible = false
	
