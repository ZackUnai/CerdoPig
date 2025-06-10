extends CharacterBody2D

@export var spd = 150




func _ready():
	
	$AnimBXN.play("Idle")
	

func _process(delta):
	pass
	
	var movent : Vector2 = Vector2.ZERO
	
	# Movimiento
	
	if Input.is_action_pressed("R_MOVE"):
		
		movent.x += 1
		
		if Input.is_action_just_pressed("ATACK"):
			pass
	
	if Input.is_action_pressed("L_MOVE"):
		
		movent.x -= 1
		
		if Input.is_action_just_pressed("ATACK"):
			pass
	
	if Input.is_action_pressed("D_MOVE"):
		
		movent.y += 1
		
		if Input.is_action_just_pressed("ATACK"):
			pass
	
	if Input.is_action_pressed("U_MOVE"):
		
		movent.y -= 1
		
		if Input.is_action_just_pressed("ATACK"):
			pass
	
	velocity.x = movent.x * spd
	velocity.y = movent.y * spd
	
	move_and_slide()
	
	
	
	# Animaciones
	if $AnimBXN:
		if Input.is_action_pressed("L_MOVE"):
			
			$AnimBXN.play("L_Move")
			
			if Input.is_action_just_pressed("ATACK"):
				
				$AnimBXN.play("L_Atack")
		
		if Input.is_action_pressed("R_MOVE"):
		
			$AnimBXN.play("R_Move")
			
			if Input.is_action_just_pressed("ATACK"):
				
				$AnimBXN.play("R_Atack")
		
		if Input.is_action_pressed("U_MOVE"):
			
			$AnimBXN.play("U_Move")
			
			if Input.is_action_just_pressed("ATACK"):
				
				$AnimBXN.play("U_Atack")
		
		if Input.is_action_pressed("D_MOVE"):
			
			$AnimBXN.play("D_Move")
			
			if Input.is_action_just_pressed("ATACK"):
				
				$AnimBXN.play("D_Atack")
	
	else:
		$AnimBXN.stop(false)
		$AnimBXN.play("Idle")
	
