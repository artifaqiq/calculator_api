class CalculatorController < ApplicationController
  def show

    if !request.parameters.key? 'expression'
      result = 'no parameters \'expression\''
      puts("no parameters expression")
    elsif !!(request.parameters['expression'] =~ /^[^a-zA-z]+$/) == false
      result = 'incorrect expression'
      puts("bad expression (regexp)")
    else
      begin
        result = eval(request.parameters['expression'])
      rescue SyntaxError
        result = 'incorrect expression'
      end
    end

    puts result

    render json: {
        'result'     => result
    }

  end
end