class Badgeville::Player

  attr_reader :id

  def initialize(user, api)
    @user = user
    @api  = api
  end

  def id
    @id ||= get_or_create
  end

protected

  def get_or_create
    @id = get
    @id = create unless @id
    @id
  end

  def get
    response = @api.get("/players.json?site=#{@api.site}&email=#{@user.email}")
    return nil if response['data'].empty?
    response['data'][0]["id"]
  end

  def create
    response = @api.post_and_parse('/players.json', "email=#{@user.email}&site=#{@api.site}")
    response['_id']
  end
end