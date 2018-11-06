class Tip < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :name, presence: true, length: { minimum: 2 }
    validates :text, presence: true, length: { minimum: 10 }
end
