class_name LevelEndComponent
extends Node

#The end of a level is any area that should direct the player to another level

#when the end of a level is reached, some kind of transition should occur
@export var t_comp : TransitionComponent
@export var player : CharacterBody2D
#level end components should control level flow with this signal
signal change_level(i : int)
