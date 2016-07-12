require_relative './lib/thermometer.rb'
t = Thermometer.new
puts 'Please enter current temperature'
t.current_temperature = gets.to_i
puts 'Please enter desired temperatuje'
t.desired_temperature = gets.to_i
t.adjust_temperature
puts 'Fans\'s state is being set to:'
puts t.fans_state
puts 'Climate conditions will be queried again in 30 minutes'
