class CalculatorController < ApplicationController
  def show

    #VALIDATE_EXPRESSION = %r/[a-zA-Z]+/


    if !request.headers.key? 'expression'
      render json: {
         'description' => "no header 'expression'"
      }, :status => :bad_request
      return
    end

    expression = request.headers['expression']
    puts "=================" + expression.to_s + (!!(expression =~ /^[^a-zA-z]$/)).to_s
    if !!(expression =~ /^[^a-zA-z]+$/) == false
      render json: {
          'description' => "bad expression"
      }, :status => :bad_request
      return
    end

    begin
      result = eval(expression)
    rescue SyntaxError
      puts "=+++++++++++++"
      render json: {
          'description' => "bad expression"
      }, :status => :bad_request
      return
    end

    render json: {
        'expression' => expression,
        'result'     => eval(expression)
    }
  end
end
