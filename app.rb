require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './nameable'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_book
    puts 'Enter book\'s title'
    title = gets.chomp
    puts 'Enter author\'s name'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Created #{book.title} by #{book.author}"
  end

  def list_books
    if @books.empty?
      puts 'There are no books available'
    else
      @books.each do |book|
        puts "Title: '#{book.title}', Author: '#{book.author}'"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'There\'s no one here ATM!'
    else
      @people.each do |person|
        puts "Name: #{person.name} Age: #{person.age} ID: #{person.id}"
      end
    end
  end

  def create_person
    puts 'Are you a:'
    puts '1 - Student'
    puts '2 - Teacher'
    person_input = gets.chomp.to_i

    case person_input
    when 1 then create_student
    when 2 then create_teacher
    else
      raise 'Please enter a valid option, number 1 or 2'
    end
  end

  def create_student
    puts 'What is your name?'
    name = gets.chomp
    puts 'How old are you?'
    age = gets.chomp.to_i
    puts 'What grade are you?'
    classroom = gets.chomp
    puts 'Do you have your parents\' permission? [Y/N]'
    parent_permission = gets.chomp
    student = Student.new(name, age, classroom, parent_permission: parent_permission)
    @people << student
    puts 'Student successfully created'
  end

  def create_teacher
    puts 'What is your name?'
    name = gets.chomp
    puts 'How old are you?'
    age = gets.chomp.to_i
    puts 'Enter your specialization'
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    puts 'Teacher Successfuly created'
  end

  def create_rental
    return puts 'There are no books in the library.' if @books.empty?
    return puts 'There are no people in the system.' if @people.empty?

    book = select_book
    return puts 'Invalid book selection.' if book.nil?

    person = select_person
    return puts 'Invalid person selection.' if person.nil?

    date = input_rental_date
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'The book has been successfully rented!'
  end

  def select_book
    puts 'Select a book by its number:'
    @books.each_with_index do |book, index|
      puts "Number: #{index + 1} - Title: #{book.title}, Author: #{book.author}"
    end
    book_id_input = gets.chomp.to_i
    return nil if book_id_input < 1 || book_id_input > @books.size

    @books[book_id_input - 1]
  end

  def select_person
    puts 'Select the person renting the book by their number:'
    @people.each_with_index do |person, index|
      puts "Number: #{index + 1} - Role: #{person.class.name}, Name: #{person.name}, ID: #{person.id}"
    end
    person_id_input = gets.chomp.to_i

    return nil if person_id_input < 1 || person_id_input > @people.size

    @people[person_id_input - 1]
  end

  def input_rental_date
    puts 'Enter the rental date [yyyy-mm-dd]:'
    gets.chomp
  end

  def list_all_rentals(person_id)
    rentals = @rentals.select { |rental| rental.person.id == person_id }
    if rentals.empty?
      puts 'No rentals found for the given person ID!'
    else
      rentals.each do |rental|
        puts "#{rental.book.title} by #{rental.book.author}, rented on #{rental.date}"
      end
    end
  end
end
