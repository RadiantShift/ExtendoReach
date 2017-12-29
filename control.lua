require "util"

local debug = false

script.on_init(function()
  for i,force in pairs(game.forces) do
    if force.technologies["exoskeleton-equipment"].researched == true then
      force.recipes["grabber-equipment"].enabled = true
    end
  end
end)

script.on_event(defines.events.on_player_placed_equipment, function(event)
  local player = game.players[event.player_index]
  if debug then player.print(event.equipment.name) end
  if event.equipment.name == "grabber-equipment"
    then
      player.character_reach_distance_bonus = player.character_reach_distance_bonus + 5
      player.character_build_distance_bonus = player.character_build_distance_bonus + 5
      player.character_item_drop_distance_bonus = player.character_item_drop_distance_bonus + 5
      player.character_resource_reach_distance_bonus = player.character_resource_reach_distance_bonus + 2
      if debug
        then
          player.print(player.name)
          player.print(player.character_reach_distance_bonus)
      end
  end
end)

function minusnat(n, m)
  if m >= n
    then return 0
    else return n - m
  end
end

script.on_event(defines.events.on_player_removed_equipment, function(event)
  local player = game.players[event.player_index]
  if event.equipment == "grabber-equipment"
    then
      player.character_reach_distance_bonus = minusnat(player.character_reach_distance_bonus, 4 * event.count)
      player.character_build_distance_bonus = minusnat(player.character_build_distance_bonus, 4 * event.count)
      player.character_item_drop_distance_bonus = minusnat(player.character_item_drop_distance_bonus, 4 * event.count)
      player.character_resource_reach_distance_bonus = minusnat(player.character_resource_reach_distance_bonus, 2 * event.count)
      if debug
        then
          player.print(player.name)
          player.print(event.count)
          player.print(player.character_reach_distance_bonus)
      end
  end
end)