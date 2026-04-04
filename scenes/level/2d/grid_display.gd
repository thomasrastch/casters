extends Node2D

var rect
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
		$ColorRect.position = Vector2(
			floor(player.position.x / 64) * 64,
			floor(player.position.y / 64) * 64)
		$ColorRect.color = Color.from_hsv(
			hash(player.get_multiplayer_authority()) / (2**63-1),
			1-$ColorRect.position.distance_to(player.position)/64,
			1
		)
