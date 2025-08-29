extends Node

const WEAPONSLOT_SHIP_TEMPLATES = {
	"SHIP_OCP209":{
		"leftBay1":{
			"MINING_COMPANIONS":[
				{
				"property":"position",
				"value":"Vector2( 0, 210 )"
				}
			],
			"CLAIM_BEACONS":[
				{
					"property":"position",
					"value":"Vector2( -25, 196 )"
				}
			]
		},
		"leftBay3":{
			"MINING_COMPANIONS":[
				{
				"property":"position",
				"value":"Vector2( 0, 210 )"
				}
			]
		},
		"rightBay1":{
			"MINING_COMPANIONS":[
				{
				"property":"position",
				"value":"Vector2( 0, 210 )"
				}
			],
			"CLAIM_BEACONS":[
				{
					"property":"position",
					"value":"Vector2( 25, 196 )"
				}
			]
		},
		"rightBay3":{
			"MINING_COMPANIONS":[
				{
					"property":"position",
					"value":"Vector2( 0, 210 )"
				}
			]
		},
	},
	"SHIP_OBERON":{
		"mainLeft":{
			"MANIPULATION_ARMS":[
				{
					"property":"feedVelocity",
					"value":"Vector2( -60, -280 )"
				},
				{
					"property":"flip",
					"value":"true"
				}
			]
		},
		"mainRight":{
			"MANIPULATION_ARMS":[
				{
					"property":"feedVelocity",
					"value":"Vector2( 60, -280 )"
				}
			]
		},
	}
}
