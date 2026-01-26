extends Node

const Tsukuyomi_Decom = {
	"name":"Tsukuyomi-Decom",
	"alias":"TSUKUYOMI",
	"path":"res://IndustriesOfEnceladusRewrite/ships/Tsukuyomi-Decom.tscn",
	"config":{"config": {
		"ammo":{
			"capacity":100000.0, 
			"initial":100000.0, 
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
			"initial":100000.0, 
			"capacity":100000.0, 
		}, 
		"fuel":{
			"capacity":500000.0, 
			"initial":500000.0
		}, 
		"propulsion":{
			"mainLarge":"SYSTEM_MAIN_ENGINE_ZURBIN", 
			"rcsLarge":"SYSTEM_MAIN_ENGINE_NDNTR",
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
}

const AT225_STUB = {
	"name":"AT225-STUB",
	"alias":"AT225-STUB",
	"path":"res://IndustriesOfEnceladusRewrite/ships/ATK225-Stub.tscn",
	"config":{"config": {
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
}

const ATLAS_WASP = {
	"name":"ATLAS-WASP",
	"path":"res://IndustriesOfEnceladusRewrite/ships/ATLAS-Wasp.tscn",
	"alias":"WASP",
	"config":{"config": {
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
}

const COTHON_LUX = {
	"name":"COTHON-LUX",
	"path":"res://IndustriesOfEnceladusRewrite/ships/Cothon-Lux.tscn",
	"alias":"COTHON",
	"config":{"config": {
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
}

const PIGEON_PROSPECTOR = {
	"name":"PIGEON-PROSPECTOR",
	"path":"res://IndustriesOfEnceladusRewrite/ships/Eagle-Prospector-Pigeon.tscn",
	"alias":"PROSPECTOR",
	"config":{"config":{
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
}

const MAD_CERF_CIV = {
	"name":"MAD-CERF-CIV",
	"path":"res://IndustriesOfEnceladusRewrite/ships/MAD-CERF-Civ.tscn",
	"alias":"MADCERF",
	"config":{"config": {
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
		"hud":{
			"type":"SYSTEM_HUD_CERF"
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_CHEVAL", 
			"rcs":"SYSTEM_THRUSTER_MADTX4"
		}, 
		"reactor":{	"power": 16.0},
		"turbine":{"power":200.0}, 
		"weaponSlot":{
			"middleLeft":{"type":"SYSTEM_EMD14"}, 
			"middleRight":{"type":"SYSTEM_EMD14"}, 
			"main":{"type":"SYSTEM_SALVAGE_ARM"}
		}, 
	}}
}

const MAD_CERF_CIV_INVERSE = {
	"name":"MAD-CERF-CIV-INVERSE",
	"path":"res://IndustriesOfEnceladusRewrite/ships/MAD-CERF-Civ-Inverse.tscn",
	"alias":"MADCERF",
	"config":{"config": {
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
		"hud":{
			"type":"SYSTEM_HUD_CERF"
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_CHEVAL", 
			"rcs":"SYSTEM_THRUSTER_MADTX4"
		}, 
		"reactor":{	"power": 16.0},
		"turbine":{"power":200.0}, 
		"weaponSlot":{
			"middleLeft":{"type":"SYSTEM_EMD14"}, 
			"middleRight":{"type":"SYSTEM_EMD14"}, 
			"main":{"type":"SYSTEM_SALVAGE_ARM"}
		}, 
	}}
}

const OBERON = {
	"name":"OBERON",
	"path":"res://IndustriesOfEnceladusRewrite/ships/Oberon.tscn",
	"config":{"config": {
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
}

const OCP_DD = {
	"name":"OCP209-DD",
	"path":"res://IndustriesOfEnceladusRewrite/ships/OCP-209-DD.tscn",
	"alias":"OCP209",
	"config":{"config": {
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
}

const OCP_TWIN = {
	"name":"OCP213-TWIN",
	"path":"res://IndustriesOfEnceladusRewrite/ships/OCP-213-TWIN.tscn",
	"alias":"OCP209",
	"config":{"config": {
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
}

const OCP_SNAP = {
	"name":"OCP209-SNAP",
	"path":"res://IndustriesOfEnceladusRewrite/ships/OCP-209-Snap.tscn",
	"alias":"OCP209",
	"config":{"config": {
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
}

const TRTL_OCP = {
	"name":"TRTL-OCP",
	"path":"res://IndustriesOfEnceladusRewrite/ships/RA-TRTL-OCP.tscn",
	"alias":"TRTL",
	"config":{"config": {
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
}

const TRTL_PEEPER = {
	"name":"TRTL-PEEPER",
	"path":"res://IndustriesOfEnceladusRewrite/ships/RA-TRTL-PEEPER.tscn",
	"alias":"TRTL",
	"config":{"config": {
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
}

const TRTL_RAM = {
	"name":"TRTL-RAM",
	"path":"res://IndustriesOfEnceladusRewrite/ships/RA-TRTL-Ram.tscn",
	"alias":"TRTL",
	"config":{"config": {
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
}

const CK65 = {
	"name":"CK65",
	"path":"res://IndustriesOfEnceladusRewrite/ships/CK65.tscn",
	"alias":"PROSPECTOR",
	"config":{"config": {
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
}

const CK69 = {
	"name":"CK69",
	"path":"res://IndustriesOfEnceladusRewrite/ships/CK69.tscn",
	"alias":"PROSPECTOR",
	"config":{"config": {
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
}

const YME = {
	"name":"YME",
	"path":"res://IndustriesOfEnceladusRewrite/ships/YME.tscn",
	"alias":"EIME",
	"config":{
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
}

const OCP_SALVAGE = {
	"name":"OCP-SALVAGE",
	"path":"res://IndustriesOfEnceladusRewrite/ships/ocp-209-salvage.tscn",
	"alias":"OCP209",
	"config":{
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
}
