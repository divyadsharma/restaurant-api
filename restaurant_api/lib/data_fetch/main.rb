require 'rest_client'
require 'socket'

module DataFetch
  module Main
    def self.fetch_restaurants
      res = File.read("#{Rails.root}/public/sample_data.json")
      res = ActiveSupport::JSON.decode(res)
      return res
    rescue Exception => e
      Rails.logger.info 'Bad Request' + e.message
      return
    end
  end
end
