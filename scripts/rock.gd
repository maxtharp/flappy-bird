extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: 
	self.position.x -=  7
	pass
	



func _on_body_entered(body: Node2D) -> void:
	var parent = self.get_parent()
	parent.plane_hit()
