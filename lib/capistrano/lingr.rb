require 'net/http'
require 'digest/sha1'
require 'capistrano'
require 'capistrano/lingr/version'

class Capistrano::Lingr

  def self.load_into(configuration)
    configuration.load do
      namespace :notify do
        desc 'Send a notification of deploy to Lingr'
        task :lingr do
          Capistrano::Lingr.new(configuration).notification
        end
      end
    end
  end
 
  HOST = 'lingr.com'
  
  def initialize(capistrano)
    @cap = capistrano
  end

  def notification
    Net::HTTP.start(HOST, 80) do |http|
      http.get("/api/room/say?bot=#{bot_id}&bot_verifier=#{verifier}&room=#{room_id}&text=#{URI.escape(text)}")
    end
  end

  private

  def application 
    @cap.application
  end

  def room_id
    @cap.lingr_config[:room_id]
  end

  def bot_id
    @cap.lingr_config[:bot_id]
  end

  def verifier
    Digest::SHA1.hexdigest(@cap.lingr_config[:bot_id] + @cap.lingr_config[:secret])
  end
  
  def text
    if @cap.lingr_config[:text] 
      @cap.lingr_config[:text]
    else
      "#{application} is deployed by #{git_user}"
    end
  end

  def git_user
    `git config --get user.name`.strip
  end

end

if Capistrano::Configuration.instance
  Capistrano::Lingr.load_into(Capistrano::Configuration.instance)
end
