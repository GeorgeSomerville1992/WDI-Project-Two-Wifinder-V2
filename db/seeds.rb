# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


jill = User.new(name: 'Jill', email: "jill@ga.com", password: "password")
jon  = User.new(name: 'Jon', email: "jon@ga.com", password: "password")
chris = User.new(name: 'Chris', email: "chris@ga.com", password: "password")
george = User.new(name: 'George', email: "george@ga.com", password: "password")
gerry = User.new(name: 'Gerry', email: "gerry@ga.com", password: "password")
tim = User.new(name: 'Tim', email: "tim@ga.com", password: "password")

[jon, jill, chris, george, gerry, tim].each(&:skip_confirmation!).each(&:save!)

