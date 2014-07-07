def new_user(attributes = {})
  defaults = {
    first_name: 'Sue',
    last_name: 'Example',
    email: 'sue@sue.com',
    password: 'password',
  }
  User.new(defaults.merge(attributes))
end

def create_user(attributes = {})
  user = new_user(attributes)
  user.save!
  user
end