# db/seeds.rb

puts "Starting the seeding process..."

# Destroy previous records
begin
  puts "Destroying previous records..."
  SongAuthor.destroy_all
  Song.destroy_all
  Lp.destroy_all
  Artist.destroy_all
  Author.destroy_all
  puts "Previous records destroyed."
rescue => e
  puts "Error destroying previous records: #{e.message}"
end

# Create Authors
begin
  puts "Creating authors..."
  Author.create!(name: 'James Hetfield')
  Author.create!(name: 'Kirk Hammett')
  Author.create!(name: 'Jason Newsted')
  Author.create!(name: 'Jimmy Page')
  Author.create!(name: 'Robert Plant')
  Author.create!(name: 'Freddie Mercury')
  Author.create!(name: 'John Deacon')
  Author.create!(name: 'John Lennon')
  Author.create!(name: 'George Harrison')
  Author.create!(name: 'Mick Jagger')
  Author.create!(name: 'Keith Richards')
  puts "Authors created."
rescue => e
  puts "Error creating authors: #{e.message}"
end

# Create Artists
begin
  puts "Creating artists..."
  metallica = Artist.create!(name: 'Metallica', description: 'American heavy metal band.')
  sepultura = Artist.create!(name: 'Sepultura', description: 'Brazilian metal band.')
  led_zeppelin = Artist.create!(name: 'Led Zeppelin', description: 'English rock band.')
  queen = Artist.create!(name: 'Queen', description: 'British rock band.')
  the_beatles = Artist.create!(name: 'The Beatles', description: 'English rock band.')
  rolling_stones = Artist.create!(name: 'The Rolling Stones', description: 'English rock band.')
  puts "Artists created."
rescue => e
  puts "Error creating artists: #{e.message}"
end

# Create LPs and Songs
begin
  puts "Creating LPs and songs..."
  
  # Metallica
  black_album = metallica.lps.create!(name: 'Black Album', description: 'Famous album by Metallica.')
  black_album.songs.create!(name: 'My Friend of Misery')
  black_album.songs.create!(name: 'Enter Sandman')
  black_album.songs.create!(name: 'Unforgiven')

  # Sepultura
  against = sepultura.lps.create!(name: 'Against', description: 'Famous album by Sepultura.')
  against.songs.create!(name: 'Hatred Aside')

  # Led Zeppelin
  led_zeppelin_iv = led_zeppelin.lps.create!(name: 'Led Zeppelin IV', description: 'Famous album by Led Zeppelin.')
  led_zeppelin_iv.songs.create!(name: 'Stairway to Heaven')
  led_zeppelin_iv.songs.create!(name: 'Black Dog')

  # Queen
  night_at_the_opera = queen.lps.create!(name: 'A Night at the Opera', description: 'Famous album by Queen.')
  night_at_the_opera.songs.create!(name: 'Bohemian Rhapsody')
  night_at_the_opera.songs.create!(name: 'You’re My Best Friend')

  # The Beatles
  abbey_road = the_beatles.lps.create!(name: 'Abbey Road', description: 'Famous album by The Beatles.')
  abbey_road.songs.create!(name: 'Come Together')
  abbey_road.songs.create!(name: 'Here Comes the Sun')

  # The Rolling Stones
  let_it_bleed = rolling_stones.lps.create!(name: 'Let It Bleed', description: 'Famous album by The Rolling Stones.')
  let_it_bleed.songs.create!(name: 'Gimme Shelter')
  let_it_bleed.songs.create!(name: 'You Can’t Always Get What You Want')

  puts "LPs and songs created."
rescue => e
  puts "Error creating LPs and songs: #{e.message}"
end

# Create SongAuthors
begin
  puts "Creating song authors..."
  
  # Metallica
  my_friend_of_misery = black_album.songs.find_by(name: 'My Friend of Misery')
  SongAuthor.create!(song: my_friend_of_misery, author: Author.find_by(name: 'James Hetfield'))
  SongAuthor.create!(song: my_friend_of_misery, author: Author.find_by(name: 'Jason Newsted'))

  enter_sandman = black_album.songs.find_by(name: 'Enter Sandman')
  SongAuthor.create!(song: enter_sandman, author: Author.find_by(name: 'James Hetfield'))

  unforgiven = black_album.songs.find_by(name: 'Unforgiven')
  SongAuthor.create!(song: unforgiven, author: Author.find_by(name: 'James Hetfield'))
  SongAuthor.create!(song: unforgiven, author: Author.find_by(name: 'Kirk Hammett'))

  # Sepultura
  hatred_aside = against.songs.find_by(name: 'Hatred Aside')
  SongAuthor.create!(song: hatred_aside, author: Author.find_by(name: 'Jason Newsted'))

  # Led Zeppelin
  stairway_to_heaven = led_zeppelin_iv.songs.find_by(name: 'Stairway to Heaven')
  SongAuthor.create!(song: stairway_to_heaven, author: Author.find_by(name: 'Jimmy Page'))
  SongAuthor.create!(song: stairway_to_heaven, author: Author.find_by(name: 'Robert Plant'))

  black_dog = led_zeppelin_iv.songs.find_by(name: 'Black Dog')
  SongAuthor.create!(song: black_dog, author: Author.find_by(name: 'Jimmy Page'))

  # Queen
  bohemian_rhapsody = night_at_the_opera.songs.find_by(name: 'Bohemian Rhapsody')
  SongAuthor.create!(song: bohemian_rhapsody, author: Author.find_by(name: 'Freddie Mercury'))

  best_friend = night_at_the_opera.songs.find_by(name: 'You’re My Best Friend')
  SongAuthor.create!(song: best_friend, author: Author.find_by(name: 'John Deacon'))

  # The Beatles
  come_together = abbey_road.songs.find_by(name: 'Come Together')
  SongAuthor.create!(song: come_together, author: Author.find_by(name: 'John Lennon'))

  here_comes_the_sun = abbey_road.songs.find_by(name: 'Here Comes the Sun')
  SongAuthor.create!(song: here_comes_the_sun, author: Author.find_by(name: 'George Harrison'))

  # The Rolling Stones
  gimme_shelter = let_it_bleed.songs.find_by(name: 'Gimme Shelter')
  SongAuthor.create!(song: gimme_shelter, author: Author.find_by(name: 'Mick Jagger'))
  SongAuthor.create!(song: gimme_shelter, author: Author.find_by(name: 'Keith Richards'))

  you_cant_always_get = let_it_bleed.songs.find_by(name: 'You Can’t Always Get What You Want')
  SongAuthor.create!(song: you_cant_always_get, author: Author.find_by(name: 'Mick Jagger'))

  puts "Song authors created."
rescue => e
  puts "Error creating song authors: #{e.message}"
end

puts "Seeding process completed successfully!"
