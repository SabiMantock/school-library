require_relative '../book'

describe 'Create a book' do
  book = Book.new('The Equalizer', 'Denzel Washinton')

  it 'Has a title' do
    expect(book.title).to eq('The Equalizer')
  end

  it 'Has an author' do
    expect(book.author).to eq('Denzel Washinton')
  end
end