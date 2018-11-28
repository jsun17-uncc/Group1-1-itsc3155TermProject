class Tip < ApplicationRecord
    
    # can contain many comments for one tip
    has_many :comments, dependent: :destroy
    
    # specifies that the title must be present and contain at least five characters
    validates :title, presence: true, length: { minimum: 5 }
    
    # specifies that the name must be present and contain at least two characters
    validates :name, presence: true, length: { minimum: 2 }
    
    # specifies that the text must be populated and contain at least ten characters
    validates :text, presence: true, length: { minimum: 10 }
end
