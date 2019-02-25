class RecommendationFacade

  def initialize(user)
    @user = user
  end

  def rec
    conn = Faraday.new(url: "https://tastedive.com")
    results = conn.get "/api/similar?q=Red Hot Chili Peppers&info=1" do |req|
      req.body = { "k": ENV['TASTEDIVE_API_KEY']}
    end
    JSON.parse(results.body, symbolize_names: true)
  end

  def rec_name
    rec[:Similar][:Results][0][:Name]
  end

  def rec_type
    rec[:Similar][:Results][0][:Type].capitalize
  end

  def rec_teaser
    rec[:Similar][:Results][0][:wTeaser]
  end

end
