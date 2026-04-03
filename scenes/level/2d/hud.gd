extends CanvasLayer

@export var player_container: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for player in player_container.get_children():
		if not player.is_local_player():
			continue
		$XLabel.text = "x=%.1f" % player.position.x
		$YLabel.text = "y=%.1f" % player.position.y
