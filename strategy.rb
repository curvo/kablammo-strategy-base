require './examples/aggressive'
require './examples/defensive'

extend Aggressive
extend Defensive

def go!
  enemy = opponents.first
  return hunt unless enemy
  return rest if (my.ammo == 0 && !enemy.can_fire_at?(me))
  return fire_at!(enemy, 10) if obscured?(enemy)
  return fire_at!(enemy) if can_fire_at?(enemy)
  return fire_at!(enemy) if (can_fire_at?(enemy) && !enemy.can_fire_at?(me))
  return dodge(enemy) if (enemy.can_fire_at?(me) && my.armor == 1 && can_fire_at?(enemy))
  return fire_at! enemy if can_fire_at?(enemy)
  return aim_at!(enemy) unless aiming_at?(enemy)
  rest
end

@chooser = Proc.new do
  rand() <= 0.5 ? act_aggressively : act_defensively
end

on_turn do
  go!
end
