class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :click_baity


    def click_baity
        unless title.include?(/Won't Believe/i,/Secret/i,/Guess/i,/Top \d/i)
            self.errors.add(:title, "This is spammy")
        end
    end

# could not figure this out

    # def click_baity
    #     unless title.match?(/Won't Believe/i,/Secret/i,/Guess/i,/Top \d/i)
    #         errors.add(:title, message: "Not click baity")
    #     end
    # end
end
