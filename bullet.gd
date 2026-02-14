extends Area2D

@export var speed: int = 1000
var direction = Vector2.LEFT
var damage = 1
var pierce = 1

func _process(delta):
	position += direction * speed * delta
	


func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit(damage)
		pierce -= 1
	if pierce <=0:
		queue_free()
