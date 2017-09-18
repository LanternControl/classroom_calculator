# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  grade_hash[student][assignment_num-1]

end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  new_array = []
  grade_hash.map do |name, assignment|
    new_array << assignment[assignment_num-1]
  end
   new_array
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  average = 0
  grade_hash.map do |name, assignment|

    #why do I have to put average after =
    #2nd edit, because you're setting the first one as a var disphit
    average = average + assignment[assignment_num-1]
  end
  average = average / grade_hash.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  grade_hash.transform_values {|x| x.reduce(0,:+)/(x.length)}
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  # if (0..59).include?(score)
  #    puts "F"
  # elsif (60..69).include?(score)
  #    puts "D"
  # elsif (70..79).include?(score)
  #    puts "C"
  # elsif (80..89).include?(score)
  #    puts "B"
  # else
  #    puts "A"
  # end
  if score >= 90
    return "A"
  elsif score >= 80
    return "B"
  elsif score >= 70
    return "C"
  elsif score >= 60
    return "D"
  else
    return "F"
  end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  avs = averages(grade_hash).map do |key, value|
    value = letter_grade(value)
    [key,value]
   end
   avs.to_h
end

# Return the average for the entire class.
def class_average(grade_hash)
  average = grade_hash.map do |x, y|
    y.reduce(0, :+).to_i / y.size
  end
  average.reduce(0, :+).to_i / average.size
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  averages(grade_hash)
      .to_a
      .sort_by { |student| -student[1] }
      .map { |student| student[0] }
end
