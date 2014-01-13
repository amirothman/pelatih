load "./load.rb"
load "./rhymer.rb"

mode = ARGV[0]

@ayat_ayat_pendek.uniq.shuffle.each do |w|
  puts w
  #kalau nak enter baru keluar ayat baru
  #gets.chomp
end