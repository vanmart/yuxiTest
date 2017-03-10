# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create([{ name: 'Admin' }, { name: 'ParkingAttendant' }])

User.create([{
              email: 'admin@mail.com',
              name: 'ROGER LIO',
              password: '1234321',
              roles: [Role.find_by_name('Admin')]},
              {
              email: 'attendant@mail.com',
              name: 'MAX IMILIAN',
              password: '1234321',
              roles: [Role.find_by_name('ParkingAttendant')]}
              ]);