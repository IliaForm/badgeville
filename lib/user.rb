class Badgeville::User

  attr_accessor :email

  def initialize(email, api)
    @email = email
    @api   = api
  end

  def create
    name = @email.split('@')[0]
    @api.post('/users.json', "user[name]=#{name}&user[email]=#{@email}").status == 201
  end

  def player
    @player ||= Player.new(self, @api)
  end

  def add_activity(name)
    Activity.new(name, player, @api).save
  end
end