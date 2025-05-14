extends "res://ships/Shipyard.gd"

var ammoValueNew = {
		200: 500,
	}
var rodsValueNew = {
		1.0: 20000,
	}
var rodsMassNew = {
		1.0: 400,
	}
var capacitorValueNew = {
		100.0: 4000,
		700.0: 135000,
		1400.0: 292000,
	}
var capacitorMassNew = {
		100.0: 400,
		700.0: 1800,
		1400.0: 3200,
	}
var turbineValueNew = {
		20.0: 2500,
		160.0: 95000,
		320.0: 200000,
	}
var turbineMassNew = {
		20.0: 100,
		160.0: 600,
		320.0: 1200,
	}



func _ready():
	ammoValue.merge(ammoValueNew)
	rodsValue.merge(rodsValueNew)
	rodsMass.merge(rodsMassNew)
	capacitorMass.merge(capacitorMassNew)
	capacitorValue.merge(capacitorValueNew)
	turbineValue.merge(turbineValueNew)
	turbineMass.merge(turbineMassNew)
	
	
	ships["Tsukuyomi-Decom"] = preload("res://IndustriesOfEnceladusRevamp/ships/Tsukuyomi-Decom.tscn")
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
	ships["AT225-STUB"] = preload("res://IndustriesOfEnceladusRevamp/ships/ATK225-Stub.tscn")
	configAlias["AT225-STUB"] = "AT225-STUB"
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
	ships["ATLAS-WASP"] = preload("res://IndustriesOfEnceladusRevamp/ships/ATLAS-Wasp.tscn")
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
	ships["COTHON-LUX"] = preload("res://IndustriesOfEnceladusRevamp/ships/Cothon-Lux.tscn")
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
	ships["PIGEON-PROSPECTOR"] = preload("res://IndustriesOfEnceladusRevamp/ships/Eagle-Prospector-Pigeon.tscn")
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
	ships["MAD-CERF-CIV"] = preload("res://IndustriesOfEnceladusRevamp/ships/MAD-CERF-Civ.tscn")
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
	ships["OBERON"] = preload("res://IndustriesOfEnceladusRevamp/ships/Oberon.tscn")
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
	ships["OCP209-DD"] = preload("res://IndustriesOfEnceladusRevamp/ships/OCP-209-DD.tscn")
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
	ships["OCP209-SNAP"] = preload("res://IndustriesOfEnceladusRevamp/ships/OCP-209-Snap.tscn")
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
	ships["TRTL-OCP"] = preload("res://IndustriesOfEnceladusRevamp/ships/RA-TRTL-OCP.tscn")
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
	ships["TRTL-RAM"] = preload("res://IndustriesOfEnceladusRevamp/ships/RA-TRTL-Ram.tscn")
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

	ships["CK65"] = preload("res://IndustriesOfEnceladusRevamp/ships/CK65.tscn")
	configAlias["CK65"] = "PROSPECTOR"
	defaultShipConfig["CK65"] = {"config": {
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

	
	ships["CK69"] = preload("res://IndustriesOfEnceladusRevamp/ships/CK69.tscn")
	configAlias["CK69"] = "PROSPECTOR"
	defaultShipConfig["CK69"] = {"config": {
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

	
	var YME:String = "YME"
	ships[YME] = preload("res://IndustriesOfEnceladusRevamp/ships/YME.tscn")
	configAlias[YME] = "EIME"
	defaultShipConfig[YME] = {
		"config":{
			"fuel":{
				"capacity":30000.0, 
				"initial":30000.0, 
			}, 
			"propulsion":{
				"main":"SYSTEM_MAIN_ENGINE_EIZAP", 
				"rcs":"SYSTEM_THRUSTER_AGILE"
			}, 
			"weaponSlot":{
				"main":{
					"type":"SYSTEM_NONE"
				}, 
				"left":{
					"type":"SYSTEM_NONE"
				}, 
				"right":{
					"type":"SYSTEM_NONE"
				}, 
			}, 
			"ammo":{
				"capacity":0.0, 
				"initial":0.0
			}, 
			"autopilot":{
				"type":"SYSTEM_AUTOPILOT_MK4"
			}, 
			"capacitor":{
				"capacity":1000.0
			}, 
			"turbine":{
				"power":500.0
			},
			"reactor":{
				"power": 30.0
			},
		}
	}
	
	
	var salvageOCP:String = "OCP-SALVAGE"
	ships[salvageOCP] = preload("res://IndustriesOfEnceladusRevamp/ships/ocp-209-salvage.tscn")
	configAlias[salvageOCP] = "OCP209"
	defaultShipConfig[salvageOCP] = {
		"config":{
			"hud":{
				"type":"SYSTEM_HUD_OCP209"
			}, 
			"aux":{
				"power":"SYSTEM_AUX_SMES"
				}, 
			"weaponSlot":{
				"mainLeft":{
					"type":"SYSTEM_SALVAGE_ARM"
				}, 
				"mainRight":{
					"type":"SYSTEM_SALVAGE_ARM"
				}, 
			}, 
			"reactor":{
				"power":16.0
			}, 
			"ammo":{
				"capacity":0.0, 
				"initial":0.0, 
			}, 
			"fuel":{
				"capacity":80000.0, 
				"initial":80000.0, 
			}, 
			"capacitor":{
				"capacity":1000.0, 
			}, 
			"turbine":{
				"power":200.0, 
			}, 
			"shielding":{
				"emp":0, 
			}, 
			"autopilot":{
				"type":"SYSTEM_AUTOPILOT_MK2"
			}, 
			"propulsion":{
				"main":"SYSTEM_MAIN_ENGINE_DFMPD2205", 
				"rcs":"SYSTEM_THRUSTER_GHET"
			}, 
		}
	}
