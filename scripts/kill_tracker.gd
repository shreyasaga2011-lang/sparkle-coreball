extends Label
func _process(_delta):
	text = "Points: " + str(KillTrackerNode.kills)
