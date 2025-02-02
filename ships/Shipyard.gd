extends "res://ships/Shipyard.gd"


func _ready():
	ships["Tsukuyomi-Decom"] = load("res://IndustriesOfEnceladusRevamp/ships/Tsukuyomi-Decom.tscn")
	configAlias["Tsukuyomi-Decom"] = "TSUKUYOMI"
	defaultShipConfig["Tsukuyomi-Decom"] = {"config": {
		"ammo":{
			"capacity":50000.0, 
			"initial":5000.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK3"
		}, 
		"capacitor":{
				"capacity":1500.0,
				"initial":1500.0
		}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_MPU",
			"aux":"SYSTEM_NONE",
			"modifierDivided":"SYSTEM_CARGO_MOD_2K"
		},
		"drones":{
			"initial":0.0, 
			"capacity":50000.0, 
		}, 
		"fuel":{
			"capacity":500000.0, 
			"initial":500000.0
		}, 
		"propulsion":{
			"mainLarge":"SYSTEM_MAIN_ENGINE_ZURBIN", 
			"rcsLarge":"SYSTEM_MAIN_ENGINE_NDNTR"
		}, 
		"reactor":{"power":20.0}, 
		"shielding":{"emp":0.0}, 
		"turbine":{
			"capacity":500.0, 
			"power":500.0
		}, 
		"weaponSlot":{
			"left":{"type":"SYSTEM_NONE"}, 
			"right":{"type":"SYSTEM_NONE"}, 
			"middleLeft":{"type":"SYSTEM_NONE"}, 
			"middleRight":{"type":"SYSTEM_NONE"}, 
			"turretFrontLeft":{"type":"SYSTEM_NONE"}, 
			"turretFrontRight":{"type":"SYSTEM_NONE"},
			"leftBay2":{"type":"SYSTEM_NONE"}, 
			"rightBay2":{"type":"SYSTEM_NONE"},
			"leftBay3":{"type":"SYSTEM_NONE"}, 
			"rightBay3":{"type":"SYSTEM_NONE"},
		},
	}}
	ships["AT225-STUB"] = load("res://IndustriesOfEnceladusRevamp/ships/ATK225-Stub.tscn")
	configAlias["AT225-STUB"] = "AT225"
	defaultShipConfig["AT225-STUB"] = {"config": {
		"ammo": {
			"capacity": 1000.0,
			"initial": 1000.0
		},
		"autopilot": {"type":"SYSTEM_AUTOPILOT_MK2"},
		"capacitor":{"capacity":500.0}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_MPUFSO"
		}, 
		"fuel": {
			"capacity": 80000.0,
			"initial": 80000.0
		},
		"hud":{"type":"SYSTEM_HUD_AT225"}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_BWMT535", 
			"rcs":"SYSTEM_THRUSTER_K37"
		}, 
		"reactor":{"power":16.0},
		"turbine":{"power":500.0},
		"weaponSlot":{
			"middleLeft":{"type":"SYSTEM_NONE"}, 
			"middleRight":{"type":"SYSTEM_EMD14"}, 
			"leftDrone":{"type":"SYSTEM_NONE"},
			"rightDrone":{"type":"SYSTEM_NONE"},
			"leftBay1":{"type":"SYSTEM_EXSTORAGE-L"}, 
			"leftBay3":{"type":"SYSTEM_EXSTORAGE-L"}, 
			"rightBay1":{"type":"SYSTEM_EXSTORAGE-R"}, 
			"rightBay3":{"type":"SYSTEM_EXSTORAGE-R"}, 
		}, 
	}}
	ships["ATLAS-WASP"] = load("res://IndustriesOfEnceladusRevamp/ships/ATLAS-Wasp.tscn")
	configAlias["ATLAS-WASP"] = "WASP"
	defaultShipConfig["ATLAS-WASP"] = {"config": {
		"ammo":{
			"capacity": 1000.0,
			"initial": 1000.0
		},
		"autopilot":{"type":"SYSTEM_AUTOPILOT_MK2"}, 
		"capacitor":{"capacity": 1500.0}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_STANDARD",
		},
		"fuel":{
			"capacity": 15000.0, 
			"initial": 15000.0, 
		}, 
		"propulsion":{
			"rcs":"SYSTEM_THRUSTER_GHET"
		}, 
		"reactor":{"power": 4.0},
		"shielding":{"emp": 320},  
		"turbine":{"power": 500.0},
		"weaponSlot":{
			"middleLeft":{"type":"SYSTEM_RAILTOR"}, 
			"middleRight":{"type":"SYSTEM_RAILTOR"}
		}, 
	}}
	ships["COTHON-LUX"] = load("res://IndustriesOfEnceladusRevamp/ships/Cothon-Lux.tscn")
	configAlias["COTHON-LUX"] = "COTHON"
	defaultShipConfig["COTHON-LUX"] = {"config": {
		"ammo":{
			"capacity": 1000.0, 
			"initial": 1000.0, 
		}, 
		"autopilot":{"type":"SYSTEM_AUTOPILOT_MK2"}, 
		"capacitor":{"capacity": 500.0}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_STANDARD",
			"modifierDivided":"SYSTEM_CARGO_MOD_2K"
		},
		"fuel":{
			"capacity": 80000.0, 
			"initial": 80000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_PNTR", 
			"rcs":"SYSTEM_THRUSTER_NDSTR"
		}, 
		"reactor":{	"power": 8.0},
		"shielding":{"emp": 100},  
		"turbine":{"power": 200.0}, 
		"weaponSlot":{
			"right":{"type":"SYSTEM_EMD14"}, 
			"left":{"type":"SYSTEM_NONE"}
		}, 
	}}
	ships["PIGEON-PROSPECTOR"] = load("res://IndustriesOfEnceladusRevamp/ships/Eagle-Prospector-Pigeon.tscn")
	configAlias["PIGEON-PROSPECTOR"] = "PROSPECTOR"
	defaultShipConfig["PIGEON-PROSPECTOR"] = {"config":{
		"ammo":{
			"capacity": 1000.0, 
			"initial": 1000.0, 
		}, 
		"autopilot":{"type":"SYSTEM_AUTOPILOT_MK2"}, 
		"fuel":{
			"capacity": 50000.0, 
			"initial": 50000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_K37", 
			"rcs":"SYSTEM_THRUSTER_K37"
		}, 
		"reactor":{	"power": 16.0},
		"turbine":{"power": 200.0}, 
		"weaponSlot":{
			"main": {"type":"SYSTEM_NONE"},
			"right":{"type":"SYSTEM_EMD14"}, 
			"left":{"type":"SYSTEM_EMD14"}
		}, 
	}}
	ships["MAD-CERF-CIV"] = load("res://IndustriesOfEnceladusRevamp/ships/MAD-CERF-Civ.tscn")
	configAlias["MAD-CERF-CIV"] = "MADCERF"
	defaultShipConfig["MAD-CERF-CIV"] = {"config": {
		"ammo":{
			"capacity":1000.0, 
			"initial":1000.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK1"
		},
		"cargo":{
			"equipment":"SYSTEM_CARGO_STANDARD",
			"modifierDivided":"SYSTEM_NONE",
		},
		"capacitor":{"capacity":1000.0}, 
		"fuel":{
			"capacity":80000.0, 
			"initial":80000.0, 
		}, 
		"reactor":{	"power": 16.0},
		"turbine":{"power":200.0}, 
		"weaponSlot":{
			"middleLeft":{"type":"SYSTEM_EMD14"}, 
			"middleRight":{"type":"SYSTEM_EMD14"}, 
			"main":{"type":"SYSTEM_SALVAGE_ARM"}
		}, 
	}}
	ships["OBERON"] = load("res://IndustriesOfEnceladusRevamp/ships/Oberon.tscn")
	configAlias["OBERON"] = "OBERON"
	defaultShipConfig["OBERON"] = {"config": {
		"ammo":{
			"capacity":0.0, 
			"initial":0.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK2"
		},  
		"capacitor":{
				"capacity":1500.0
		}, 
		"cargo":{
			"equipment":"SYSTEM_NONE",
			"modifierAmorphic":"SYSTEM_NONE"
		},
		"drones":{
			"initial":0.0, 
			"capacity":0.0, 
		}, 
		"fuel":{
			"capacity": 15000.0, 
			"initial": 15000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_K44", 
			"rcs":"SYSTEM_THRUSTER_K69V"
		}, 
		"reactor":{	"power": 30.0},
		"turbine":{
			"capacity":320.0, 
			"power":320.0
		}, 
		"weaponSlot": {
			"mainLeft":{"type":"SYSTEM_SALVAGE_ARM"},
			"mainRight":{"type":"SYSTEM_SALVAGE_ARM"},
		},
	}}
	ships["OCP209-DD"] = load("res://IndustriesOfEnceladusRevamp/ships/OCP-209-DD.tscn")
	configAlias["OCP209-DD"] = "OCP209"
	defaultShipConfig["OCP209-DD"] = {"config": {
		"ammo":{
			"capacity":0.0, 
			"initial":0.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK1"
		},  
		"capacitor":{
				"capacity":1000.0
		}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_MPU",
			"aux":"SYSTEM_NONE",
			"modifierAmorphic":"SYSTEM_CARGO_MOD_2K"
		},
		"drones":{
			"initial":0.0, 
			"capacity":0.0, 
		}, 
		"fuel":{
			"capacity": 80000.0, 
			"initial": 80000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_K44", 
			"rcs":"SYSTEM_THRUSTER_MA150HO"
		}, 
		"reactor":{	"power": 16.0},
		"turbine":{
			"capacity":200.0, 
			"power":200.0
		}, 
		"weaponSlot": {
			"mainLeft":{"type":"SYSTEM_SALVAGE_ARM"},
			"mainRight":{"type":"SYSTEM_SALVAGE_ARM"},
			"middleLeft":{"type":"SYSTEM_PDMWG"},
			"middleRight":{"type":"SYSTEM_PDMWG"},
			"leftBay1":{"type":"SYSTEM_NONE"}, 
			"rightBay1":{"type":"SYSTEM_NONE"},
			"leftBayRev1":{"type":"SYSTEM_NONE"}, 
			"rightBayRev1":{"type":"SYSTEM_NONE"},
		},
	}}
	ships["OCP209-SNAP"] = load("res://IndustriesOfEnceladusRevamp/ships/OCP-209-Snap.tscn")
	configAlias["OCP209-SNAP"] = "OCP209"
	defaultShipConfig["OCP209-SNAP"] = {"config": {
		"ammo":{
			"capacity":0.0, 
			"initial":0.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK1"
		},  
		"capacitor":{
				"capacity":1000.0
		}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_MPU",
			"modifierAmorphic":"SYSTEM_CARGO_MOD_2K"
		},
		"drones":{
			"initial":0.0, 
			"capacity":0.0, 
		}, 
		"fuel":{
			"capacity": 80000.0, 
			"initial": 80000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_K44", 
			"rcs":"SYSTEM_THRUSTER_MA150HO"
		}, 
		"reactor":{	"power": 16.0},
		"turbine":{
			"capacity":200.0, 
			"power":200.0
		}, 
		"weaponSlot": {
			"mainLeft":{"type":"SYSTEM_SALVAGE_ARM"},
			"mainRight":{"type":"SYSTEM_SALVAGE_ARM"},
			"middleLeft":{"type":"SYSTEM_PDMWG"},
			"middleRight":{"type":"SYSTEM_PDMWG"},
			"leftBay1":{"type":"SYSTEM_NONE"}, 
			"rightBay1":{"type":"SYSTEM_NONE"},
			"leftBayRev1":{"type":"SYSTEM_NONE"}, 
			"rightBayRev1":{"type":"SYSTEM_NONE"},
		},
	}}
	ships["TRTL-OCP"] = load("res://IndustriesOfEnceladusRevamp/ships/RA-TRTL-OCP.tscn")
	configAlias["TRTL-OCP"] = "TRTL"
	defaultShipConfig["TRTL-OCP"] = {"config": {
		"ammo":{
			"capacity": 1000.0, 
			"initial": 1000.0, 
		}, 
		"autopilot":{"type":"SYSTEM_AUTOPILOT_MK1"}, 
		"capacitor":{"capacity": 500.0}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_STANDARD",
			"modifierDivided":"SYSTEM_CARGO_MOD_2K"
		},
		"fuel":{
			"capacity": 30000.0, 
			"initial": 30000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_K37", 
			"rcs":"SYSTEM_THRUSTER_K37"
		}, 
		"reactor":{	"power": 8.0},
		"turbine":{"power": 100.0}, 
		"weaponSlot":{
			"left": {"type":"SYSTEM_EMD14"},
			"right": {"type":"SYSTEM_EMD14"},
			"leftBack": {"type":"SYSTEM_NONE"},
			"rightBack": {"type":"SYSTEM_NONE"},
		}, 
	}}
	ships["TRTL-RAM"] = load("res://IndustriesOfEnceladusRevamp/ships/RA-TRTL-Ram.tscn")
	configAlias["TRTL-RAM"] = "TRTL"
	defaultShipConfig["TRTL-RAM"] = {"config": {
		"ammo":{
			"capacity": 1000.0, 
			"initial": 1000.0, 
		}, 
		"autopilot":{"type":"SYSTEM_AUTOPILOT_MK2"}, 
		"capacitor":{"capacity": 500.0}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_STANDARD",
			"modifierDivided":"SYSTEM_CARGO_MOD_2K"
		},
		"fuel":{
			"capacity": 30000.0, 
			"initial": 30000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_PNTR", 
			"rcs":"SYSTEM_THRUSTER_NDSTR"
		}, 
		"reactor":{	"power": 8.0},
		"shielding":{"emp": 100},  
		"turbine":{"power": 200.0}, 
		"weaponSlot":{
			"main": {"type":"SYSTEM_NONE"},
			"right":{"type":"SYSTEM_EMD14"}, 
			"left":{"type":"SYSTEM_EMD14"}
		}, 
	}}
