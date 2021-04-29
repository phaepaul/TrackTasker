puts 'Seeding database'
user = User.create(email: "olive@gmail.com", password: 'test1')
customer = Customer.create(name: "Parish")
project = Project.create(customer: customer, name: "Fix House")
task = Task.create(description: "Retile the bathroom", project: project)
Task.create(description: "Paint the master bedroom", project: project)
Task.create(description: "Install sink in kitchen", project: project)
TaskLog.create(task: task, user: user, duration_minutes: 50)
TaskLog.create(task: task, user: user, duration_minutes: 30)
puts 'Done!'