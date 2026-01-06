extends Node
var multi = 1


func upFirerate():
	if multi < 0.3:
		print(str(multi))
	else:
		multi -= 0.1
		print(str(multi))
