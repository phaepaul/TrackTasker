# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create()
customer = Customer.create(name: "Parish")
project = Project.create(customer: customer, name: "Fix House")
task = Task.create(description: "Retile the bathroom", project: project)
Task.create(description: "Paint the master bedroom", project: project)
Task.create(description: "Install sink in kitchen", project: project)
TaskLog.create(task: task, user: user, duration_minutes: 50)
TaskLog.create(task: task, user: user, duration_minutes: 30)
