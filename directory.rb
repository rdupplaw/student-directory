$COLUMN_WIDTH = 50

def input_students
  # create an empty array
  students = []

  continue = true
  while continue do
    # get the first name
    puts "Please enter the name of this student"
    name = gets.chomp
    while name.empty? do
      puts "Please enter a valid name"
      name = gets.chomp
    end
    # get the cohort
    puts "Please enter the cohort for this student"
    cohort = gets.chomp
    while cohort.empty? do
      puts "Please enter a valid cohort"
      cohort = gets.chomp
    end

    student = {
      name: name,
      cohort: cohort.to_sym
    }

    students << student

    puts "Continue? y/n"
    continue = gets.chomp
    while continue != "y" && continue != "n"
      puts "Please enter y or n"
      continue = gets.chomp
    end
    continue = continue == "y"
  end

  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center($COLUMN_WIDTH)
  puts "--------------".center($COLUMN_WIDTH)
end

def print(students)
  filter_char = "H"
  cohorts = students.reduce([]) do |acc, student|
    acc.push(student[:cohort]) 
  end

  cohorts.each do |cohort|
    puts "Cohort: #{cohort}".center($COLUMN_WIDTH)
    students.each do |student|
      puts student[:name].center($COLUMN_WIDTH) if student[:cohort] == cohort
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{"s" if students.count > 1}".center($COLUMN_WIDTH)
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
