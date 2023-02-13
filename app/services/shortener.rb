class Shortener < ApplicationService
  def initialize(url:)
    @url = url
    @seed = Url.all.size
  end

  def call
    return '' unless @url =~ URI::regexp
    create_short_url
  end

  private
  ALPHABET = ( (0..9).to_a + ('a'..'z').to_a).join

  # Based on S.O. answer, just perform a Base 36 encoding to the URL ID
  # Base 36 = counting 26 letters from the alphabet + 10 digits from 0 to 9
  def create_short_url
    return ALPHABET[0] if @seed == 0
    short_path = ''
    base = ALPHABET.length
    while @seed > 0
      short_path << ALPHABET[@seed.modulo(base)]
      @seed /= base
    end
    short_path.reverse
  end
end
