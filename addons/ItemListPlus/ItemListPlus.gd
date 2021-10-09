extends VBoxContainer

var items = []
var tempitems = []

var itemres = preload('res://addons/ItemListPlus/ItemPlus.tscn')

func _ready(): AddItem('Bebra')

func UpdateList():
	if tempitems != items:
		tempitems = items
		#removing items from list
		for i in get_children():
			i.queue_free()
		#and adding again
		for i in items.size() - 1:
			var iteminststance = itemres.instance()
			add_child(iteminststance)
			iteminststance.name = str(i)

func AddItem(name : String):
	items.append(name)
	var iteminststance = itemres.instance()
	add_child(iteminststance)
	iteminststance.get_node("Label").text = name
	iteminststance.name = str(items.size() - 1)
