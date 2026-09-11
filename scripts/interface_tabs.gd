extends Control

@onready var interfaces: Array[Control] = [$"../MainInterface", $"../FamilyTree"]

func _on_main_pressed():
    switch_interface($"../MainInterface")

func _on_family_tree_pressed():
    switch_interface($"../FamilyTree")

func switch_interface(scene: Control):
    assert(scene in interfaces, "Given scene not in interfaces array")
    for interface in interfaces:
        if interface == scene:
            continue
        else:
            interface.hide()
    scene.show()
