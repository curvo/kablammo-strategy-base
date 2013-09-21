require './examples/aggressive'
require './examples/defensive'

extend Aggressive
extend Defensive

def go!
  enemy = opponents.first
  return fire_at!(enemy, line_of_site_to(enemy)) if can_fire_at?(enemy)
   # && my.ammo > 0
  # return dodge(enemy) if enemy.can_fire_at?(me)   
  # return rest if my.ammo == 0
  # return aim_at!(enemy) unless aiming_at?(enemy)
  # return move_towards!(enemy) if obscured?(enemy)
  # # return rest if my.ammo_full?
  # return hunt unless enemy            
  rest
end

@chooser = Proc.new do
  rand() <= 0.5 ? act_aggressively : act_defensively
end

on_turn do
  go!
end
