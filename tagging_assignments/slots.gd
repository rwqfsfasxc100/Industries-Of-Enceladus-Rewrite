extends Node

const HOLD_MODIFIER_DIVIDED = {
	"system_slot":"cargo.modifierDivided",
	"slot_node_name":"HoldModifiersDivided",
	"slot_display_name":"SLOT_CARGOBAY_MOD",
	"always_display":false,
	"add_vanilla_equipment":false,
	"slot_type":"HOLD_MODIFIERS", 
	"restriction":"HOLDMODIFIER_DIVIDED"
}
const HOLD_MODIFIER_AMORPHIC = {
	"system_slot":"cargo.modifierAmorphic",
	"slot_node_name":"HoldModifiersAmorphic",
	"slot_display_name":"SLOT_CARGOBAY_MOD",
	"always_display":false,
	"add_vanilla_equipment":false,
	"slot_type":"HOLD_MODIFIERS", 
	"restriction":"HOLDMODIFIER_AMORPHIC"
}
const CARGO_ACCESSORIES = {
	"system_slot":"cargo.aux",
	"slot_node_name":"CargoAccessories",
	"slot_display_name":"SLOT_CARGO_AUX",
	"always_display":false,
	"add_vanilla_equipment":false,
	"slot_type":"CARGO_ACCESSORIES",
	"limit_ships":[
		"SHIP_PROSPECTOR_BALD",
		"SHIP_KITSUNE",
		"SHIP_TRTL_T",
		"SHIP_TRTL_R",
		"SHIP_EIME",
		"SHIP_OCP209",
		"SHIP_OCP209_SNAP",
		"SHIP_OBERON",
		"SHIP_ATLAS_WASP"
	],
	"invert_limit_logic":true
}
const CREW_MODIFIERS = {
	"system_slot":"crew.modifier",
	"slot_node_name":"CrewModifiers",
	"slot_display_name":"SLOT_CREW_MOD",
	"always_display":false,
	"add_vanilla_equipment":false,
	"slot_type":"CREW_MODIFIERS"
}
const TURRET_LEFT = {
	"system_slot":"weaponSlot.turretLeft.type",
	"slot_node_name":"LeftTurretSlot",
	"slot_display_name":"SLOT_TURRET_LEFT",
	"always_display":false,
	"slot_type":"HARDPOINT",
	"hardpoint_type":"HARDPOINT_TURRET",
	"alignment":"ALIGNMENT_LEFT"
}
const TURRET_RIGHT = {
	"system_slot":"weaponSlot.turretRight.type",
	"slot_node_name":"RightTurretSlot",
	"slot_display_name":"SLOT_TURRET_RIGHT",
	"always_display":false,
	"slot_type":"HARDPOINT",
	"hardpoint_type":"HARDPOINT_TURRET",
	"alignment":"ALIGNMENT_RIGHT"
}
const RCS_LARGE = {
	"system_slot":"propulsion.rcsLarge",
	"slot_node_name":"RCSLarge",
	"slot_display_name":"SLOT_RCS_LARGE",
	"always_display":false,
	"slot_type":"STANDARD_MAIN_ENGINE"
}
const TORCH_LARGE = {
	"system_slot":"propulsion.mainLarge",
	"slot_node_name":"TorchLarge",
	"slot_display_name":"SLOT_MAIN_LARGE",
	"always_display":false,
	"slot_type":"LARGE_TORCH"
}
