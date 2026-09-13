extends Control

@onready var interfaces: Array[Control] = [$"../MainInterface"]

func _on_main_pressed():
    switch_interface($"../MainInterface")

func switch_interface(scene: Control):
    assert(scene in interfaces, "Given scene not in interfaces array")
    for interface in interfaces:
        if interface == scene:
            continue
        else:
            interface.hide()
    scene.show()
