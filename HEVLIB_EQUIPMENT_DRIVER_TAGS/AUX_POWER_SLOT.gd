extends Node

const OPS = {
	"slots":["aux.power"],
	"type":"SMES",
	"system":"SYSTEM_AUX_SMES_10K",
	"price":140000,
	"repair_time":1,
	"fix_price":24000,
	"fix_time":4,
	"capacitor_ratio":0.9,
	"command":"",
	"power_draw":50000,
	"power_supply":10000000,
	"capacity":10000000,
	"switch_time":0.1,
	"mass":6500
}

const MPI = {
	"slots":["aux.power"],
	"type":"MPDG",
	"system":"SYSTEM_AUX_MPD_2000",
	"price":1425000,
	"repair_time":1,
	"fix_price":5000,
	"fix_time":4,
	"command":"",
	"power_draw":300000,
	"thermal":500000,
	"power_supply":2000000,
	"windup_time":15,
	"mass":16660
}
