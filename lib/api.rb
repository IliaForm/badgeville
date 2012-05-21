class Badgeville::Api
  API_KEY = Kkrails::Application.config.badgeville_api_key
  HOST =    Kkrails::Application.config.badgeville_host
  TIMEOUT = 10

  attr_accessor :site

  def initialize
    @session = Patron::Session.new
    @session.timeout = TIMEOUT
    @session.base_url = "http://#{HOST}/api/berlin/#{API_KEY}"
    @site    = Kkrails::Application.config.badgeville_site
    @site_id = Kkrails::Application.config.badgeville_site_id
  end

  def get(url)
    parse(@session.get(url))
  end

  def post_and_parse(url, data)
    parse(@session.post(url, data))
  end

  def post(url, data)
    @session.post(url, data)
  end

protected

  def parse(response)
    JSON.parse(response.body)
  end

end