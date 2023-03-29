require './app'

class Menu
  def initialize(app)
    @app = app
  end

  def display_menu
    puts 'Please select an option by entering its respective number'
    list = {
      1 => 'List all books',
      2 => 'List all people',
      3 => 'Create a person',
      4 => 'Create a book',
      5 => 'Create a rental',
      6 => 'List all rentals for a given person id',
      7 => 'Exit'
    }

    list.each do |index, string|
      puts "{index} - {string}"
    end
    gets.chomp.to_i
  end

  def run
    loop do
      case display_menu
      when 1
        @app.list_books
      when 2
        @app.list_people
      when 3
        @app.create_person
      when 4
        @app.create_book
      when 5
        @app.create_rental
      when 6
        puts 'Enter person\'s id'
        person_id = gets.chomp.to_i
        @app.list_all_rentals(person_id)
      when 7
        puts 'Thank you for using this app!'
        exit
      else
        puts 'Please choose a number between 1 and 7'
      end
    end
  end
end
