extends RichTextLabel

var template = "Health: "
var label = ""
@onready var global = $"../.."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global.player_health > 0:
		label = str(template, str(global.player_health))
	else:
		label = str("GAME OVER. PRESS R TO RELOAD")
	self.text = label
	pass
