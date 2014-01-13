#Methods for returning different kinds of rhymes
@konsonan = %w(b c d e f g h j k l m n p q r s t v x y z)
@konsonan_2 = %w(ng ny sy sh)
@vokal = %w(a e i o u)
@vokal_2 = %w(ai ao au ia iu ie ei ui ua ue uo oi oa ou)

def hujungvokal kata
  hujung = 1 if @vokal.include? kata[-1]
  hujung = 2 if @vokal_2.include? kata[-2..-1]

  hujung
end

def hujungkonsonan kata
  hujung = 1 if @konsonan.include? kata[-1]
  hujung = 2 if @konsonan_2.include? kata[-2..-1]

  hujung
end

def vokal? abjad
  true if @vokal.include? abjad
end

def konsonan? abjad
  true if @konsonan.include? abjad
end

#This method spits out rhyme patterns originally from binary 1 for konsonan, 0 for vowels

def corak kata
  corak = String.new
  kata.chars.each do |c|
    if vokal? c
      corak << '0'
    elsif konsonan? c
      corak << '1'
    end
  end
  #corak
  corak
end

def corakhujung kata
  if hujungvokal kata
  	s_2 = kata.slice!(-hujungvokal(kata)..-1)
  	s_1 = kata.slice!(-hujungkonsonan(kata)..-1)
  elsif hujungkonsonan kata
  	s_3 = kata.slice!(-hujungkonsonan(kata)..-1)
  	s_2 = kata.slice!(-hujungvokal(kata)..-1)
  	s_1 = kata.slice!(-hujungkonsonan(kata)..-1)
  end
  corak = s_1 + s_2 + s_3.to_s
end