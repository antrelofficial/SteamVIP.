#include <amxmodx>
#include <amxmisc>
#include <reapi>

new const PLUGIN_VERSION[] = "1.1.3";

#pragma semicolon 1

#define VIP_FLAGS "d"

public plugin_init() {
    register_plugin("SteamVIP", PLUGIN_VERSION, "REDLINEsS");


public client_authorized(id)
{
	if (!is_user_admin(id) && is_user_steam(id))
	{
		set_task(10.0, "Delayed_AddSteamFreeFlags", id)
	}
}

public Delayed_AddSteamFreeFlags(id)
{
	if (!is_user_connected(id))
		return

	remove_user_flags(id, read_flags("z"))
	set_user_flags(id, read_flags(VIP_FLAGS))

	client_print(id, print_chat, "Вы получили бесплатный VIP за наличие аккаунта Steam!")
}
