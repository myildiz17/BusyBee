# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Neighbor.destroy_all
WorkerBee.destroy_all
Job.destroy_all
Dog.destroy_all
Child.destroy_all
Skill.destroy_all

25.times do
    Neighbor.create ({
        name: Faker::Name.name, 
        address: Faker::Address.full_address,
    })
end

50.times do
    WorkerBee.create ({
        name: Faker::Name.name, 
        age: rand(15..60),
        skill_set: ['Dog Walker', 'Babysitter', 'Landscaper'].sample,
        availability: ['true', 'false'].sample,
        rate: Faker::Number.decimal(l_digits: 2)
    })
end

30.times do
    Job.create ({
        neighbor_id: Neighbor.all.sample.id,
        worker_bee_id: WorkerBee.all.sample.id,
        category: ['Dog Walker', 'Babysitter', 'Landscaper'].sample,
        total_time: rand(1..10),
        date: Faker::Date.between(from: '2020-11-01', to: '2020-11-30'),
        time: rand(0..23)
    })
end

20.times do
    Dog.create ({
        neighbor_id: Neighbor.all.sample.id,
        name: Faker::Creature::Dog.name, 
        breed: Faker::Creature::Dog.breed,
        age: Faker::Creature::Dog.age
    })
end

20.times do
    Child.create ({
        neighbor_id: Neighbor.all.sample.id,
        name: Faker::Name.name, 
        age: rand(0..15)
    })
end

40.times do
    Skill.create ({
        worker_bee_id: WorkerBee.all.sample.id,
        name: ['Dog Walker', 'Babysitter', 'Landscaper'].sample
    })
end

