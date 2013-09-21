require './examples/aggressive'
require './examples/defensive'

extend Aggressive
extend Defensive

def go!
  enemy = opponents.first
  return aim_at!(enemy) unless aiming_at?(enemy)
  return fire_at!(enemy, 3) if can_fire_at? enemy
  return dodge(enemy) if enemy.can_fire_at?(me)
  return hunt unless enemy

   # && my.ammo > 0
  # return rest if my.ammo == 0
  # return move_towards!(enemy) if obscured?(enemy)
  rest
end

@chooser = Proc.new do
  rand() <= 0.5 ? act_aggressively : act_defensively
end

on_turn do
  go!
end
