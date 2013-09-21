require './examples/aggressive'
require './examples/defensive'

extend Aggressive
extend Defensive

def go!
  enemy = opponents.first
  return hunt unless enemy
  return fire_at! enemy if my.can_fire_at? enemy && my.armor > 1
  return dodge(enemy) if enemy.can_fire_at?(me) && my.armor < 2
  return aim_at!(enemy) unless aiming_at?(enemy)
  return fire_at! enemy if my.can_fire_at? enemy
  return aim_at!(enemy) unless aiming_at?(enemy)

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
