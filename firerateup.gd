extends Button
signal firerateup()

func _ready():
	hide()



func _on_pressed():
	firerateup.emit()
	print("hi")
	hide()


func _on_player_levelup():
	show()


func _on_hp_up_button_pressed():
	hide()


func _on_pierce_up_button_pressed():
	hide()

func _on_damage_up_button_pressed():
	hide()
