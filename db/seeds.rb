# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Nation.destroy_all

Nation.create(
  slug:         '3dna',
  client_uid:   'a1e80421e0dd8eabf349e563ecdb4d4f3c39e1b2023876fbd65e0e9bdb7bc8f4',
  secret_key:   '3671b252493005e6a9a93c909a2e99bcc5983949e77117f7bfb0cdf4a428ac13'
)