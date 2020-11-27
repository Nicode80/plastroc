# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#############################################################################
# Materials seed
#############################################################################
require ('faker')
require "open-uri"

# clear DB before seed
puts 'Deleting all packages...'
  Package.destroy_all if Rails.env.development?
puts 'Deleting all campaigns...'
  Campaign.destroy_all if Rails.env.development?
puts 'Deleting all instructions...'
  Instruction.destroy_all if Rails.env.development?
puts 'Deleting all materials...'
  Material.destroy_all if Rails.env.development?

# First Material
puts 'Creating PET material...'
@pet = Material.new
  @pet.name = "PET"
  @pet.description = "Polytéréphtalate d'éthylène"
  @pet.category  = "Plastique"
  @pet.photo.attach(
    io: File.open(Rails.root.join('db/fixtures/plastic.jpeg')),
    filename: 'plastic.jpeg',
    )
@pet.save!

  # Fist Material Instructions
  puts 'Creating PET instructions...'
  @instruction1 = Instruction.new
    @instruction1.title = "Selectionnez les bouteilles"
    @instruction1.rich_content = "Ne choisissez que les bouteilles en plastique transparent."
    @instruction1.step_order = 1
    @instruction1.material = @pet
    @instruction1.media.attach(
      io: File.open(Rails.root.join('db/fixtures/bottle.jpeg')),
      filename: 'bottle.jpeg',
      )
  @instruction1.save!

  @instruction2 = Instruction.new
    @instruction2.title = "Retirez bouchons et étiquettes"
    @instruction2.rich_content = "Retirez les bouchons et les étiquettes.
      Vous pouvez les garder ou les jeter dans la poubelle de tri.
      Veillez à bien retirer les couronnes qui attachent les bouchons à la bouteille."
    @instruction2.step_order = 2
    @instruction2.material = @pet
    @instruction2.media.attach(
      io: File.open(Rails.root.join('db/fixtures/bouchon.jpeg')),
      filename: 'bouchon.jpeg',
      )
  @instruction2.save!

  @instruction3 = Instruction.new
    @instruction3.title = "Retirez les résidus de colle"
    @instruction3.rich_content = "Retirez les résidus de colle de l'étiquette à l'aide dun couteau.
      Evitez les dissolvant car cela altère le plastique. Vous pouvez humidifier la bouteille avec de l'eau chaude pour ramolir la colle.
      Une fois prête vous pouvez compresser la bouteille pour qu'elle prenne moins de place."
    @instruction3.step_order = 3
    @instruction3.material = @pet
    @instruction3.media.attach(
      io: File.open(Rails.root.join('db/fixtures/etiquette.jpeg')),
      filename: 'etiquette.jpeg',
      )
  @instruction3.save!

################################################################################

# Second Material
puts 'Creating ABS material...'
@abs = Material.new
  @abs.name = "ABS"
  @abs.description = "Acrylonitrile butadiène styrène"
  @abs.category  = "Plastique"
  @abs.photo.attach(
    io: File.open(Rails.root.join('db/fixtures/keyboard.jpeg')),
    filename: 'keyboard.jpeg',
    )
@abs.save!

  # Second Material Instructions
  puts 'Creating ABS instructions...'
  @instruction1 = Instruction.new
    @instruction1.title = "Trouvez des claviers d'ordinateurs"
    @instruction1.rich_content = "Ne choisissez que les claviers à touche blanches ou grises.
      Ne choisissez que les claviers mécaniques comme sur la photo. Tous les claviers avant 2014 sont bien mécaniques.
      Evitez les claviers apple récents à touches plates."
    @instruction1.step_order = 1
    @instruction1.material = @abs
    @instruction1.media.attach(
      io: File.open(Rails.root.join('db/fixtures/mecanic.jpeg')),
      filename: 'mecanic.jpeg',
      )
  @instruction1.save!

  @instruction2 = Instruction.new
    @instruction2.title = "Démontez le clavier"
    @instruction2.rich_content = "Retirez toutes les vis et faites sauter toutes les touches à l'aide d'un couteau.
      Ne gardez que la coque en plastique du clavier et les touches. Retirez tous les composants éléctroniques et les pièces en métal."
    @instruction2.step_order = 2
    @instruction2.material = @abs
    @instruction2.media.attach(
      io: File.open(Rails.root.join('db/fixtures/elec.jpeg')),
      filename: 'elec.jpeg',
      )
  @instruction2.save!

  @instruction3 = Instruction.new
    @instruction3.title = "Laver les touches et la coque"
    @instruction3.rich_content = "Placez toutes les pièces en platique dans de l'eau savonneuse pendant 30min.
      Essuyez les pièces avec un chiffon propre et vous assurant qu'elles sont bien sèches."
    @instruction3.step_order = 3
    @instruction3.material = @abs
    @instruction3.media.attach(
      io: File.open(Rails.root.join('db/fixtures/soap.jpeg')),
      filename: 'soap.jpeg',
      )
  @instruction3.save!

