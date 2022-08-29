class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_must_be_clickbaity

    def title_must_be_clickbaity
        clickbaits = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        unless clickbaits.any? { |bait| title.to_s.include? bait }
            errors.add(:title, "Title must be clickbaity.")
        end
    end
end
