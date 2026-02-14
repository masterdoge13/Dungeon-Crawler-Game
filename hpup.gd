extends Button
signal hpup()

func _ready():
	hide()



func _on_pressed():
	hpup.emit()
	print("hi")
	hide()


func _on_player_levelup():
	show()


func _on_firerate_up_button_pressed():
	hide()


func _on_pierce_up_button_pressed():
	hide()


func _on_damage_up_button_pressed():
	hide()
