class TastediveService

  def initialize(interest)
    @interest = interest
  end

  def get_recommendation
    recs = JSON.parse(results.body, symbolize_names: true)
    randomize_results(recs)
  end

  private

  def randomize_results(recs)
    recs[:Similar][:Results].sample
  end

  def conn
    Faraday.new(url: "https://tastedive.com")
  end

  def results
    conn.get "/api/similar" do |req|
      req.params = params
      req.body = { "k": ENV['TASTEDIVE_API_KEY']}
    end
  end

  def params
    {
      q: @interest,
      info: 1
    }
  end
end