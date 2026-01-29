extends "res://hud/SensorDisplay.gd"


func _ready() -> void:
	call_deferred("_synchronize_styles")

func _synchronize_styles() -> void:
	var parent := get_parent()
	if not parent:
		return

	var siblings := parent.get_children()
	var my_index := get_index()
	
	var sibling_label: Label = null
	var sibling_unit: Label = null

	if my_index > 0:
		var prev_node = siblings[my_index - 1]
		if prev_node is Label:
			sibling_label = prev_node

	if my_index < siblings.size() - 1:
		var next_node = siblings[my_index + 1]
		if next_node is Label:
			sibling_unit = next_node

	var found_ok_color = null
	var found_warn_color = null
	var found_err_color = null
	var found_label_color: Color
	var has_label_color := false

	for child in siblings:
		if child == self or child == sibling_label or child == sibling_unit:
			continue
			
		if found_ok_color == null and "okColor" in child:
			found_ok_color = child.okColor
			if "warnColor" in child:
				found_warn_color = child.warnColor
			if "errColor" in child:
				found_err_color = child.errColor
		
		if not has_label_color and child is Label:
			found_label_color = child.modulate
			has_label_color = true
		
		if found_ok_color != null and has_label_color:
			break

	if found_ok_color != null:
		if "okColor" in self:
			self.okColor = found_ok_color
		if found_warn_color != null and "warnColor" in self:
			self.warnColor = found_warn_color
		if found_err_color != null and "errColor" in self:
			self.errColor = found_err_color
		
	if has_label_color:
		if sibling_label:
			sibling_label.modulate = found_label_color
		if sibling_unit:
			sibling_unit.modulate = found_label_color

