require 'debugger'

@students = []

def interactive_menu
	students = []
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def process(selection)
			case  selection
			when "1"
			students = input_students
			when "2"
			show_students
			when "3"
			save_students
			when "4"
			load_students
			when "9"
			save_students
			exit
			else
			puts "I don't know what you meant, try again"
		end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the students"
	puts "4. Load the list from students.csv"
	puts "9. Save and Exit" #9 because we will add more options
end

def show_students
	print_header
	print_students_list
	print_footer
end

def input_students
	students = []
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	name = STDIN.gets.chomp
	while !name.empty? do
		puts "What are your hobbies?"
		hobbies = STDIN.gets.chomp
		puts "What is your email address"
		email = STDIN.gets.chomp
		puts "What cohort are you in?"
		cohort = STDIN.gets.chomp
		add_student(name, hobbies, email, cohort)
		puts "Now we have #{students.length} students"
		name = STDIN.gets.chomp
	end
end

def print_header
puts "The students of my cohort at Makers Academy"
puts "----------------"
end

def print_students_list
	@students.each do |student, hobbies, email, cohort|
	#   if firstCharacterA? student[:name]
	#	if lessThan12? student[:name]
	#
			puts "#{student[:name]}, #{student[:hobbies]}, #{student[:email]}, (#{student[:cohort]} cohort)"
	#	end
	end
end

def lessThan12? str
	str.length <= 12
end

def firstCharacterA? str
  str.chr == "A"
end 
#finally, we print the total

def print_footer
puts "Overall, we have #{@students.length} great students"
end

def save_students
	file = File.open("students.csv", "a")
	@students.each do |student|
		student_data = [student[:name], student[:hobbies], student[:email], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, hobbies, email, cohort = line.chomp.split(',')
		add_student(name, hobbies, email, cohort)
	end
	file.close
end

def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
end


def add_student(name, hobbies, email, cohort)
	@students << {:name => name, :hobbies => hobbies, :email => email, :cohort => cohort}
end

try_load_students
interactive_menu
