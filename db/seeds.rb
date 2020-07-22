# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Fibonacci.create(
  [
    {
      value: 1,
      result: 1,
      runtime: 0.05
    },
    {
      value: 3,
      result: 1,
      runtime: 0.04
    },
    {
      value: 10,
      result: 55,
      runtime: 0.15
    },
  ]
)
