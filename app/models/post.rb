class Post < ApplicationRecord
    # belongs_to :user
    validates :title, presence: true
    validates :content, presence: true
    validates :content, length: { minimum: 10}
    scope :published_posts, -> { where(published: true) }
    delegate :email, to: :user, prefix: true
    before_save :publishh
    before_save :format_title
    # def format_title
    #     words = title.split(' ')
    #     capitalized_words = words.map(&:capitalize)
    #     self.title = capitalized_words.join(' ')
    # end
    def format_title
        self.title = title.capitalize
    end
    def publishh
        self.published = true
    end
end