################################################################################

# Third Material
puts 'Creating Organic material...'
@compost = Material.new
  @compost.name = "Composte ménager"
  @compost.description = "Epluchures de légumes et de fruits"
  @compost.category  = "Composte"
  @compost.photo.attach(
    io: File.open(Rails.root.join('db/fixtures/compost.jpeg')),
    filename: 'compost.jpeg',
    )
@compost.save!

  # Second Material Instructions
  puts 'Creating Organic instructions...'
  @instruction1 = Instruction.new
    @instruction1.title = "Récupérez vos épluchures"
    @instruction1.rich_content = "Ne choisissez que les épluchures de légumes et de fruits hors agrumes et kiwi (trop acides)."
    @instruction1.step_order = 1
    @instruction1.material = @compost
    @instruction1.media.attach(
      io: File.open(Rails.root.join('db/fixtures/compost.jpeg')),
      filename: 'compost.jpeg',
      )
  @instruction1.save!

  @instruction2 = Instruction.new
    @instruction2.title = "Démontez le clavier"
    @instruction2.rich_content = "Retirez les éventuels résidus de plastique"
    @instruction2.step_order = 2
    @instruction2.material = @compost
    @instruction2.media.attach(
      io: File.open(Rails.root.join('db/fixtures/compost.jpeg')),
      filename: 'elec.jpeg',
      )
  @instruction2.save!

########################################################################
########################################################################

# Delete Current Organisations and Users
puts 'Deleting all Orgnanisations...'
  Organisation.destroy_all if Rails.env.development?
puts 'Deleting all Users...'
  User.destroy_all if Rails.env.development?

#####################################################################
# Users Seed
#####################################################################

