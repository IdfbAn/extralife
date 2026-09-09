extends Node

var all_people: Array[Person]

signal player_person_created

func _ready():
    var player_person = Person.new()

    player_person.person_name = "%s %s" % [Names.male_names.pick_random(),
        generate_surname(Names.surnames)]
    player_person.person_age = 0
    # TODO: player_person.person_location
    player_person.person_alive = true

    all_people.append(player_person)

    Player.person_controlled = player_person

    # Generate parents and grandparents of initial player-controlled person
    generate_parents(player_person)
    generate_parents(player_person.mother)
    generate_parents(player_person.father)

    $MainInterface/%Events.text += (
        "You have been born. Your name is %s." % player_person.person_name
    )

    player_person_created.emit()

func _process(_delta):
    pass

func generate_parents(person: Person):
    person.mother = Person.new()
    person.mother.person_age = person.person_age + randi_range(25, 40)
    person.mother.person_name = "%s %s" % [Names.female_names.pick_random(),
        generate_surname(Names.surnames)]

    person.father = Person.new()
    person.father.person_age = person.person_age + randi_range(25, 40)
    person.father.person_name = "%s %s" % [Names.male_names.pick_random(),
        person.person_name.split(" ")[1]]

    # Parents of initial player-controlled person are alive
    if person == Player.person_controlled:
        person.mother.person_alive = true
        person.father.person_alive = true

    person.mother.children.append(person)
    person.father.children.append(person)

    all_people.append(person.mother)
    all_people.append(person.father)

func generate_surname(surnames_array: Array):
    var chosen_surname = surnames_array.pick_random()
    if type_string(typeof(chosen_surname)).to_lower().begins_with("array"):
        chosen_surname = chosen_surname.pick_random()

    if chosen_surname in Names.male_names:
        if chosen_surname[-1] == 's':
            return "%son" % chosen_surname
        else:
            return "%sson" % chosen_surname
    else:
        return chosen_surname
