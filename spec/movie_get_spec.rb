describe 'GET /movies' do
    it 'return a movie' do
        get '/api/movies/5be3329188fb1f075ca34cea'
        expect_status(200)
        expect(json_body[:title]).to eql 'Velozes e Furiosos'
    end

    it 'movie not found' do
        get '/api/movies/5be3329188fb1f075ca34ce4'
        expect_status(404)
        expect(json_body).to eql(message: 'Movie Not Found!')
    end
end