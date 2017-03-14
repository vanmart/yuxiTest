# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create([{ name: 'Admin' }, { name: 'ParkingAttendant' }, { name: 'MasterAdmin' }, { name: 'RegularUser' }])



#Creating Parkings
parking = Parking.create({ name: 'la40' , address: 'cra 40', email: 'la40@mail.com', phone: '3134904040', message: 'Bienvenidos atendemos de Lunes a Viernes 6 am - 9pm' })


admin = User.create({
              email: 'admin@mail.com',
              name: 'ROGER LIO',
              password: '1234321',
              roles: [Role.find_by_name('Admin')],
              parking_id: parking.id})

attendant = User.create({
              email: 'attendant@mail.com',
              name: 'MAX IMILIAN',
              password: '1234321',
              roles: [Role.find_by_name('ParkingAttendant')],
              parking_id: parking.id})

masterAdmin = User.create({
              email: 'vanmartc@mail.com',
              name: 'Van',
              password: '1234321',
              roles: [Role.find_by_name('MasterAdmin')],
              parking_id: parking.id})

#Creating seconds proportion
hour = FeeTime.create({ name: 'hour' , seconds: '3600'})
day = FeeTime.create({ name: 'day' , seconds: '86400'})
week = FeeTime.create({ name: 'week' , seconds: '604800'})
biweek = FeeTime.create({ name: 'biweek' , seconds: '9072000'})
month = FeeTime.create({ name: 'month' , seconds: '18144000'})

#Creating Vehicle types
VehicleType.create([{name: 'Motorbike'},
                                   {name: 'Car'},
                                   {name: 'Tax'},
                                   {name: 'Bus'},
                                   {name: 'Truck'},
                                   {name: 'Big Truck'},
                                   {name: 'Heavy machinery'}])

FeeType.create([{name: 'Hour or fraction Motorbike',price: '5',vehicle_type_id:'1', parking_id: parking.id, fee_time_id: hour.id},
                            {name: 'Hour or fraction Car',price: '10',vehicle_type_id:'2', parking_id: parking.id, fee_time_id: hour.id},

                            #day
                            {name: 'day Motorbike',price: '15',vehicle_type_id:'1', parking_id: parking.id, fee_time_id: day.id},
                            {name: 'day Car',price: '22',vehicle_type_id:'2', parking_id: parking.id, fee_time_id: day.id},
                            #Weekly
                            {name: 'Week Motorbike',price: '15',vehicle_type_id:'1', parking_id: parking.id, fee_time_id: week.id},
                            {name: 'Week Car',price: '22',vehicle_type_id:'2', parking_id: parking.id, fee_time_id: week.id},

                            #biweek
                            {name: 'biweek Motorbike',price: '30',vehicle_type_id:'1', parking_id: parking.id, fee_time_id: biweek.id},
                            {name: 'biweek Car',price: '45',vehicle_type_id:'2', parking_id: parking.id, fee_time_id: biweek.id},

                            #monthly
                            {name: 'Month Motorbike',price: '50',vehicle_type_id:'1', parking_id: parking.id, fee_time_id: month.id},
                            {name: 'Month Car',price: '70',vehicle_type_id:'2', parking_id: parking.id, fee_time_id: month.id}])

#TODO: seed the vehicle, vihicle_owner


Place.create({name: '1', state: 'free', vehicle_type_id: '1', parking_id: parking.id})
Place.create({name: '2', state: 'free', vehicle_type_id: '1', parking_id: parking.id})
Place.create({name: '3', state: 'free', vehicle_type_id: '1', parking_id: parking.id})
Place.create({name: '4', state: 'free', vehicle_type_id: '1', parking_id: parking.id})
Place.create({name: '5', state: 'free', vehicle_type_id: '1', parking_id: parking.id})

Place.create({name: 'c1', state: 'free', vehicle_type_id: '2', parking_id: parking.id})
Place.create({name: 'c2', state: 'free', vehicle_type_id: '2', parking_id: parking.id})
Place.create({name: 'c3', state: 'free', vehicle_type_id: '2', parking_id: parking.id})
Place.create({name: 'c4', state: 'free', vehicle_type_id: '2', parking_id: parking.id})
Place.create({name: 'c5', state: 'free', vehicle_type_id: '2', parking_id: parking.id})
