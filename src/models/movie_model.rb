require 'mongoid'

# Conectar no banco
Mongoid.load! 'mongoid.yaml'

class MovieModel
    include Mongoid::Document
    store_in collection: 'movies'

    field :title, type: String
    field :year, type: Numeric

    validates_presence_of :title, message: 'Title is required.'
    validates_numericality_of :year, message: 'Year is not integer.'

    index({ title: 'text' }, name: 'title_index')
end