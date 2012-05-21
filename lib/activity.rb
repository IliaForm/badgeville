class Badgeville::Activity

  NAMES = ['comment on deal', 'viewdeal', 'buydeal', 'login', 'addtocart']


  def initialize(name, player, api)
    raise unless NAMES.include?(name)
    @name = name
    @api  = api
    @player = player
  end

  def save
    @api.post('/activities.json', "activity[verb]=#{@name}&player_id=#{@player.id}").status == 201
  end


end