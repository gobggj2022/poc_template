class_name Door
extends Area2D


# The Coins only detects collisions with the Player thanks to its collision mask.
# This prevents other characters such as enemies from picking up coins.

# When the player collides with a coin, the coin plays its "picked" animation.
# The animation takes cares of making the coin disappear, but also deactivates its
# collisions and frees it from memory, saving us from writing more complex code.
# Click the AnimationPlayer node to see the animation timeline.
signal door_entered()

var is_player_passed = false

func _on_Door_body_entered(body):
	if body is Player && !is_player_passed:
		is_player_passed = true
		self.emit_signal('door_entered')

