class House < ActiveRecord::Base
    belongs_to :house
    belongs_to :category
    has_many :reviews
    
    def self.ratings 
        ['Vestal','Binghamton','Downtown','Endicott']
    end
end