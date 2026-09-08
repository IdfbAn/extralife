extends Control

var game

func _ready():
    game = get_parent()

func _process(_delta):
    $You.text = "%s, age %d" % [Player.person_controlled.person_name,
        Player.person_controlled.person_age]
    $Parents.text = "Mother: %s, age %d\nFather: %s, age %d" % [
        Player.person_controlled.mother.person_name,
        Player.person_controlled.mother.person_age,
        Player.person_controlled.father.person_name,
        Player.person_controlled.father.person_age
    ]

func _on_age_up_pressed():
    for person: Person in game.all_people:
        if person.person_alive:
            person.person_age += 1
            
    %Events.text = (
        "You are now %d years old!\n" % Player.person_controlled.person_age
        + %Events.text
    )
