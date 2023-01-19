local rclick_nodes = {
    "advtrains_interlocking:tcb_node",
    "advtrains_signals_ks:ra_danger_0",
    "advtrains_signals_ks:hs_danger_0",
    "advtrains:signal_wall_t_off",
    "advtrains:signal_wall_t_on",
    "advtrains:signal_wall_r_off",
    "advtrains:signal_wall_r_on",
    "advtrains:signal_wall_l_off",
    "advtrains:signal_wall_l_on",
}

for _, nodename in pairs(rclick_nodes) do
    if minetest.registered_nodes[nodename] then
        local oldclick = minetest.registered_nodes[nodename].on_rightclick

        minetest.override_item(nodename, {
            on_rightclick = function(pos, node, clicker, ...)
                if minetest.is_protected(pos, clicker:get_player_name())
                and not minetest.check_player_privs(clicker, "train_admin") then
                    minetest.chat_send_player(clicker:get_player_name(), "Insufficient privlieges to use in this area!")
                    return
                else
                    return oldclick(pos, node, clicker, ...)
                end
            end,
        })
    end
end