class CalculatorController < ApplicationController
  def show

    if !request.parameters.key? 'expression'
      result = 'ClientApplicationError: no parameters \'expression\''
      status = 'error'
      puts("no parameters expression")
    elsif !!(request.parameters['expression'] =~ /^[^a-zA-z]+$/) == false
      result = 'Syntax error: incorrect expression'
      status = 'error'
      puts("bad expression (regexp)")
    else
      begin
        result = eval(request.parameters['expression'])
      rescue SyntaxError
        result = 'Syntax error: incorrect expression'
        status = 'error'
      rescue ZeroDivisionError
          result = 'Arithmetic error: division by zero'
          status = 'error'
      else
        status = 'ok'
      end
    end

    puts result

    render json: {
        'result'     => result.to_s,
        'status'     => status
    }

  end
end