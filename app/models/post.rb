class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :title_must_contain_click_bait
    
  def title_must_contain_click_bait
    return false if self.title.nil?
    ["Won't Believe", "Secret", "Top", "Guess"].any?{ |bait| self.title.include?(bait) }
  end 
end


