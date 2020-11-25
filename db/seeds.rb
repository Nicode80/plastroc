# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# clear DB before seed
puts '#----- deleting all instructions...'
  Instruction.destroy_all if Rails.env.development?
puts '##---- deleting all materials...'
  Material.destroy_all if Rails.env.development?

# First Material
puts '###--- creating PET material...'
@pet = Material.new
  @pet.name = "PET"
  @pet.description = "Polytéréphtalate d'éthylène"
  @pet.category  = "plastic"
  @pet.photo.attach(
    io: File.open(Rails.root.join('db/fixtures/plastic.jpeg')),
    filename: 'plastic.jpeg',
    )
@pet.save!

  # Fist Material Instructions
  puts '####-- creating PET instructions...'
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
puts '#####- creating ABS material...'
@abs = Material.new
  @abs.name = "ABS"
  @abs.description = "Acrylonitrile butadiène styrène"
  @abs.category  = "plastic"
  @abs.photo.attach(
    io: File.open(Rails.root.join('db/fixtures/keyboard.jpeg')),
    filename: 'keyboard.jpeg',
    )
@abs.save!

  # Second Material Instructions
  puts '###### creating ABS instructions...'
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