# Platroc Admin Team's accrounts
  if Rails.env.development?
    puts "Creating Maximin's Admin account..."
    @max = User.new
    @max.first_name = "Maximin"
    @max.last_name = "d'Audiffret"
    @max.email = "maximin.daudiffret@gmail.com"
    @max.password = "123456"
    @max.xp = 1000
    @max.admin = true
    file = URI.open('https://i.pravatar.cc/200')
    @max.photo.attach(
      io: file,
      filename: "max.jpg",
      )
    @max.save!

    @organisation = Organisation.new
    @organisation.user = @max
    @organisation.name = "MaxPlanet"
    @organisation.about = "Lorem ipsum dolor sit amet,
      consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    @organisation.address = "Paris 750#{rand(10..20)}"
    @organisation.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    file = URI.open("https://fakeimg.pl/200x200/?text=#{@organisation.name}")
    @organisation.photo.attach(
      io: file,
      filename: "#{@organisation.name.downcase.gsub(/\s+/, "")}.jpg",
      )
    @organisation.save!
  end

  if Rails.env.development?
    puts "Creating Nicolas' Admin account..."
    @nico = User.new
    @nico.first_name = "Nicolas"
    @nico.last_name = "Constantin"
    @nico.email = "nicolasconstantin@hotmail.fr"
    @nico.password = "123456"
    @nico.xp = 1000
    @nico.admin = true
    file = URI.open('https://i.pravatar.cc/200')
    @nico.photo.attach(
      io: file,
      filename: "nico.jpg",
      )
    @nico.save!

    @organisation = Organisation.new
    @organisation.user = @nico
    @organisation.name = "NicoTri"
    @organisation.about = "Lorem ipsum dolor sit amet,
      consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    @organisation.address = "Paris 750#{rand(10..20)}"
    @organisation.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    file = URI.open("https://fakeimg.pl/200x200/?text=#{@organisation.name}")
    @organisation.photo.attach(
      io: file,
      filename: "#{@organisation.name.downcase.gsub(/\s+/, "")}.jpg",
      )
    @organisation.save!
  end

  if Rails.env.development?
    puts "Creating Thomas' Admin account..."
    @tom = User.new
    @tom.first_name = "Thomas"
    @tom.last_name = "Le Bihan"
    @tom.email = "thomas.66days@gmail.com"
    @tom.password = "123456"
    @tom.xp = 1000
    @tom.admin = true
    file = URI.open('https://i.pravatar.cc/200')
    @tom.photo.attach(
      io: file,
      filename: "tom.jpg",
      )
    @tom.save!

    @organisation = Organisation.new
    @organisation.user = @tom
    @organisation.name = "AshSort"
    @organisation.about = "Lorem ipsum dolor sit amet,
      consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    @organisation.address = "Paris 750#{rand(10..20)}"
    @organisation.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    file = URI.open("https://fakeimg.pl/200x200/?text=#{@organisation.name}")
    @organisation.photo.attach(
      io: file,
      filename: "#{@organisation.name.downcase.gsub(/\s+/, "")}.jpg",
      )
    @organisation.save!
  end

  if Rails.env.development?
    puts "Creating JR's Admin account..."
    @jr = User.new
    @jr.first_name = "JR"
    @jr.last_name = "Lherm"
    @jr.email = "lherm.jr@gmail.com"
    @jr.password = "123456"
    @jr.xp = 1000
    @jr.admin = true
    file = URI.open('https://i.pravatar.cc/200')
    @jr.photo.attach(
      io: file,
      filename: "jr.jpg",
      )
    @jr.save!

    @organisation = Organisation.new
    @organisation.user = @jr
    @organisation.name = "JR Select"
    @organisation.about = "Lorem ipsum dolor sit amet,
      consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    @organisation.address = "Paris 750#{rand(10..20)}"
    @organisation.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    file = URI.open("https://fakeimg.pl/200x200/?text=#{@organisation.name}")
    @organisation.photo.attach(
      io: file,
      filename: "#{@organisation.name.downcase.gsub(/\s+/, "")}.jpg",
      )
    @organisation.save!
  end

# # count on seed
# x= 0

# # 50 random accounts
# puts "Creating 20 fake user accounts..."
#   20.times do
#     x += 1
#     puts "#{x}/25"
#     @user = User.new
#     @user.first_name = Faker::Name.name
#     @user.last_name = Faker::Name.last_name
#     @user.email = "#{@user.first_name.downcase.gsub(/\s+/, "")}_#{x}@#{@user.last_name.downcase.gsub(/\s+/, "")}.com"
#     @user.password = "123456"
#     @user.xp = rand(0..800)
#     file = URI.open('https://i.pravatar.cc/200')
#     @user.photo.attach(
#       io: file,
#       filename: "user#{x}.jpg",
#       )
#     @user.save!
#   end

# # 5 random accounts with 1 organisation
# puts "Creating 5 more fake user accounts with organisation..."
#   5.times do
#     x += 1
#     puts "#{x}/25"
#     @user = User.new
#     @user.first_name = Faker::Name.name
#     @user.last_name = Faker::Name.last_name
#     @user.email = "#{@user.first_name.downcase.gsub(/\s+/, "")}_#{x}@#{@user.last_name.downcase.gsub(/\s+/, "")}.com"
#     @user.password = "123456"
#     @user.xp = rand(0..800)
#     file = URI.open('https://i.pravatar.cc/200')
#     @user.photo.attach(
#       io: file,
#       filename: "user#{x}.jpg",
#       )
#     @user.save!

#     # organisation
#     @organisation = Organisation.new
#     @organisation.user = @user
#     @organisation.name = Faker::Company.name
#     @organisation.about = "Lorem ipsum dolor sit amet,
#       consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
#       Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
#     @organisation.address = "Paris 750#{rand(10..20)}"
#     @organisation.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
#     @organisation.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
#     file = URI.open("https://fakeimg.pl/200x200/?text=#{@organisation.name}")
#     @organisation.photo.attach(
#       io: file,
#       filename: "#{@organisation.name.downcase.gsub(/\s+/, "")}.jpg",
#       )
#     @organisation.save!
#   end

