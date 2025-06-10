extends Node

const SALVAGE_LIGHT = {
	"system":"SYSTEM_SALVAGE_ARM_LIGHT",
	"manual":"SYSTEM_SALVAGE_ARM_LIGHT",
	"price":87500,
	"test_protocol":"arm",
	"warn_if_electric_below":100,
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_CENTER",
	"equipment_type":"EQUIPMENT_MANIPULATOR_LIGHT"
}
const SALVAGE_LIGHT_L = {
	"system":"SYSTEM_SALVAGE_ARM_LIGHT-L",
	"name_override":"SYSTEM_SALVAGE_ARM_LIGHT",
	"manual":"SYSTEM_SALVAGE_ARM_LIGHT",
	"price":87500,
	"test_protocol":"arm",
	"warn_if_electric_below":100,
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_LEFT",
	"equipment_type":"EQUIPMENT_MANIPULATOR_LIGHT"
}
const SALVAGE_LIGHT_R = {
	"system":"SYSTEM_SALVAGE_ARM_LIGHT-R",
	"name_override":"SYSTEM_SALVAGE_ARM_LIGHT",
	"manual":"SYSTEM_SALVAGE_ARM_LIGHT",
	"price":87500,
	"test_protocol":"arm",
	"warn_if_electric_below":100,
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_RIGHT",
	"equipment_type":"EQUIPMENT_MANIPULATOR_LIGHT"
}
const SALVAGE_HEAVY = {
	"system":"SYSTEM_SALVAGE_ARM_HEAVY",
	"manual":"SYSTEM_SALVAGE_ARM_HEAVY",
	"price":125000,
	"test_protocol":"arm",
	"warn_if_electric_below":100,
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_CENTER",
	"equipment_type":"EQUIPMENT_MANIPULATION_ARMS"
}
const SALVAGE_HEAVY_L = {
	"system":"SYSTEM_SALVAGE_ARM_HEAVY-L",
	"name_override":"SYSTEM_SALVAGE_ARM_HEAVY",
	"manual":"SYSTEM_SALVAGE_ARM_HEAVY",
	"price":125000,
	"test_protocol":"arm",
	"warn_if_electric_below":100,
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_LEFT",
	"equipment_type":"EQUIPMENT_MANIPULATION_ARMS"
}
const SALVAGE_HEAVY_R = {
	"system":"SYSTEM_SALVAGE_ARM_HEAVY-R",
	"name_override":"SYSTEM_SALVAGE_ARM_HEAVY",
	"manual":"SYSTEM_SALVAGE_ARM_HEAVY",
	"price":125000,
	"test_protocol":"arm",
	"warn_if_electric_below":100,
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_RIGHT",
	"equipment_type":"EQUIPMENT_MANIPULATION_ARMS"
}
const MWTIGHTBEAM = {
	"system":"SYSTEM_MWTIGHTBEAM",
	"manual":"SYSTEM_MWG_MANUAL",
	"price":165000,
	"slot_type":"HARDPOINT",
	"equipment_type":"EQUIPMENT_MICROWAVES"
}
const MWTIGHTBEAM_PDT = {
	"system":"SYSTEM_MWTIGHTBEAM_PDT",
	"manual":"SYSTEM_PDMWG_MANUAL",
	"price":265000,
	"test_protocol":"pdt",
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_CENTER",
	"equipment_type":"EQUIPMENT_TURRETS"
}
const MWTIGHTBEAM_PDT_L = {
	"system":"SYSTEM_MWTIGHTBEAM_PDT-L",
	"name_override":"SYSTEM_MWTIGHTBEAM_PDT",
	"manual":"SYSTEM_PDMWG_MANUAL",
	"price":265000,
	"test_protocol":"pdt",
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_LEFT",
	"equipment_type":"EQUIPMENT_TURRETS"
}
const MWTIGHTBEAM_PDT_R = {
	"system":"SYSTEM_MWTIGHTBEAM_PDT-R",
	"name_override":"SYSTEM_MWTIGHTBEAM_PDT",
	"manual":"SYSTEM_PDMWG_MANUAL",
	"price":265000,
	"test_protocol":"pdt",
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_RIGHT",
	"equipment_type":"EQUIPMENT_TURRETS"
}
const PDTL = {
	"system":"SYSTEM_PDTL",
	"manual":"SYSTEM_PDTL_MANUAL",
	"price":300000,
	"test_protocol":"pdt",
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_CENTER",
	"warn_if_electric_below":100,
	"story_flag":"hardware.nakamura",
	"story_flag_min":5,
	"equipment_type":"EQUIPMENT_TURRETS"
}
const PDTL_L = {
	"system":"SYSTEM_PDTL-L",
	"name_override":"SYSTEM_PDTL",
	"manual":"SYSTEM_PDTL_MANUAL",
	"price":300000,
	"test_protocol":"pdt",
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_LEFT",
	"warn_if_electric_below":100,
	"story_flag":"hardware.nakamura",
	"story_flag_min":5,
	"equipment_type":"EQUIPMENT_TURRETS"
}
const PDTL_R = {
	"system":"SYSTEM_PDTL-R",
	"name_override":"SYSTEM_PDTL",
	"manual":"SYSTEM_PDTL_MANUAL",
	"price":300000,
	"test_protocol":"pdt",
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_RIGHT",
	"warn_if_electric_below":100,
	"story_flag":"hardware.nakamura",
	"story_flag_min":5,
	"equipment_type":"EQUIPMENT_TURRETS"
}
const DND_HARVTUG = {
	"system":"SYSTEM_DND_HARVTUG",
	"manual":"SYSTEM_DND_TS_MANUAL",
	"price":385000,
	"test_protocol":"drone",
	"warn_if_electric_below":50,
	"slot_type":"HARDPOINT",
	"equipment_type":"EQUIPMENT_NANODRONES"
}
const DND_HARVHAUL = {
	"system":"SYSTEM_DND_HARVHAUL",
	"manual":"SYSTEM_DND_HAUL_MANUAL",
	"price":525000,
	"test_protocol":"drone",
	"warn_if_electric_below":50,
	"slot_type":"HARDPOINT",
	"equipment_type":"EQUIPMENT_NANODRONES"
}
const EXODYN_L = {
	"system":"SYSTEM_EXODYN-L",
	"name_override":"SYSTEM_EXODYN",
	"manual":"SYSTEM_EXSTORAGE_MANUAL",
	"price":132500,
	"test_protocol":"detach",
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_LEFT",
	"equipment_type":"EQUIPMENT_CARGO_CONTAINER"
}
const EXODYN_R = {
	"system":"SYSTEM_EXODYN-R",
	"name_override":"SYSTEM_EXODYN",
	"manual":"SYSTEM_EXSTORAGE_MANUAL",
	"price":132500,
	"test_protocol":"detach",
	"slot_type":"HARDPOINT",
	"alignment":"ALIGNMENT_RIGHT",
	"equipment_type":"EQUIPMENT_CARGO_CONTAINER"
}
#const AMMO_200 = {
#	"num_val":200,
#	"system":"SYSTEM_AMMO_200",
#	"manual":"SYSTEM_AMMO_MANUAL",
#	"price":500,
#	"test_protocol":"takeoff",
#	"slot_type":"MASS_DRIVER_AMMUNITION",
#	"equipment_type":"CONSUMABLE_MASS_DRIVER_AMMUNITION"
#}
#const PROPELLANT_1000000 = {
#	"num_val":1000000,
#	"system":"SYSTEM_FUEL_1000000",
#	"manual":"SYSTEM_FUEL_MANUAL",
#	"price":750000,
#	"test_protocol":"takeoff",
#	"slot_type":"PROPELLANT_TANK",
#	"equipment_type":"CONSUMABLE_PROPELLANT"
#}
#const PROPELLANT_2000000 = {
#	"num_val":2000000,
#	"system":"SYSTEM_FUEL_2000000",
#	"manual":"SYSTEM_FUEL_MANUAL",
#	"price":1950000,
#	"test_protocol":"takeoff",
#	"slot_type":"PROPELLANT_TANK",
#	"equipment_type":"CONSUMABLE_PROPELLANT"
#}
#const RCS_PNTRM = {
#	"system":"SYSTEM_THRUSTER_PNTRM",
#	"manual":"SYSTEM_THRUSTER_MANUAL",
#	"price":2750,
#	"test_protocol":"autopilot",
#	"warn_if_thermal_below":0.9,
#	"slot_type":"STANDARD_REACTION_CONTROL_THRUSTERS",
#	"equipment_type":"THRUSTER_STANDARD_REACTION_CONTROL_THRUSTERS"
#}
#const RCS_BLAST = {
#	"system":"SYSTEM_THRUSTER_BLAST",
#	"manual":"SYSTEM_THRUSTER_MANUAL",
#	"price":15500,
#	"test_protocol":"autopilot",
#	"warn_if_thermal_below":3.0,
#	"warn_if_electric_below":35,
#	"slot_type":"STANDARD_REACTION_CONTROL_THRUSTERS",
#	"equipment_type":"THRUSTER_STANDARD_REACTION_CONTROL_THRUSTERS"
#}
#const RCS_PIN150 = {
#	"system":"SYSTEM_THRUSTER_PIN150",
#	"manual":"SYSTEM_THRUSTER_MANUAL",
#	"price":31500,
#	"test_protocol":"autopilot",
#	"warn_if_thermal_below":1.3,
#	"warn_if_electric_below":250,
#	"slot_type":"STANDARD_REACTION_CONTROL_THRUSTERS",
#	"equipment_type":"THRUSTER_STANDARD_REACTION_CONTROL_THRUSTERS"
#}
const TORCH_SOYUZ = {
	"system":"SYSTEM_MAIN_ENGINE_SOYUZ",
	"manual":"SYSTEM_MAIN_ENGINE_MANUAL",
	"price":35000,
	"test_protocol":"autopilot",
	"slot_type":"STANDARD_MAIN_ENGINE",
	"equipment_type":"THRUSTER_STANDARD_MAIN_ENGINE"
}
const TORCH_THUNDER = {
	"system":"SYSTEM_MAIN_ENGINE_THUNDER",
	"manual":"SYSTEM_MAIN_ENGINE_MANUAL",
	"price":102000,
	"test_protocol":"autopilot",
	"story_flag":"ringrace",
	"story_flag_min":1,
	"slot_type":"STANDARD_MAIN_ENGINE",
	"equipment_type":"THRUSTER_STANDARD_MAIN_ENGINE"
}
const TORCH_GEMINI = {
	"system":"SYSTEM_MAIN_ENGINE_GEMINI",
	"manual":"SYSTEM_MAIN_ENGINE_MANUAL",
	"price":345000,
	"test_protocol":"autopilot",
	"warn_if_thermal_below":5.6,
	"warn_if_electric_below":100,
	"slot_type":"STANDARD_MAIN_ENGINE",
	"equipment_type":"THRUSTER_STANDARD_MAIN_ENGINE"
}
const TORCH_PMS2 = {
	"system":"SYSTEM_MAIN_ENGINE_PMS",
	"manual":"SYSTEM_MAIN_ENGINE_MANUAL",
	"price":4000,
	"test_protocol":"autopilot",
	"slot_type":"STANDARD_MAIN_ENGINE",
	"equipment_type":"THRUSTER_STANDARD_MAIN_ENGINE"
}
const TORCH_NANI = {
	"system":"SYSTEM_MAIN_ENGINE_NANI",
	"manual":"SYSTEM_MAIN_ENGINE_MANUAL",
	"price":425000,
	"test_protocol":"autopilot",
	"slot_type":"STANDARD_MAIN_ENGINE",
	"equipment_type":"THRUSTER_STANDARD_MAIN_ENGINE"
}
const TORCH_PIN1200 = {
	"system":"SYSTEM_MAIN_ENGINE_PIN1200",
	"manual":"SYSTEM_MAIN_ENGINE_MANUAL",
	"price":1180000,
	"test_protocol":"autopilot",
	"slot_type":"STANDARD_MAIN_ENGINE",
	"equipment_type":"THRUSTER_STANDARD_MAIN_ENGINE"
}
const TORCH_CRACK = {
	"system":"SYSTEM_MAIN_ENGINE_CRACK",
	"manual":"SYSTEM_MAIN_ENGINE_MANUAL",
	"price":1575000,
	"test_protocol":"autopilot",
	"slot_type":"STANDARD_MAIN_ENGINE",
	"equipment_type":"THRUSTER_STANDARD_MAIN_ENGINE"
}
#const RODS_1 = {
#	"num_val":1,
#	"system":"SYSTEM_RODS_1",
#	"manual":"SYSTEM_RODS_MANUAL",
#	"price":20000,
#	"test_protocol":"takeoff",
#	"slot_type":"FISSION_RODS",
#	"equipment_type":"POWER_FISSION_RODS"
#}
#const ULTRACAP_100 = {
#	"num_val":100,
#	"system":"SYSTEM_CAPACITOR_100",
#	"manual":"SYSTEM_CAPACITOR_MANUAL",
#	"price":4000,
#	"test_protocol":"bootup",
#	"slot_type":"ULTRACAPACITOR",
#	"equipment_type":"POWER_ULTRACAPACITOR"
#}
#const ULTRACAP_700 = {
#	"num_val":700,
#	"system":"SYSTEM_CAPACITOR_700",
#	"manual":"SYSTEM_CAPACITOR_MANUAL",
#	"price":135000,
#	"test_protocol":"bootup",
#	"slot_type":"ULTRACAPACITOR",
#	"equipment_type":"POWER_ULTRACAPACITOR"
#}
#const ULTRACAP_1400 = {
#	"num_val":1400,
#	"system":"SYSTEM_CAPACITOR_1400",
#	"manual":"SYSTEM_CAPACITOR_MANUAL",
#	"price":292000,
#	"test_protocol":"bootup",
#	"slot_type":"ULTRACAPACITOR",
#	"equipment_type":"POWER_ULTRACAPACITOR"
#}
#const TURBINE_20 = {
#	"num_val":20,
#	"system":"SYSTEM_TURBINE_20",
#	"manual":"SYSTEM_TURBINE_MANUAL",
#	"price":5000,
#	"test_protocol":"bootup",
#	"slot_type":"FISSION_TURBINE",
#	"equipment_type":"POWER_FISSION_TURBINE"
#}
#const TURBINE_160 = {
#	"num_val":160,
#	"system":"SYSTEM_TURBINE_160",
#	"manual":"SYSTEM_TURBINE_MANUAL",
#	"price":95000,
#	"test_protocol":"bootup",
#	"slot_type":"FISSION_TURBINE",
#	"equipment_type":"POWER_FISSION_TURBINE"
#}
#const TURBINE_320 = {
#	"num_val":320,
#	"system":"SYSTEM_TURBINE_320",
#	"manual":"SYSTEM_TURBINE_MANUAL",
#	"price":200000,
#	"test_protocol":"bootup",
#	"slot_type":"FISSION_TURBINE",
#	"equipment_type":"POWER_FISSION_TURBINE"
#}
#const AUX_MPDG_1400 = {
#	"system":"SYSTEM_AUX_MPD_1400",
#	"manual":"SYSTEM_AUX_MPD_MANUAL",
#	"price":1150000,
#	"test_protocol":"bootup",
#	"slot_type":"AUX_POWER_SLOT",
#	"equipment_type":"POWER_AUX_POWER_SLOT"
#}
#const AUX_MPDG_2000 = {
#	"system":"SYSTEM_AUX_MPD_2000",
#	"manual":"SYSTEM_AUX_MPD_MANUAL",
#	"price":1425000,
#	"test_protocol":"bootup",
#	"slot_type":"AUX_POWER_SLOT",
#	"equipment_type":"POWER_AUX_POWER_SLOT"
#}
#const AUX_SMES_10K = {
#	"system":"SYSTEM_AUX_SMES_10K",
#	"manual":"SYSTEM_AUX_SMES_MANUAL",
#	"price":140000,
#	"test_protocol":"bootup",
#	"slot_type":"AUX_POWER_SLOT",
#	"equipment_type":"POWER_AUX_POWER_SLOT"
#}
#const CARGO_MPU_FURN = {
#	"system":"SYSTEM_CARGO_MPU_FURN",
#	"manual":"SYSTEM_CARGO_MPU_MANUAL",
#	"price":650000,
#	"test_protocol":"cargo",
#	"slot_type":"CARGO_BAY",
#	"equipment_type":"CARGO_BAY"
#}
#const CARGO_MPU_BULK = {
#	"system":"SYSTEM_CARGO_MPU_BULK",
#	"manual":"SYSTEM_CARGO_MPU_MANUAL",
#	"price":1150000,
#	"test_protocol":"cargo",
#	"slot_type":"CARGO_BAY",
#	"equipment_type":"CARGO_BAY"
#}
const HOLD_MODIFIER_BOLTS = {
	"system":"SYSTEM_CARGO_MOD_BOLTS",
	"price":2500,
	"test_protocol":"takeoff",
	"slot_type":"HOLD_MODIFIERS",
	"restriction":"HOLDMODIFIER_AMORPHIC", 
	"equipment_type":"EQUIPMENT_HOLD_MODIFIER"
}
const HOLD_MODIFIER_2K = {
	"system":"SYSTEM_CARGO_MOD_2K",
	"price":45000,
	"test_protocol":"takeoff",
	"slot_type":"HOLD_MODIFIERS",
	"equipment_type":"EQUIPMENT_HOLD_MODIFIER"
}
const HOLD_MODIFIER_AMORPH4 = {
	"system":"SYSTEM_CARGO_MOD_AMORPH4",
	"price":85000,
	"test_protocol":"takeoff",
	"slot_type":"HOLD_MODIFIERS",
	"restriction":"HOLDMODIFIER_DIVIDED",
	"equipment_type":"EQUIPMENT_HOLD_MODIFIER"
}
const HOLD_MODIFIER_4K = {
	"system":"SYSTEM_CARGO_MOD_4K",
	"price":150000,
	"test_protocol":"takeoff",
	"slot_type":"HOLD_MODIFIERS",
	"equipment_type":"EQUIPMENT_HOLD_MODIFIER"
}
const HOLD_MODIFIER_AMORPH5 = {
	"system":"SYSTEM_CARGO_MOD_AMORPH5",
	"price":275000,
	"test_protocol":"takeoff",
	"slot_type":"HOLD_MODIFIERS",
	"restriction":"HOLDMODIFIER_DIVIDED", 
	"equipment_type":"EQUIPMENT_HOLD_MODIFIER"
}
const HOLD_MODIFIER_6K = {
	"system":"SYSTEM_CARGO_MOD_6K",
	"price":350000,
	"test_protocol":"takeoff",
	"slot_type":"HOLD_MODIFIERS", 
	"equipment_type":"EQUIPMENT_HOLD_MODIFIER"
}
const HOLD_MODIFIER_AMORPH6 = {
	"system":"SYSTEM_CARGO_MOD_AMORPH6",
	"price":445000,
	"test_protocol":"takeoff",
	"slot_type":"HOLD_MODIFIERS",
	"restriction":"HOLDMODIFIER_DIVIDED", 
	"equipment_type":"EQUIPMENT_HOLD_MODIFIER"
}
const CARGO_ACCESSORY_BAFFLES = {
	"system":"SYSTEM_CARGO_BAFFLES",
	"manual":"SYSTEM_CARGO_BAFFLES_MANUAL",
	"price":5000,
	"test_protocol":"cargo",
	"slot_type":"CARGO_ACCESSORIES",
	"equipment_type":"CARGO_ACCESSORIES"
}
const CARGO_ACCESSORY_PREPROC_0X30 = {
	"system":"SYSTEM_CARGO_AUX_PREPROC_0x30",
	"manual":"SYSTEM_CARGO_AUX_PREPROC_MANUAL",
	"price":32000,
	"test_protocol":"cargo",
	"slot_type":"CARGO_ACCESSORIES",
	"equipment_type":"CARGO_ACCESSORIES"
}
const CARGO_ACCESSORY_STORAGE_4K = {
	"system":"SYSTEM_CARGO_AUX_STORAGE_4K",
	"manual":"SYSTEM_CARGO_AUX_STORAGE_MANUAL",
	"price":175000,
	"test_protocol":"cargo",
	"slot_type":"CARGO_ACCESSORIES",
	"equipment_type":"CARGO_ACCESSORIES"
}
const CARGO_ACCESSORY_PREPROC_20X10 = {
	"system":"SYSTEM_CARGO_AUX_PREPROC_20x10",
	"manual":"SYSTEM_CARGO_AUX_PREPROC_MANUAL",
	"price":225000,
	"test_protocol":"cargo",
	"slot_type":"CARGO_ACCESSORIES",
	"equipment_type":"CARGO_ACCESSORIES"
}
const CARGO_ACCESSORY_STORAGE_8K = {
	"system":"SYSTEM_CARGO_AUX_STORPROC_8K",
	"manual":"SYSTEM_CARGO_AUX_STORPROC_MANUAL",
	"price":435000,
	"test_protocol":"cargo",
	"slot_type":"CARGO_ACCESSORIES",
	"equipment_type":"CARGO_ACCESSORIES"
}
const CARGO_ACCESSORY_PREPROC_40X20 = {
	"system":"SYSTEM_CARGO_AUX_PREPROC_40x20",
	"manual":"SYSTEM_CARGO_AUX_PREPROC_MANUAL",
	"price":770000,
	"test_protocol":"cargo",
	"slot_type":"CARGO_ACCESSORIES",
	"equipment_type":"CARGO_ACCESSORIES"
}
const CARGO_ACCESSORY_FAB = {
	"system":"SYSTEM_CARGO_AUX_FAB",
	"manual":"SYSTEM_CARGO_AUX_FAB_MANUAL",
	"price":2500000,
	"test_protocol":"cargo",
	"slot_type":"CARGO_ACCESSORIES",
	"equipment_type":"CARGO_ACCESSORIES"
}
const CARGO_ACCESSORY_BIG_FAB = {
	"system":"SYSTEM_CARGO_AUX_BIGFAB",
	"manual":"SYSTEM_CARGO_AUX_FAB_MANUAL",
	"price":3650000,
	"test_protocol":"cargo",
	"slot_type":"CARGO_ACCESSORIES",
	"equipment_type":"CARGO_ACCESSORIES"
}
#const AUTOPILOT_337MOD = {
#	"system":"SYSTEM_AUTOPILOT_337MOD",
#	"price":42500,
#	"test_protocol":"autopilot",
#	"slot_type":"AUTOPILOT",
#	"equipment_type":"COMPUTER_AUTOPILOT"
#}
const CREW_MOD_BUNK = {
	"system":"SYSTEM_CREW_ADD_BUNK",
	"manual":"SYSTEM_CREW_ADD_MANUAL",
	"price":4000,
	"test_protocol":"takeoff",
	"slot_type":"CREW_MODIFIERS",
	"equipment_type":"CREW_MODIFIER"
}
const CREW_MOD_BUNK2 = {
	"system":"SYSTEM_CREW_ADD_BUNK2",
	"manual":"SYSTEM_CREW_ADD_MANUAL",
	"price":7500,
	"test_protocol":"takeoff",
	"slot_type":"CREW_MODIFIERS",
	"equipment_type":"CREW_MODIFIER"
}
const CREW_MOD_HOME = {
	"system":"SYSTEM_CREW_MOD_HOME",
	"manual":"SYSTEM_CREW_ADD_MANUAL",
	"price":35000,
	"test_protocol":"takeoff",
	"slot_type":"CREW_MODIFIERS",
	"equipment_type":"CREW_MODIFIER"
}
const CREW_MOD_CAPSULE = {
	"system":"SYSTEM_CREW_ADD_CAPSULE",
	"manual":"SYSTEM_CREW_ADD_MANUAL",
	"price":67500,
	"test_protocol":"takeoff",
	"slot_type":"CREW_MODIFIERS",
	"equipment_type":"CREW_MODIFIER"
}
const CREW_MOD_KMX = {
	"system":"SYSTEM_CREW_MOD_KMX",
	"manual":"SYSTEM_CREW_ADD_MANUAL",
	"price":120000,
	"test_protocol":"takeoff",
	"slot_type":"CREW_MODIFIERS",
	"equipment_type":"CREW_MODIFIER"
}
const CREW_MOD_OCM = {
	"system":"SYSTEM_CREW_MOD_OCM",
	"manual":"SYSTEM_CREW_ADD_MANUAL",
	"price":485000,
	"test_protocol":"takeoff",
	"slot_type":"CREW_MODIFIERS",
	"equipment_type":"CREW_MODIFIER"
}
const LARGE_TORCH_ZURBIN = {
	"system":"SYSTEM_MAIN_ENGINE_ZURBIN",
	"manual":"SYSTEM_MAIN_ENGINE_MANUAL",
	"price":1100000,
	"test_protocol":"autopilot",
	"slot_type":"LARGE_TORCH",
	"equipment_type":"THRUSTER_LARGE_MAIN_ENGINE"
}
