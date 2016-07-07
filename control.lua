require "util"

local debug = false

script.on_event(defines.events.on_player_placed_equipment, function(event)
  local player = game.players[event.player_index]
  if debug then player.print(event.equipment.name) end
  if event.equipment.name == "grabber-equipment"
    then
      player.character_reach_distance_bonus = player.character_reach_distance_bonus + 4
      player.character_build_distance_bonus = player.character_build_distance_bonus + 4
      if debug
        then
          player.print(player.name)
          player.print(player.character_reach_distance_bonus)
          player.print(player.character_build_distance_bonus)
      end
  end
end)

script.on_event(defines.events.on_player_removed_equipment, function(event)
  local player = game.players[event.player_index]
  if event.equipment == "grabber-equipment"
    then
      if player.character_reach_distance_bonus >= 4 * event.count
        then
          player.character_reach_distance_bonus = player.character_reach_distance_bonus - 4 * event.count
          player.character_build_distance_bonus = player.character_build_distance_bonus - 4 * event.count
        else
          player.character_reach_distance_bonus = 0
          player.character_build_distance_bonus = 0
      end
      if debug
        then
          player.print(player.name)
          player.print(event.count)
          player.print(player.character_reach_distance_bonus)
          player.print(player.character_build_distance_bonus)
      end
  end
end)