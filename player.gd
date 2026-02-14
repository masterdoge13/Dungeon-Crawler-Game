extends CharacterBody2D
var SPEED = 200
var can_shoot: bool = true
var damage: int = 2
var reloadspeed: float =2
var pierce: int = 2
var level: int = 1
var stat: int = 0
var exp: int = 0
var expneeded = level*30
var maxhp: int = 10
var hp: int = maxhp
signal gameover()
signal levelup()
signal bullet_fired(pos,direction)

	
func gethit(damage):
	hp = hp-damage
	print(hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up","down")
	velocity = direction*SPEED
	move_and_slide()
	
	if Input.is_action_pressed("fire") and can_shoot == true:
		can_shoot = false
		$Timer.start(1.0/reloadspeed)
		var bulletdirection = (get_global_mouse_position() - position).normalized()
		var pos = global_position
		bullet_fired.emit(pos, bulletdirection)
	if exp >= expneeded:
		exp = exp-expneeded
		level += 1
		stat += 1
		expneeded = level*30
		hp = maxhp
	if hp <= 0:
		gameover.emit()
	if stat > 0:
		levelup.emit()
func _on_timer_timeout():
	can_shoot = true
	




func _on_pierce_up_button_pierceup():
	pierce +=1
	stat -=1

func _on_damage_up_button_damageup():
	damage +=1
	stat -=1


func _on_hp_up_button_hpup():
	hp += 10
	maxhp += 10
	stat -=1


func _on_firerate_up_button_firerateup():
	reloadspeed += 1
	stat -=1
