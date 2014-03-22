class SearchController < ApplicationController

	def index
	    @title_for_layout = "Recherche"

		if params[:key] && !params[:key].empty?
			@films = Film.search(params[:key])
			@actors = Actor.search(params[:key])

			@films_match = @films.size > 0 ? true : false
			@actors_match = @actors.size > 0 ? true : false

			@key = params[:key]

			@valid_query = true;
		else
			@valid_query = false;
		end
	end
end