# 3 random Admin accounts with 2 organisations
puts "Creating 3 more fake user accounts with 2 organisations each..."

  # Premier user
  puts "1/3 - with 2 campaigns"
  @user1 = User.new
    @user1.first_name = "Michel"
    @user1.last_name = "Flantier"
    @user1.email = "michel@paprec.com"
    @user1.password = "123456"
    @user1.admin = true
    @user1.xp = rand(800..900)
    file = URI.open('https://i.pravatar.cc/200')
    @user1.photo.attach(
      io: file,
      filename: "michel.jpg",
      )
    @user1.save!

    # organisation1
    @organisation1 = Organisation.new
    @organisation1.user = @user1
    @organisation1.name = "Paprec Seine-Saint-Denis"
    @organisation1.about = "Paprec Group est le leader indépendant français du recyclage avec 210 sites et plus de 12 000 000 de tonnes de déchets recyclés."
    @organisation1.address = "15 rue Edouard Vaillant 93200 Saint Denis"
    @organisation1.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation1.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    @organisation1.photo.attach(
      io: File.open(Rails.root.join('db/fixtures/paprec.jpg')),
      filename: 'paprec.jpg',
      )
    @organisation1.save!

    # campaign3
    @campaign3 = Campaign.new
    @campaign3.name = "Recyclage PET local"
    @campaign3.description = "Recyclage de materiaux PET verts"
    @campaign3.target = 4000
    @campaign3.unit = "kg"
    @campaign3.min_package = 20
    @campaign3.start_date = Date.today
    @campaign3.end_date = Date.today + 4.weeks
    @campaign3.status = 'ongoing'
    @campaign3.organisation = @organisation1
    @campaign3.material = @pet
    @campaign3.published = true
    file = URI.open('https://images.unsplash.com/photo-1572964782790-92b2dccabe68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80')
    @campaign3.photo.attach(
      io: file,
      filename: "campagne1.jpg",
      )
    @campaign3.save!

    iterators = [(@campaign3.target / @campaign3.min_package).floor, 4].min
    names = ['Corail', 'Tortue', 'Dauphin', 'Baleine']
    x = 0
    iterators.times do
      @name = names[x]
      @quantity = (x + 1) * @campaign3.min_package
      @reward = (x + 1) * @campaign3.min_package / 2
      @campaign3.packages.create(name: @name, quantity: @quantity, xp_reward: @reward)
      x += 1
    end

    # organisation2
    @organisation2 = Organisation.new
    @organisation2.user = @user1
    @organisation2.name = "Paprec Hauts-de-Seine"
    @organisation2.about = "Paprec Group est le leader indépendant français du recyclage avec 210 sites et plus de 12 000 000 de tonnes de déchets recyclés."
    @organisation2.address = "5 avenue de la Marne 92600 Asnières sur Seine"
    @organisation2.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation2.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    @organisation2.photo.attach(
      io: File.open(Rails.root.join('db/fixtures/paprec.jpg')),
      filename: 'paprec.jpg',
      )
    @organisation2.save!

    # campaign4
    @campaign4 = Campaign.new
    @campaign4.name = "Recyclage ABS local"
    @campaign4.description = "Recyclage de ABS noir et gris foncé"
    @campaign4.target = 4000
    @campaign4.unit = "kg"
    @campaign4.min_package = 20
    @campaign4.start_date = Date.today
    @campaign4.end_date = Date.today + 4.weeks
    @campaign4.status = 'ongoing'
    @campaign4.organisation = @organisation2
    @campaign4.material = @abs
    @campaign4.published = true
    file = URI.open('https://images.unsplash.com/photo-1572964782790-92b2dccabe68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80')
    @campaign4.photo.attach(
      io: file,
      filename: "campagne1.jpg",
      )
    @campaign4.save!

    iterators = [(@campaign4.target / @campaign4.min_package).floor, 4].min
    names = ['Corail', 'Tortue', 'Dauphin', 'Baleine']
    x = 0
    iterators.times do
      @name = names[x]
      @quantity = (x + 1) * @campaign4.min_package
      @reward = (x + 1) * @campaign4.min_package / 2
      @campaign4.packages.create(name: @name, quantity: @quantity, xp_reward: @reward)
      x += 1
    end

  # Second user
  puts "2/3 - including 2 campaigns for yann@goodplanet.com (pwd: 123456)"
  @user2 = User.new
    @user2.first_name = "Yann"
    @user2.last_name = "A. Bertrand"
    @user2.email = "yann@goodplanet.com"
    @user2.password = "123456"
    @user2.admin = true
    @user2.xp = rand(800..900)
    file = URI.open('https://i.pravatar.cc/200')
    @user2.photo.attach(
      io: file,
      filename: "yann.jpg",
      )
    @user2.save!

    # organisation3
    @organisation3 = Organisation.new
    @organisation3.user = @user2
    @organisation3.name = "Good Planet Boulogne"
    @organisation3.about = "La Fondation GoodPlanet a pour vocation de sensibiliser l’ensemble des acteurs aux enjeux environnementaux. Elle met en œuvre des projets de terrain autour de cinq grandes thématiques (biodiversité, agriculture durable, énergie propre, déchets et éducation) afin de préserver notre planète."
    @organisation3.address = "Bois de Boulogne"
    @organisation3.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation3.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    @organisation3.photo.attach(
      io: File.open(Rails.root.join('db/fixtures/goodplanet.png')),
      filename: 'goodplanet.jpeg',
      )
    @organisation3.save!

    # campaign1
    @campaign1 = Campaign.new
    @campaign1.name = "Recyclage PET Automn 2020"
    @campaign1.description = "Recyclage de materiaux PET transparents"
    @campaign1.target = 2000
    @campaign1.unit = "kg"
    @campaign1.min_package = 10
    @campaign1.start_date = Date.today
    @campaign1.end_date = Date.today + 4.weeks
    @campaign1.organisation = @organisation3
    @campaign1.status = 'ongoing'
    @campaign1.material = @pet
    @campaign1.published = true
    file = URI.open('https://images.unsplash.com/photo-1572964734607-0051976fac79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80')
    @campaign1.photo.attach(
      io: file,
      filename: "campagne1.jpg",
      )
    @campaign1.save!

    iterators = [(@campaign1.target / @campaign1.min_package).floor, 4].min
    names = ['Corail', 'Tortue', 'Dauphin', 'Baleine']
    x = 0
    iterators.times do
      @name = names[x]
      @quantity = (x + 1) * @campaign1.min_package
      @reward = (x + 1) * @campaign1.min_package / 2
      @campaign1.packages.create(name: @name, quantity: @quantity, xp_reward: @reward)
      x += 1
    end

    # organisation4
    @organisation4 = Organisation.new
    @organisation4.user = @user2
    @organisation4.name = "Good Planet Vincennes"
    @organisation4.about = "La Fondation GoodPlanet a pour vocation de sensibiliser l’ensemble des acteurs aux enjeux environnementaux. Elle met en œuvre des projets de terrain autour de cinq grandes thématiques (biodiversité, agriculture durable, énergie propre, déchets et éducation) afin de préserver notre planète."
    @organisation4.address = "Bois de Vincennes"
    @organisation4.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation4.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    @organisation4.photo.attach(
      io: File.open(Rails.root.join('db/fixtures/goodplanet.png')),
      filename: 'goodplanet.jpeg',
      )
    @organisation4.save!

    # campaign2
    @campaign2 = Campaign.new
    @campaign2.name = "Recyclage ABS Automn 2020"
    @campaign2.description = "Recyclage de materiaux ABS blancs"
    @campaign2.target = 1000
    @campaign2.unit = "kg"
    @campaign2.min_package = 5
    @campaign2.start_date = Date.today
    @campaign2.end_date = Date.today + 3.weeks
    @campaign2.organisation = @organisation4
    @campaign2.material = @abs
    @campaign2.status = 'ongoing'
    @campaign2.published = true
    file = URI.open('https://images.unsplash.com/photo-1569372069325-270201150e3c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80')
    @campaign2.photo.attach(
      io: file,
      filename: "campagne2.jpg",
      )
    @campaign2.save!

    iterators = [(@campaign2.target / @campaign2.min_package).floor, 4].min
    x = 0
    iterators.times do
      @name = names[x]
      @quantity = (x + 1) * @campaign2.min_package
      @reward = (x + 1) * @campaign2.min_package / 2
      @campaign2.packages.create(name: @name, quantity: @quantity, xp_reward: @reward)
      x += 1
    end

  # Third user
  puts "3/3 - including 2 campaigns for aram@oucompost.com (pwd: 123456)"
  @user3 = User.new
    @user3.first_name = "Aram"
    @user3.last_name = "Sulukdjian"
    @user3.email = "aram@oucompost.com"
    @user3.password = "123456"
    @user3.admin = true
    @user3.xp = rand(800..900)
    file = URI.open('https://i.pravatar.cc/200')
    @user3.photo.attach(
      io: file,
      filename: "aram.jpg",
      )
    @user3.save!

    # organisation5
    @organisation5 = Organisation.new
    @organisation5.user = @user3
    @organisation5.name = "Ou compost Madeleine"
    @organisation5.about = "Platform to find local compost bins, privates willing to collect organic waste for their gardens and businesses in need of organic waste."
    @organisation5.address = "Place de la Madeleine, Paris"
    @organisation5.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation5.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    @organisation5.photo.attach(
      io: File.open(Rails.root.join('db/fixtures/oucompost.png')),
      filename: 'oucompost.png',
      )
    @organisation5.save!

    # campaign6
    @campaign6 = Campaign.new
    @campaign6.name = "Recyclage Composte"
    @campaign6.description = "Recyclage de composte ménager"
    @campaign6.target = 2000
    @campaign6.unit = "kg"
    @campaign6.min_package = 10
    @campaign6.start_date = Date.today
    @campaign6.end_date = Date.today + 4.weeks
    @campaign6.organisation = @organisation5
    @campaign6.material = @compost
    @campaign6.published = true
    @campaign6.status = 'ongoing'
    file = URI.open('https://images.unsplash.com/photo-1516711345667-ebafb3ebea12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1952&q=80')
    @campaign6.photo.attach(
      io: file,
      filename: "campagne6.jpg",
      )
    @campaign6.save!

    iterators = [(@campaign6.target / @campaign6.min_package).floor, 4].min
    names = ['Corail', 'Tortue', 'Dauphin', 'Baleine']
    x = 0
    iterators.times do
      @name = names[x]
      @quantity = (x + 1) * @campaign6.min_package
      @reward = (x + 1) * @campaign6.min_package / 2
      @campaign6.packages.create(name: @name, quantity: @quantity, xp_reward: @reward)
      x += 1
    end

    # organisation6
    @organisation6 = Organisation.new
    @organisation6.user = @user3
    @organisation6.name = "Ou compost Nation"
    @organisation6.about = "Platform to find local compost bins, privates willing to collect organic waste for their gardens and businesses in need of organic waste."
    @organisation6.address = "Place de la Nation, Paris"
    @organisation6.contact = "06-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}-#{Faker::PhoneNumber.subscriber_number(length: 2)}"
    @organisation6.opening_hours = "Du lundi au samedi de #{rand(7..11)}h à #{rand(16..21)}h"
    @organisation6.photo.attach(
      io: File.open(Rails.root.join('db/fixtures/oucompost.png')),
      filename: 'oucompost.png',
      )
    @organisation6.save!

    # campaign7
    @campaign7 = Campaign.new
    @campaign7.name = "Recyclage Composte"
    @campaign7.description = "Recyclage de composte ménager"
    @campaign7.target = 2000
    @campaign7.unit = "kg"
    @campaign7.min_package = 10
    @campaign7.start_date = Date.today
    @campaign7.end_date = Date.today + 4.weeks
    @campaign7.organisation = @organisation6
    @campaign7.material = @compost
    @campaign7.published = true
    @campaign7.status = 'ongoing'
    file = URI.open('https://images.unsplash.com/photo-1516711345667-ebafb3ebea12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1952&q=80')
    @campaign7.photo.attach(
      io: file,
      filename: "campagne6.jpg",
      )
    @campaign7.save!

    iterators = [(@campaign7.target / @campaign7.min_package).floor, 4].min
    names = ['Corail', 'Tortue', 'Dauphin', 'Baleine']
    x = 0
    iterators.times do
      @name = names[x]
      @quantity = (x + 1) * @campaign7.min_package
      @reward = (x + 1) * @campaign7.min_package / 2
      @campaign7.packages.create(name: @name, quantity: @quantity, xp_reward: @reward)
      x += 1
    end

# End of users seed


