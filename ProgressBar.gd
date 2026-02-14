extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	max_value=$"..".maxhp
	value = $"..".hp
func _process(delta):
	max_value=$"..".maxhp
	value = $"..".hp
