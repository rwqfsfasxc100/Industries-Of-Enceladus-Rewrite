### Hev's Message 
This is a modification of SpaceDotEXE's Industries of Enceladus mod for ΔV: Rings of Saturn that brings much requested compatability with several other content mods (this was probably the biggest request of the modding community, at least at the time of writing).
None of this is really mine, and all credit goes to SpaceDOTexe and their [original repository](https://github.com/spdx-github/IndustriesOfEnceladus).

For ease of the user, the Space's original mod README is as follows: 
# [SPDX] Industries of Enceladus

## Foreword
Industries of Enceladus is a mod for Delta-V: Rings of Saturn that focuses on ship configuration and options in a way that tries to be as inline with the established canon and world of the game as possible. Its key feature is the implementation of Cargo Bay Accessories, a separate upgrade route that offers an assortment of modules to be installed inside the cargo bay, with their own benefits and drawbacks.

It all started because I was frustrated with how fast the AR-1500 wore out, so I made another that's tougher, and then I realised how much I wanted some other stuff, and some other stuff, and some other stuff... I think it began to sink in for me after the Cothon-2200 that I was onto something good. I've been having fun and fixing bugs since the 21st of May, and hope to be for the foreseeable future. :]

### Supporting Development
[If you'd like to support the development of IoE, consider donating on Ko-fi!](https://ko-fi.com/pearshapes) I'm not able to work due to disabilities, so I don't get much every month. Any little bit helps. Thank you!

Current market share statistics across the Industries of Enceladus are:
 - WT: 33.3%
 - KST: 66.6%

Special thanks go to:
 - WT: Providing Ukrainian translations

## Features

### Changes
 - Adds four docking bays to the OCP-209 (extends to the DD and SNAP variants)
 - Reworks all ship colliders in the interest of better performance
 - Subcolliders (MPUs and cargo baffles) too
 - Extends some default functionalities on the backend like a ship-name filter on UpgradeGroups and removal of hard caps on drone tuning
 - Changes some sprites to be more aesthetically-pleasing

### Ships
 - SSE Cothon-2200-XL: expands crew space to 6, increases flight comfort, adds a set of left-right translatory thrusters and optimises the manual firing binds
 - MAD-CERF (Civilian Refit): 8 crew, lots of fun hardpoints and tons of hold space but no pod mounts, relies on onboard capacity to get things done
 - OCP-214-DD: expands the cargo bay forward, reducing mineral hold space but supports cargo bay accessories, is a bit awkward to handle as a result
 - OCP-207-SNAP: adds a unique Pacman-style jaw excavator to the 209 and has some funny sound effects, no autopilot assist
 - Tsukuyomi-class Frigate (Decommissioned): has a ton of hardpoints, torch RCS, and is very heavy. technically demilitarised but you can totally make it into a horrific murder machine
 - Pigeon Prospector: combines Pelican and Vulture with a high-stress hardpoint *alongside* two low-stress. basically the best(?) prospector on hardware alone but is the most massive
 - UMC Oberon MLP-60: entirely custom ship with textures graciously provided by Liqvo! dandy little racing vessel with utterly ridiculous performance
 - KX37 TNTRL RAM: Ringa Aftermarket Modification variant of the KX37, has a grinder and an extra pair of thrusters, plus heavy layout reconfigurations and a set of rear drone bays. heavily inspired by redditor BLKCandy and their custom KX37 mod!
 - Wasp-class Scout (Decommissioned): incredibly light scout ship with only four thrusters, basically a Kitsune but carries two low-stress hardpoints, 320MW EM shielding, and less thrusters. can handle more thermal power too, just don't ask about the reactor
 - Antonoff-Titan K225-SH: a shorter variant of the K225, docking bays reduced to 4 but it's a light and mobile mining barge with two inbuilt drone slots and a bigger excavator
 - SSE OK720 TNTRL: joke ship that puts a circular OCP bay (supports OCP cargo bay modules and custom accessories!) on a K-series frame, actually quite fun to fly and has four low-stress hardpoints
	
### Engines
 - SSE NANI Torch Refit: it's the NANI in a torch slot. have fun
 - MA-NTR600-II: twin torch, relatively expensive but incredibly efficient for its thrust class
 - RA-TNTRL-R44: quad torch, literally just the K44 RCS thrusters on a torch mount
 - RA-K69V Quad Engine: custom-made quad torch, same as above but it's the K69Vs and they fucking gimbal
 - RMS Pin-M200: super efficient and gimbal like the C50 but requires a comically impractical amount of power
 - NDDFD: Directed Fusion Detonation. highest specific impulse in the game, ridiculously powerful but extreme energy demands

### Thrusters
 - RMS Pin-C50: extremely efficient pulsed induction thruster that has incredible gimbal range and second-to-none wear statistics but has very high power demand
 - ERS-BlasTR 7200: efficient MPD thruster with great thrust, draws a lot of power
 - ND-PNTRm: micro PNTR with broadest vectoring range of all RCS thrusters, but is a NTR so its efficiency sucks shit

### Power Systems

#### Fission Rods
 - 1x SO6 Fuel Rod: kind of a joke, lowest thermal output of any other reactor in the game

#### Capacitors
 - Light Ultracapacitor: basically a single capacitor from an array
 - ND-iSMB: lighter capacitor that uses SMES tech
 - ND-iSMB Dual Coupling: even lighter capacitor that's just two smaller iSMB units braided together

#### Turbines
 - Thermocouple Array: uses reactor heat and cold propellant to produce a little power. very light, best used in conjunction with an MPDG
 - Laminar Turbine: a lighter turbine that produces more power than the base turbine
 - Dual Laminar Turbine: two of them!

#### Auxiliary Power Generators
 - OPG-14 StatPlasma: produces 1400 MW of power
 - MPI City-class MPDG: produces 2000 MW of power, MPI might have made a pact with Satan

#### Auxiliary Power Storage
 - OPS-10 Capacitor Bank: a heavy but cheap APS that stores 10 MJ and can discharge all of its power in one second
 
#### Hardpoint Equipment
 - Rusatom-Antonoff Ore Recovery Device: a hardened AR-1500 Manipulator that wears slower than the base model and is stronger
 - Runasimi KRB-500: a light manipulator meant to handle ore chunks, hard-wearing with quick-to-replace components but expensive to repair
 - THI Dyna-Cargo Container: a cargo container that has a dynamic hold at the expense of reduced overall storage
 - RA DMW Cannon: a tight-beam microwave gun with greater range and power than the MWG, but inefficient and power-hungry. comes in turreted variant that's a lot slower than the PDMWG
 - OT Hard-Stop Tug Drones: high-power tug drones, basically same stats as the Harvester-class but they tug stuff to a dead stop
 - THI Harvester-class Haul Drones: high-power haul drones that can operate over double the distance of the base version and provide double the effective force, but take significantly more power and need lots of drone components

### MPUs
 - Rusatom-Antonoff MPU Mk2: larger than most others with an increased efficiency compared to the basegame version
 - THI Bulker MPU: squeezes a massive amount of mineral hold space beneath the unit... at the expense of the processing volume, which is comically difficult to load
	
### Cargo Bay Accessories
 - Not usable with the Kitsune, KTA24, Runasimi K37, Model E, Bald Eagle, Oberon, ATLAS Wasp, OCP-207-SNAP and the base OCP-209
 - Rasamama RP-25: low-profile ore preprocessor that reduces ice content and recovers a modest amount of remass from chunks in the bay
 - Conlido Internal Storage Rack: low-profile storage module that increases mineral hold space
 - Nakamura Big MT: somewhat bulky ore preprocessor, does the same thing as the RP-25 but faster and less efficient, increases MPU mineral efficiency though
 - THI Mineral Tank Module: bulky storage module that increases mineral hold space and behaves kind of like an ore preprocessor since it's warm
 - SSE Voyager Fabricator: literally just the Voyager RSLS Fabrication Plant but without the mineral processor
 - RMS-PAL: a much better fabricator that produces at a faster rate than both the fabricator MPU and aux module combined
 - Rusatom-Antonoff MPP-N1: best MPP available on the market, ridculously powerful but very expensive

### Mineral Hold Kits
 - Both amorphic and divided holds are supported
 - Locking Bolts (amorphic): converts the hold to divided, 1:1 (perfect equivalent)
 - SSE Saddlebags: adds a little mineral hold space
 - Conlido aMorphIV (divided): converts the hold to amorphic, 6:4 (reduces total by 33%)
 - E-Prime Hold Rejoin: adds a generous amount of mineral hold space
 - THI MD-5 (divided): converts the hold to amorphic, 6:5 (reduces total by 17%)
 - Conlido freightReady Hoppers: adds a large amount of mineral hold space
 - NDSBH: converts the hold to amorphic, 1:1 (perfect equivalent)

### Habitat Kits
 - All ships supported
 - Conlido bunkX1: cheap beds! adds 2 crew to ships but makes no further accommodations which decreases crew comfort
 - Conlido mgHome Refit: increases crew comfort a bit

## Installation (Steam)

1. Open your game install directory
2. Create a new folder called "mods"
3. Place the .zip you downloaded into it (don't extract it!)
4. Right-click on your game install in Steam, select Properties...
5. Put --enable-mods in the LAUNCH OPTIONS box at the bottom of the popup, in the General tab
6. Run dV!
