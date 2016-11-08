class Formula
	def initialize current_value = 0, input_value = 0
		@current_value = current_value
		@input_value = input_value
		@expression_array = []
		@output_string = ''
		@expression_array.push @current_value
	end

	def add input_value
		@expression_array.push '+', input_value
		@current_value += input_value
		puts @current_value
	end

	def substract input_value
		@expression_array.push '-', input_value
		@current_value -= input_value
		puts @current_value
	end

	def divide input_value
		@expression_array.unshift '('
		@expression_array.push ')', '/', input_value	
		@current_value /= input_value
		puts @current_value
	end

	def multiply input_value
		@expression_array.unshift '('
		@expression_array.push ')', '*', input_value
		@current_value *= input_value
		puts @current_value
	end	

	def result
		puts @current_value
	end

	def to_str
		@expression_array.each do | char |
			@output_string += char.to_s
		end
		puts @output_string
	end
end

test = Formula.new 5
test.add 10
test.substract 3
test.divide 6
test.add 8
test.multiply 8
test.substract 12
test.divide 2
test.add 7
test.multiply 3
test.result
test.to_str
