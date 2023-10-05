extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var  speed = 100
@onready var anim =$AnimatedSprite2D
var alive = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var player = get_node("/root/Start_game/Player/Player")
	var  direction = (player.global_position - self.global_position).normalized()
	print("Boar-position :", self.global_position)
	print("Player-position :", player.global_position)
	print("Boar-direction :", direction)
	if alive == true:
		if chase == true:
			velocity.x = direction.x * speed
			anim.play("Run")
		else :
			velocity.x = 0
			anim.play("Idel")
		if direction.x < 0:
			$AnimatedSprite2D. flip_h = false
		else :
			$AnimatedSprite2D. flip_h= true
		
	move_and_slide()


func _on_detector_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_detector_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_heat_body_entered(body):
	if body.name == "Player":
		heat()
	
func heat ():
		alive = false
		anim.play("Heat")
		await anim.animation_finished
		queue_free()
