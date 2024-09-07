new UpdateSpeed[MAX_PLAYERS];

OnPlayerEnterVehicle:
ShowPlayerSpeedometer(playerid);

OnPlayerExitVehicle:
HidePlayerSpeedometer(playerid);


forward UpdateSpeedInfo(playerid);
public UpdateSpeedInfo(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	new fuel = g_vehicle[vehicleid][veh_fuel];

	if(GetVehicleData(vehicleid, veh_engine) == 0) cef_emit_event(playerid, "UpdateSpeedIcon", CEFINT(1), CEFINT(0));
	if(GetVehicleData(vehicleid, veh_engine) == 1) cef_emit_event(playerid, "UpdateSpeedIcon", CEFINT(1), CEFINT(1));

    if(GetVehicleData(vehicleid, veh_lights) == 0) cef_emit_event(playerid, "UpdateSpeedIcon", CEFINT(2), CEFINT(0));
	if(GetVehicleData(vehicleid, veh_lights) == 1) cef_emit_event(playerid, "UpdateSpeedIcon", CEFINT(2), CEFINT(1));

	if(GetVehicleData(vehicleid, veh_locked) == 0) cef_emit_event(playerid, "UpdateSpeedIcon", CEFINT(3), CEFINT(0));
	if(GetVehicleData(vehicleid, veh_locked) == 1) cef_emit_event(playerid, "UpdateSpeedIcon", CEFINT(3), CEFINT(1));

	cef_emit_event(playerid, "UpdateSpeedFuel", CEFINT(fuel));
}


stock ShowPlayerSpeedometer(playerid) {
	cef_emit_event(playerid, "ShowPlayerSpeed");
	UpdateSpeed[playerid] = SetTimerEx("UpdateSpeedInfo", 100, true, "d", playerid);
	return 1;
}

stock HidePlayerSpeedometer(playerid) {
	cef_emit_event(playerid, "HidePlayerSpeed");
    KillTimer(UpdateSpeed[playerid]);
    return 1;
}