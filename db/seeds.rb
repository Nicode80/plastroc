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
    @tom.email = "thomas.66days@gmail"
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

# count on seed
x= 0

# 50 random accounts
puts "Creating 20 fake user accounts..."
  20.times do
    x += 1
    puts "#{x}/25"
    @user = User.new
    @user.first_name = Faker::Name.name
    @user.last_name = Faker::Name.last_name
    @user.email = "#{@user.first_name.downcase.gsub(/\s+/, "")}_#{x}@#{@user.last_name.downcase.gsub(/\s+/, "")}.com"
    @user.password = "123456"
    @user.xp = rand(0..800)
    file = URI.open('https://i.pravatar.cc/200')
    @user.photo.attach(
      io: file,
      filename: "user#{x}.jpg",
      )
    @user.save!
  end

# 5 random accounts with 1 organisation
puts "Creating 5 more fake user accounts with organisation..."
  5.times do
    x += 1
    puts "#{x}/25"
    @user = User.new
    @user.first_name = Faker::Name.name
    @user.last_name = Faker::Name.last_name
    @user.email = "#{@user.first_name.downcase.gsub(/\s+/, "")}_#{x}@#{@user.last_name.downcase.gsub(/\s+/, "")}.com"
    @user.password = "123456"
    @user.xp = rand(0..800)
    file = URI.open('https://i.pravatar.cc/200')
    @user.photo.attach(
      io: file,
      filename: "user#{x}.jpg",
      )
    @user.save!

    # organisation
    @organisation = Organisation.new
    @organisation.user = @user
    @organisation.name = Faker::Company.name
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

# 2 random Admin accounts with 2 organisations
puts "Creating 2 more fake user accounts with 2 organisations each..."

  # Premier user
  puts "1/2"
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

  # Second user
  puts "2/2 - including 2 campaigns for yann@goodplanet.com (pwd: 123456)"
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
    @campaign1.end_date = "2020-12-25"
    @campaign1.organisation = @organisation3
    @campaign1.material = @pet
    @campaign1.published = true
    file = URI.open('https://images.unsplash.com/photo-1572964734607-0051976fac79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1651&q=80')
    @campaign1.photo.attach(
      io: file,
      filename: "campagne1.jpg",
      )
    @campaign1.save!

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
    @campaign2.end_date = "2020-12-25"
    @campaign2.organisation = @organisation4
    @campaign2.material = @abs
    @campaign2.published = true
    file = URI.open('https://images.unsplash.com/photo-1569372069325-270201150e3c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80')
    @campaign2.photo.attach(
      io: file,
      filename: "campagne2.jpg",
      )
    @campaign2.save!

# End of users seed


