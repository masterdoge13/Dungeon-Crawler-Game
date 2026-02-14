extends Button
signal damageup()

func _ready():
	hide()



func _on_pressed():
	damageup.emit()
	print("hi")
	hide()


func _on_player_levelup():
	show()


func _on_pierce_up_button_pressed():
	hide()


func _on_hp_up_button_pressed():
	hide()


func _on_firerate_up_button_pressed():
	hide()
