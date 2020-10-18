# frozen_string_literal: true

class Computer
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts 'New file created.'
  end

  def self.get_users
    @@users
  end
end

me = Computer.new('sc', '1234')

me.create('boop.txt')
puts Computer.get_users
