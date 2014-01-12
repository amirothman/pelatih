#Dekat sini, kita nak bina satu perpustakaan nama dia @bibliothek

bibliothek = Array.new

#Bukak folder yg bernama "korpus", cari file yang habis dengan .txt, simpan dalam @bibliothek

Dir.foreach("korpus") do |l|
   bibliothek << l if l.match(/\.txt$/)
end

#Untuk bina himpunan ayat2, kita bagi dia nama @korpus

korpus = Array.new

bibliothek.each do |b|
  korpus = korpus + IO.binread("korpus/"+b).gsub(/\n/," ").split(/\./)
end


#Bina himpunan ayat-ayat pendek

@ayat_ayat_pendek = Array.new

korpus.flatten.each do |a|

  #Dekat sini Ruby ada masalah dengan encoding so terpaksa buat mcm ni. rasanya ruby 2.1 dah solve masalah ni
  a.gsub!(/[\.\,\~\+\\\/\(\)\-\*\"\'\=\%\&\!\]\[\:\;\>\<0-9]+/," ")
  a.gsub!(/^\s+/,"")
  a.gsub!(/\s+/," ")
  
  keep = true

  if a.split.size > 2 && a.split.size < 8

    a.split(/\s+/).each do |lk|
      unless lk.size == 1 || lk.match(/[^\w]/)
        @ayat_ayat_pendek << a
      end
    end
  end
end