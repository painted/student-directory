@students = []

def interactive_menu
	students = []
	loop do
		print_menu
		selection = gets.chomp
		case  selection
			when "1"
			students = input_students
			when "2"
			show_students(students)
			when "3"
			save_students(students)
			when "9"
			save_students(students)
			exit
			else
			puts "I don't know what you meant, try again"
		end
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the students"
	puts "9. Save and Exit" #9 because we will add more options
end

def process(selection)

end

def show_students(students)
	print_header
	print_students_list(students)
	print_footer(students)
end

def input_students
	students = []
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		#add the student hash to the array
		students << {:name => name, :cohort => :may}
		puts "Now we have #{students.length} students"
		# get another name from the user
		name = gets.chomp
	end
	students
end

def print_header
puts "The students of my cohort at Makers Academy"
puts "----------------"
end

def print_students_list(students)
	students.each do |student|
	puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end
#finally, we print the total

def print_footer(students)
puts "Overall, we have #{students.length} great students"
end

def save_students(students)
	file = File.open("students.csv", "a")
	students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

interactive_menu
