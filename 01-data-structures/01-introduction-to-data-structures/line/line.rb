class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members.push(person)
  end

  def leave(person)
    self.members.delete(person)
  end

  def front
    self.members.first
  end

  def middle
    mid = (self.members.length) / 2
  end

  def back
    self.members.last
  end

  def search(person)
    if self.members.include?(person)
      person
    end
  end

  private

  def index(person)
    self.members.index(person)
  end

end
