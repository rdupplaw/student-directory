@students = []

def interactive_menu
  loop do
    print_menu
    process_choice(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def process_choice(choice)
  case choice
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students(input_filename)
  when "4"
    load_students(input_filename)
  when "9"
    exit 
  else
    puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
  puts "Successfully added students."
end

def save_students(filename)
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Successfully saved students to students.csv"
end

def input_filename
  puts "Enter filename"
  gets.chomp
end

def load_students(filename = "students.csv")
  if File.exists?(filename)
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_student(name, cohort.to_sym)
    end
    file.close
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "File does not exist"
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort}
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
    return if !File.exists?(filename)
    load_students(filename)
  elsif File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
