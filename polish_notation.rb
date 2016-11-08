def calculate(str)
  array = str.split('')                          

  equation = []                                 
  operators = ['*', '/', '+', '-', '(', ')']

  array.each do |char|                           

    case char
    when *operators
      equation.push(char)
    when /\d+/  
      equation.push(char.to_i)
    end
  end

  equation

  def operator_precedence (op)                    
    case op
    when '+'
      return 1
    when '-'
      return 1
    when '*'
      return 2
    when '/'
      return 2
    when '('
      return 0
    end
  end

  def is_operator? (op)                          
    case op
    when '*'
      return true
    when '/'
      return true
    when '+'
      return true
    when '-'
      return true
    else
      return false
    end
  end

  def convert_to_rpn (op, operator_stack, rpn_output)
    if operator_stack.empty? 
      operator_stack.push(op) 
    elsif op == ')'
      i = 0
      operator_stack.each do |token|
        i = i + 1 

        if is_operator? token
          rpn_output.push(token)
        elsif !is_operator? token
          operator_stack.shift(i)
          break
        end
      end
    elsif operator_precedence(op) > operator_precedence(operator_stack.first)
      operator_stack.unshift(op)
    else operator_precedence(op) == operator_precedence(operator_stack.first)
      rpn_output.push(operator_stack.shift)
      operator_stack.unshift(op)
    end

  end

  operators = ['*', '/', '+', '-']

  operator_stack = []
  rpn_output = []

  equation.each do |op|
    case op
    when Fixnum
      rpn_output.push(op)
    when *operators
      convert_to_rpn(op, operator_stack, rpn_output)
    when '('
      operator_stack.unshift(op)
    when ')'
      convert_to_rpn(op, operator_stack, rpn_output)
    end
  end

  rpn_output.concat(operator_stack)

  def apply_operator (token, stack)
     ops = stack.pop(2)
     result = ops[0].send(token, ops[1])
     stack.push(result)
  end

  stack = []

  rpn_output.each do |token|
    case token
    when Fixnum
      stack.push(token)
    when *operators
      apply_operator(token, stack)
    end
  end

  if stack.length > 1
    finish_res = stack[0].to_s + stack[1].to_s + stack[2].to_s
  else 
    finish_res = stack[0].to_s
  end
  finish_res.to_i
end