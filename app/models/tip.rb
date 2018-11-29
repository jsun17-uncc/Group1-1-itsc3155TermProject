class Tip < ApplicationRecord
    
    # can contain many comments for one tip. dependent on destroy
    has_many :comments, dependent: :destroy
    
    # specifies that the title must be present and contain at least five characters or tip will not be accepted
    validates :title, presence: true, length: { minimum: 5 }
    
    # specifies that the name must be present and contain at least two characters or tip will not be accepted
    validates :name, presence: true, length: { minimum: 2 }
    
    # specifies that the text must be populated with characters or numbers and contain at least ten characters or tip will not be accepted
    validates :text, presence: true, length: { minimum: 10 }
end
