require 'faker'

describe 'GET /movies/:id' do
    describe 'status 200' do
        before(:context) do
            @req = { title: 'Batman Cavaleiro das Trevas', year: 2010 }
            post '/api/movies', @req.to_json
            @id_livro_valido = json_body[:id]
        end
    
        it 'return a unique movie' do
            get '/api/movies/' + @id_livro_valido
            expect_status(200)
            expect_json_types(title: :string, year: :integer)
            expect_json(title: @req[:title], year: @req[:year])
        end
    end

    describe 'status 400' do
        it 'movie not found' do
            get '/api/movies/' + Faker::Number.hexadecimal(25)
            expect_status(404)
            expect(json_body).to eql(message: 'Movie Not Found!')
        end
    end
end

describe 'GET /movies' do

    describe 'status 200' do
        before(:context) do
            5.times do
                req = { 
                    title: Faker::Movie.quote, 
                    year: Faker::Number::between(1990, 2018) 
                }
                post '/api/movies', req.to_json
            end
        end

        it 'return a list of movies' do
            get '/api/movies'
            expect_status(200)
            expect_json_types('*', title: :string, year: :integer)
        end
    end

end