data:extend(
{
  {
    type = "movement-bonus-equipment",
    name = "grabber-equipment",
    sprite =
    {
      filename = "__ExtendoReach__/graphics/equipment/grabber-equipment.png",
      width = 64,
      height = 32,
      priority = "medium"
    },
    shape =
    {
      width = 3,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_consumption = "25kW",
    movement_bonus = 0.0,
    categories = { "armor" }
  },
}
)
