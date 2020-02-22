require "currency/rate/version"
require "open-uri"
require "json"

module Currency
  module Rate
    class Error < StandardError; end

    def self.get(options = {})
      base = options.fetch(:base).upcase
      symbol = options.fetch(:symbol).upcase
      date = options.fetch(:date).strftime("%Y-%m-%d")

      url = "https://api.ratesapi.io/api/#{date}?base=#{base}&symbols=#{symbol}"

      result = open(url).read

      JSON.parse(result).dig("rates", symbol)
    end
  end
end
