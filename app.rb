require './person'
require './book'
require './student'
require './teacher'
require './rental'
require './classroom'
require './nameable'
require './library_management_system'

class App
  def initialize
    @book = []
    @people = []
    @rental = []
  end

  def list_all_books
    @book = load_data('books.json')
    if @book.empty?
      puts 'No books available'
    else
      data = @book.map(&:to_h)
      data.each do |book|
       puts "Title: #{book["title"]}, Author: #{book["author"]}"
      end
    end
  end

  def list_all_people
    @people = load_data('people.json')
    if @people.empty?
      puts 'No people available'
    else
      data = @people.map(&:to_h)
      data.each do |person|
        puts "Name: #{person["name"]}, ID: #{person["id"]}, Age: #{person["age"]}"
      end
    end
  end

  def create_person
    puts 'Do you want to  create a student (1) or a teacher(2)?'
    res = gets.chomp.to_i

    case res
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has Parent permission? [Y/N]: '
    parents_permission = gets.chomp

    student = Student.new(age, name, parents_permission)
    @people.push(student)
    save_data(@people , 'people.json' )
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    save_data(@people, 'people.json' )
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @book << book
    save_data(@book, "books.json")
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @book = load_data("books.json")
    @book.each_with_index do |book, index|
      puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
    end
    rental_book = gets.chomp.to_i
  
    puts 'Select a person from the following list by number'
    @people = load_data("people.json")
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    rental_person = gets.chomp.to_i
  
    print 'Date: '
    date = gets.chomp
  
    rental = Rental.new(date, @book[rental_book], @people[rental_person])
    @rental.push(rental)
    save_data(@rental, 'rental.json')
    puts 'Rental created successfully'
  end

  def list_all_rentals
    @rental = load_data('rental.json')
    print 'ID of person: '
    id = gets.chomp.to_i
    @rental.each do |rental|
      puts "Date: #{rental['date']}, Book: #{rental['book']['title']}, by #{rental['book']['author']}" if id == rental['person']['id']
    end
  end
end
