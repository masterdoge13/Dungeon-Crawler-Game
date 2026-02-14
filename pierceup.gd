extends Button


signal pierceup()
func _ready():
	hide()


func _on_pressed():
	pierceup.emit()
	print("j")
	hide()


func _on_player_levelup():
	show()
	


func _on_damage_up_button_pressed():
	hide()


func _on_hp_up_button_pressed():
	hide()


func _on_firerate_up_button_pressed():
	hide()
