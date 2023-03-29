require './app'
require './menu'

class LibraryApp
  def initialize
    @app = App.new
    @menu = Menu.new(@app)
  end

  def run
    puts 'Welcome to the OOP School Library App'
    puts
    @menu.run
  end
end

LibraryApp.new.run
