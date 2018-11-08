describe 'POST /movies' do

    describe 'status 200' do
        before(:context) do
            MovieModel.destroy_all
        end

        it 'create a new movie' do
            request = {
                title: 'Velozes e Furiosos',
                year: 2017
            }
            post '/api/movies', request.to_json
            expect_status(201)
        end
    end
    
    describe 'status 400' do
        it 'title is required' do
            request = {
                title: '',
                year: 2017
            }
            post '/api/movies', request.to_json
            expect_status(400)
            expect(json_body[:errors][:title].first).to eql 'Title is required.'
        end

        it 'year is number' do
            request = {
                title: 'Vingadores',
                year: "abc"
            }
            post '/api/movies', request.to_json
            expect_status(400)
            expect(json_body[:errors][:year].first).to eql 'Year is not integer.'
        end
    end
end