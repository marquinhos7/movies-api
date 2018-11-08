# Serializers
class MovieSerializer
    def initialize(movie)
        @movie = movie
    end

    def as_json(*)
        data = {
            id: @movie.id.to_s,
            title: @movie.title,
            year: @movie.year
        }
        data[:errors] = @movie.errors if @movie.errors.any?
        data
    end
end