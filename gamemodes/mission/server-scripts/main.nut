local function join_handler(pid) {
    sendMessageToAll(0, 255, 0, getPlayerName(pid) + " connected with the server.")

	ClassArcher(pid)
	spawnPlayer(pid)
	setPlayerPosition(pid, 0, 0, 0)
}

addEventHandler("onPlayerJoin", join_handler)

local function respawn_handler(pid) {
    if (isNpc(pid)) {
        return
    }

    sendMessageToAll(255, 150, 0, getPlayerName(pid) + " has respawned.")

	ClassArcher(pid)
	spawnPlayer(pid)
}

addEventHandler("onPlayerRespawn", respawn_handler)

function onPlayerCommand(pid, cmd, params) {
	if (cmd == "test") {
		local npc_id = SpawnVasilij()

		AI_TurnToPlayer(npc_id, pid)
		playAni(npc_id, "S_RUNL")
		pushNpcAction(npc_id, NPCStopAtTargetAction(pid))
		npcUseClosestMob(npc_id, "BENCH", 1)
	}
}

addEventHandler("onPlayerCommand", onPlayerCommand)

class NPCStopAtTargetAction extends NpcAction {
	target_id = -1

	constructor(target_id = 0) {
		this.target_id = target_id
	}

	function onFinished(npc_id, result) {
		print("FINISHED " + result)
	}

	function onSerialize(packet) {
		packet.writeInt16(this.target_id)
	}
}

local function init_handler() {
	randomseed(getTickCount())

	//AI_SpawnNPC(AIYoungWolf.Create(), 200, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
	//AI_SpawnNPC(AIYoungWolf.Create(), 300, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
	//AI_SpawnNPC(AIYoungWolf.Create(), 400, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
	//AI_SpawnNPC(AIHumanBanditRanged.Create("BDT_10307_ADDON_RANGERBANDIT_M"), 200, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
    //AI_SpawnNPC(AIHumanBanditMelee.Create("BDT_10309_ADDON_RANGERBANDIT_L"), 300, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
    //AI_SpawnNPC(AIHumanBanditMelee.Create("BDT_10308_ADDON_RANGERBANDIT_L"), 400, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
    //AI_SpawnNPC(AIHumanBanditRanged.Create("BDT_10311_ADDON_RANGERBANDIT_M"), 500, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
    //AI_SpawnNPC(AIHumanBanditRanged.Create("BDT_10310_ADDON_RANGERBANDIT_M"), 600, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
    //AI_SpawnNPC(AIHumanBanditMelee.Create("BDT_10313_ADDON_RANGERBANDIT_L"), 700, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
    //AI_SpawnNPC(AIHumanBanditMelee.Create("BDT_10312_ADDON_RANGERBANDIT_L"), 800, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
    //AI_SpawnNPC(AIHumanBanditRanged.Create("BDT_10314_ADDON_RANGERBANDIT_M"), 900, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
	//AI_SpawnNPC(AIHumanBanditMelee.Create("BDT_1022_LEUCHTTURMBANDIT"),  200, 200, -1500, 0.00, "NEWWORLD\\NEWWORLD.ZEN")
}

addEventHandler("onInit", init_handler)