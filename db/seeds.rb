# db/seeds.rb

puts "Starting the seeding process..."

# Destroy previous records to ensure a clean slate
begin
  puts "Destroying previous records..."

  # Assuming you want to clear all records from these tables
  SongAuthor.destroy_all
  Song.destroy_all
  Lp.destroy_all
  Artist.destroy_all
  Author.destroy_all

  puts "Previous records destroyed."
rescue => e
  puts "Error destroying previous records: #{e.message}"
end

# Create new records
begin
  puts "Creating authors..."
  # Create Authors
  Author.create!(name: 'James Hetfield')
  Author.create!(name: 'Kirk Hammett')
  Author.create!(name: 'Jason Newsted')
  puts "Authors created."
rescue => e
  puts "Error creating authors: #{e.message}"
end

begin
  puts "Creating artists..."
  # Create Artists
  metallica = Artist.create!(name: 'Metallica', description: 'American heavy metal band.')
  sepultura = Artist.create!(name: 'Sepultura', description: 'Brazilian metal band.')
  puts "Artists created."
rescue => e
  puts "Error creating artists: #{e.message}"
end

begin
  puts "Creating LPs..."
  # Create LPs
  black_album = metallica.lps.create!(name: 'Black Album', description: 'Famous album by Metallica.')
  against = sepultura.lps.create!(name: 'Against', description: 'Famous album by Sepultura.')
  puts "LPs created."
rescue => e
  puts "Error creating LPs: #{e.message}"
end

begin
  puts "Creating songs..."
  # Create Songs
  black_album.songs.create!(name: 'My Friend of Misery')
  black_album.songs.create!(name: 'Enter Sandman')
  black_album.songs.create!(name: 'Unforgiven')
  against.songs.create!(name: 'Hatred Aside')
  puts "Songs created."
rescue => e
  puts "Error creating songs: #{e.message}"
end

begin
  puts "Creating song authors..."
  # Create SongAuthors
  my_friend_of_misery = black_album.songs.find_by(name: 'My Friend of Misery')
  SongAuthor.create!(song: my_friend_of_misery, author: Author.find_by(name: 'James Hetfield'))
  SongAuthor.create!(song: my_friend_of_misery, author: Author.find_by(name: 'Jason Newsted'))

  enter_sandman = black_album.songs.find_by(name: 'Enter Sandman')
  SongAuthor.create!(song: enter_sandman, author: Author.find_by(name: 'James Hetfield'))

  unforgiven = black_album.songs.find_by(name: 'Unforgiven')
  SongAuthor.create!(song: unforgiven, author: Author.find_by(name: 'James Hetfield'))
  SongAuthor.create!(song: unforgiven, author: Author.find_by(name: 'Kirk Hammett'))

  hatred_aside = against.songs.find_by(name: 'Hatred Aside')
  SongAuthor.create!(song: hatred_aside, author: Author.find_by(name: 'Jason Newsted'))
  puts "Song authors created."
rescue => e
  puts "Error creating song authors: #{e.message}"
end

puts "Seeding process completed successfully!"
