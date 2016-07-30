# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(username: 'tom', email: 'tom@tom.com', password_hash: 'tomtom')
user.password = 'tomtom'
user.save

admin = User.new(username: 'tim', email: 'tim@tim.com', password: 'timtim', admin: true)
admin.password = 'timtim'
admin.save
