extends Node2D

@export var x_squares = 3
@export var y_squares = 3
@export var square_size = 64

@export var player_container: Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for player in player_container.get_children():
		if not player.is_local_player():
			continue
		for i in range(3):
			for j in range(3):
				var rect = get_node("ColorRect%d%d" % [i, j])
				rect.position = Vector2(
					floor(player.position.x / 64 - 0.5) * 64 + (i - 1) * 64,
					floor(player.position.y / 64 - 0.5) * 64 + (j - 1) * 64)
				rect.color = Color.from_hsv(
					hash(player.get_multiplayer_authority()) / (2**63-1),
					0.5-rect.position.distance_to(player.position - Vector2(32,32))/128,
					1
				)
