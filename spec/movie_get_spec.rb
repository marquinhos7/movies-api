describe 'GET /movies' do
    describe 'status 200' do
        before(:context) do
            req = { title: 'Batman Cavaleiro das Trevas', year: 2010 }
            post '/api/movies', req.to_json
            @id_livro_valido = json_body[:id]
        end
    
        it 'return a movie' do
            get '/api/movies/' + @id_livro_valido
            expect_status(200)
        end
    end
    
    it 'movie not found' do
        get '/api/movies/5be3329188fb1f075ca34ce4'
        expect_status(404)
        expect(json_body).to eql(message: 'Movie Not Found!')
    end
end