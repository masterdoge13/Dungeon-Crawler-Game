extends Node2D
var bullet_scene = preload("res://bullet.tscn")
var goblinenemy_scene = preload("res://meleegoblinenemy.tscn")
var orc_boss_scene = preload("res://orc_boss.tscn")
var difficulty = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused=false





func _on_player_bullet_fired(pos, direction):
	var shoot = bullet_scene.instantiate()
	shoot.direction = direction
	shoot.global_position = pos
	shoot.rotation = direction.angle()
	shoot.damage = $pausable/Player.damage
	shoot.pierce = $pausable/Player.pierce
	$pausable/Projectiles.add_child(shoot)
	
var enemypos: Vector2 = Vector2(0,0)
var choice = 0
func _on_timer_timeout():
	for i in range(5*difficulty):
		choice = randi_range(1,3)
		var goblin = goblinenemy_scene.instantiate()
		enemypos = ($pausable/Player.global_position+Vector2(randf_range(-2,3),randf_range(-2,3)) - $pausable/Player.global_position).normalized()*2000
		goblin.position = $pausable/Player.global_position +enemypos
		$pausable/Enemies.add_child(goblin)



func _on_player_levelup():
	print("lvl up")
	print($pausable/Player.expneeded)
	print($pausable/Player.level)


func _on_player_gameover():
	$"bg music".playing = false
	$"boss music".playing = false
	get_tree().change_scene_to_file("res://gameover.tscn")


func _on_boss_spawn_timer_timeout():
	var orcboss = orc_boss_scene.instantiate()
	enemypos = ($pausable/Player.global_position+Vector2(randf_range(-2,3),randf_range(-2,3)) - $pausable/Player.global_position).normalized()*2000
	orcboss.position = $pausable/Player.global_position +enemypos
	$pausable/Enemies.add_child(orcboss)
	$"bg music".playing = false
	$"boss music".playing = true
