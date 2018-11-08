require_relative '../helpers'

namespace '/api' do

    helpers do
        def get_movie
            MovieModel.where(id: params[:id]).first
        end

        def movie_not_found!
            halt(404, {message: 'Movie Not Found!'}.to_json) unless get_movie
        end

        def seri_movie(movie)
            MovieSerializer.new(movie).to_json
        end
    end

    post '/movies' do
        movie = MovieModel.new(json_params)
        halt 400, seri_movie(movie) unless movie.save
        res = {
            id: movie.id.to_s
        }
        halt 201, res.to_json
    end

    get '/movies/:id' do
        movie_not_found!
        seri_movie(get_movie)
    end
end