#include <amxmodx>
#include <amxmisc>
#define VERSION "1.1"
#define VIP_FLAGS "t"

public plugin_init()
{
	register_plugin("Steam VIP", VERSION, "REDLINEsS")

}

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

	client_print(id, print_chat, "You have received a free VIP for having a Steam Acount!")
}
