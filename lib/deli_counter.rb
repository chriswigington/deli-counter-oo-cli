class DeliCounter
  def initialize
    @line = []
  end

  def take_a_number
    puts "Please enter customer's name: "
    name = gets.chomp
    @line << name
    number = @line.length
    puts "Welcome, #{name}. You are number #{number} in line."
  end

  def line
    if @line.length > 0
      string = "The line is currently:"
      spot = 1
      @line.each do |name|
        string << " #{spot}. #{name}"
        spot += 1
      end
    else
      string = "The line is currently empty"
    end
    puts string
  end

  def now_serving
    if @line.length > 0
      name = @line.shift
      puts "Currently serving #{name}"
    else
      puts  "There is nobody waiting to be served!"
    end
  end
  
  def help
    puts "  I accept the following commands:"
    puts "- help : displays this help message"
    puts "- line : displays a list of those currently in line"
    puts "- name : add the name of the next customer to the line"
    puts "- next : display next customer to be served and remove them from line"
  end
  
  def empty?
    @line.length == 0
  end
  
  def run
    help
    
    puts "Please enter a command:"
    response = gets.chomp
    
    until response == "exit" && empty?
      if response == "help"
        help
        response = gets.chomp
      elsif response == "line"
        line
        response = gets.chomp
      elsif response == "name"
        take_a_number
        response = gets.chomp
      elsif response == "next"
        now_serving
        response = gets.chomp
      elsif response == "exit"
        puts "There are still customers in line."
        response = gets.chomp
      else
        puts "Please enter a valid command:"
        response = gets.chomp
      end
    end
  
  end
end