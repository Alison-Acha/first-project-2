extends CharacterBody2D


const SPEED = 25.0
#const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting('physics/2d/default_gravity')
var is_alive= true
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	add_to_group('Enemy')
func _physics_process(delta):
	velocity.y += gravity * delta

	# Handle jump.
	velocity.x = -SPEED
	update_animation()
	move_and_slide()
func update_animation():
	animated_sprite_2d.play('hop')
	
func _on_hitbox_body_entered(body):
	if body.is_in_group('Player'):
		is_alive= false
		queue_free()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	#move_and_slide()


#func _on_hitbox_body_entered(body: Node2D) -> void:
	#pass # Replace with function body.
