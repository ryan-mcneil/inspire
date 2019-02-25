class RecommendationFacade

  def initialize(user)
    @user = user
  end

  def exists?
    rec
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
      random_interest = @user.interests.sample
      service = TastediveService.new(random_interest.name)
      service.get_recommendation
    end
  end

end
