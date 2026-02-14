extends CharacterBody2D
var hp = 4 
var speed = 150
var damage: int = 1 
var direction: Vector2 = Vector2.DOWN
func _ready():
	hp+=($"../../..".difficulty-1)*2
	damage+=($"../../..".difficulty-1)
func hit(damage):
	hp = hp-damage

	
	
func _process(_delta):
	direction = ($"../../Player".global_position - global_position).normalized()
	velocity = direction * speed 
	move_and_slide()
	if hp <= 0:
		$"../../Player".exp += 2
		queue_free()

			




func _on_area_2d_body_entered(body):
	if body.has_method("gethit"):
		body.gethit(damage)
