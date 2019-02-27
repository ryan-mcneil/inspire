class RecommendationFacade

  def initialize(user)
    @user = user
  end

  def error
    rec[:error]
  end

  def rec_name
    rec[:Name]
  end

  def rec_type
    rec[:Type].capitalize
  end

  def rec_teaser
    rec[:wTeaser]
  end

  private

  def rec
    @rec ||= get_rec
  end

  def get_rec
    if @user.interests.any?
      # json = File.read("./app/assets/mock_data/tastedive_response.json")
      # recs = JSON.parse(json, symbolize_names: true)[:Similar][:Results]
      # recs.sample
      random_interest = @user.interests.sample
      service = TastediveService.new(random_interest.name)
      service.get_recommendation
    else
      {error: "Try adding more interests for better recommendations!"}
    end
  end

end
