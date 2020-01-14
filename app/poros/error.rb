class Error
  attr_reader :id

  def initialize(user)
    @id = nil
    @user = user
  end

  def failed
    @user.errors
  end
end
