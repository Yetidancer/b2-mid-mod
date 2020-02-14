class Movie < ApplicationRecord
  validates_presence_of :name, :creation, :genre
  belongs_to :studio
end
