#include <amxmodx>
#include <amxmisc>
#tryinclude <reapi>

#pragma tabsize 4

public stock const PluginName[]         = "Steam VIP ReAPI"
public stock const PluginVersion[]      = 1.1beta
public stock const PluginAuthor[]       = "REDLINEsS"
public stock const PluginURL[]          = "https://github.com/antrelofficial/"
public stock const PluginDescription[]  = "LS"

public plugin_init() {
    register_plugin(PluginName, PluginVersion, PluginAuthor)

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
