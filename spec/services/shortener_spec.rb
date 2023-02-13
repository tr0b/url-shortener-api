require 'spec_helper'

RSpec.describe Shortener do
  it 'generates a valid short url' do
    short_url = Shortener.call(url: 'https://google.com')
    expect(short_url.length).not_to eq(0)
  end
  it 'returns an error, when entering an invalid url' do
    invalid_short_url = Shortener.call(url: 'random invalid value')
    expect(invalid_short_url.length).to eq(0)
  end
end
