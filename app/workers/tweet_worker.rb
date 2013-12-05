class TweetWorker
  include Sidekiq::Worker

  def perform(movie_id, user_id)
  puts 'tweet'
  'TWEET'
  end
end