extends CharacterBody2D
var hp = 150
var speed = 150
var damage: int = 3
var direction: Vector2 = Vector2.DOWN
var state = "follow"
signal bossdeath
func _ready():
	hp+=($"../../..".difficulty-1)*50
	damage+=($"../../..".difficulty-1)*2
func hit(damage):
	hp = hp-damage


func _process(_delta):
	if state == "follow":
		direction = ($"../../Player".global_position - global_position).normalized()
	if state != "hold":
		velocity = direction * speed 
		move_and_slide()
	if $"../../../boss music".playing == false:
		$"../../../boss music".playing = true
	if hp <= 0:
		$"../../..".difficulty +=1
		$"../../Player".exp += 300
		$"../../../boss music".playing = false
		$"../../../bg music".playing = true
		bossdeath.emit()
		queue_free()

			




func _on_area_2d_body_entered(body):
	if body.has_method("gethit"):
		body.gethit(damage)



func _on_ability_timer_timeout():
	state = "hold"
	$"ability charge".start(.5)
	


func _on_ability_charge_timeout():
	state = "move"
	speed = 1000
	$"ability length".start(1)


func _on_ability_length_timeout():
	state = "follow"
	speed = 130
	$"ability timer".start(3)
