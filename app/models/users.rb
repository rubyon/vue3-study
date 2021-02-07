# User
class User < Sequel::Model
  def to_api
    {
      id: id,
      name: name,
      email: email
    }
  end
end
