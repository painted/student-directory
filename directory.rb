#first we print the list of students
students = [
"Roi Discoll",
"James Whyte",
"Margherita Serino",
"Vaidas Mykolaitis",
"Johann Bornman",
"Kate Hamilton",
"James Keap",
"Nic Yeeles",
"Julie Walker",
"Will Allen",
"Julia Tan",
"Federico Maffei",
"Jamie Patel",
"Faezrah Rizalman",
"Josh Fail-Broon",
"Sasha Cooper",
"Nicolai DTH",
"Nadav Matalon",
"Fitsum Teklehaimanot"
]

def print_header
puts "The students of my cohort at Makers Academy"
puts "----------------"
end

def print(names)
	names.each do |name|
	puts name
	end
end
#finally, we print the total

def print_footer(names)
puts "Overall, we have #{names.length} great students"
end

print_header
print(students)
print_footer(students)