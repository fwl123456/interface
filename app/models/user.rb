class User
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer
  field :email, type: String
end
