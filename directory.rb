$COLUMN_WIDTH = 50

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, 
                 cohort: :november, 
                 hobbies: [], 
                 country_of_birth: "UK", 
                 height: 175
    }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
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
  i = 0
  while i < students.length do
    puts "#{i}. #{students[i][:name]} (#{students[i][:cohort]} cohort)".center($COLUMN_WIDTH) if students[i][:name].chr == filter_char && students[i][:name].length < 12 
    i += 1 
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center($COLUMN_WIDTH)
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
