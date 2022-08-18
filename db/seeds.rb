puts 'Cleaning database...'
Task.destroy_all

puts 'Creating tasks...'
wake_up = { name: 'Wake Up', description: 'Get Up at 8h', done: false }
breakfast = { name: 'Breakfast', description: 'Have my breakfast', done: false }
shower = { name: 'Shower', description: 'Take my shower', done: false }
code = { name: 'Code', description: 'Start my code', done: false }
lunch = { name: 'Lunch', description: 'Break for lunch', done: false }
gym = { name: 'Gym', description: 'Go to gym', done: false }
relax = { name: 'Relax', description: 'Play Dark Souls', done: false }

[wake_up, breakfast, shower, code, lunch, gym, relax].each do |attributes|
  task = Task.create!(attributes)
  puts "Created #{task.name}"
end
puts 'Finished!'
