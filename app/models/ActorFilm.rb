class ActorFilm < ActiveRecord::Base
    belongs_to :film
    belongs_to :actor
end
