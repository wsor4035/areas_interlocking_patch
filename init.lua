local oldclick = minetest.registered_nodes["advtrains_interlocking:tcb_node"].on_rightclick

minetest.override_item("advtrains_interlocking:tcb_node", {
    on_rightclick = function(pos, node, clicker, ...)
        if minetest.is_protected(pos, clicker:get_player_name()) then
            minetest.chat_send_player(clicker:get_player_name(), "Insufficient privlieges to use in this area!")
            return
        else
            return oldclick(pos, node, clicker, ...)
        end
    end,
})