extends Node
var multi = 1
var explosionBool = false

func upFirerate():
	if multi < 0.3:
		print(str(multi))
	else:
		multi -= 0.1
		print(str(multi))

func explosionUpgrade():
	if explosionBool == false:
		explosionBool = true
	else:
		explosionBool = false

var forcefieldBool = false
func buyForceField():
	forcefieldBool = true
