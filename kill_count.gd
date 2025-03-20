extends RichTextLabel

var template = "Kill Count: "
@onready var global = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var text = str(template, str(global.kill_count))
	self.text = text
	pass
