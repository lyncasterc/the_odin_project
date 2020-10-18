# frozen_string_literal: true

class ApplicationError
  def display_error
    puts 'Error!'
  end
end

# SuperBadError is inherting from Application Error
class SuperBadError < ApplicationError
  def display_error
    puts 'HOLY SHITBALLS'
    super() # "Error"
  end
end

# overriding class parent methods by defining method of same name in derived class

# super() - gives access to the orignal method
err = SuperBadError.new

err.display_error

class Message
  @@messages_sent = 0

  def initialize(from, to)
    @from = from
    @to = to
    @@messages_sent += 1
  end
end

my_message = Message.new('Emilia', 'Me')

class Email < Message
  def initialize(subject, from, to)
    @subject = subject
    super(from, to) # inherits from and to from parent class
  end
end

my_email = Email.new('me', 'Emilia', 'Babos')
