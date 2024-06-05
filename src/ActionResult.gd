class_name ActionResult
extends Node

enum conductor_action {
	Track,
	Remove,
	Pass
}

var action: conductor_action
var offset: float

func _init(action: conductor_action, offset: float):
	self.action = action
	self.offset = offset

static func Track(offset: float):
	return ActionResult.new(conductor_action.Track, offset)

static func Remove(offset: float):
	return ActionResult.new(conductor_action.Remove, offset)

static func Pass():
	return ActionResult.new(conductor_action.Pass, 0)
