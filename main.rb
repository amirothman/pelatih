load "./load.rb"
load "./rhymer.rb"

mode = ARGV[0]

@ayat_ayat_pendek.uniq.shuffle.each do |w|
  puts w
  
  puts corakhujung(w.split(' ')[-1])
  
  
  #kalau nak enter baru keluar ayat baru
  gets.chomp
end