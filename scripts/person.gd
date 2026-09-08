class_name Person extends Node
## Base class/scene of all people in the game.
##
## This should never be instantiated, only scenes based on it.

var person_name: String
var person_age: int
var person_location: Vector3

var person_alive: bool

var mother: Person
var father: Person

var children: Array[Person]

func _ready():
    pass

func _process(_delta):
    pass
