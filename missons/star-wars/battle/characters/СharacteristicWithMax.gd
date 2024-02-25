extends Сharacteristic

class_name СharacteristicWithMax

var valueMax = 0

func _init(name, value):
	super(name, value)
	self.valueMax = value 

func plus(val):
	var newVal = value + val
	if newVal > valueMax:
		value = valueMax
	else:
		value = newVal
