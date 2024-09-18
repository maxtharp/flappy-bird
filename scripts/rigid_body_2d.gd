extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	flap()
	pass
	
func flap():
	var animator = $AnimatedSprite2D
	
	if (Input.is_action_just_pressed("flap")):
		apply_force(Vector2(0,-30000))
		animator.play("glide")
	else:
		animator.play("flap")
	pass
