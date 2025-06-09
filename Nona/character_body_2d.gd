extends CharacterBody2D

var spd = 50

func _process(delta):
	
	var movet : Vector2
	
	if Input.is_key_pressed(KEY_A):
		movet.x -= 1
		
	
	if Input.is_key_pressed(KEY_D):
		movet.x += 1
		
	
	if Input.is_key_pressed(KEY_S):
		movet.y += 1
		
	
	if Input.is_key_pressed(KEY_W):
		movet.y -= 1
		
	
	velocity.x = movet.x * spd
	velocity.y = movet.y * spd
	
	move_and_slide()
	
	if Input.is_key_pressed(KEY_Q):
		queue_free()
		
