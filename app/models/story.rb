class Story < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates_presence_of :content, presence: :true
  validates_presence_of :title, presence: :true
  
  def self.story_search(input)
    found_stories_title = []
    found_stories_content = []
    Story.all.each do |s|
      if s.title.match(input) != nil
        found_stories_title << s
      end
      content_by_word = s.content.split(" ")
      content_by_word.each do |word|
        if word.match(input) != nil
          found_stories_content << s
        end
      end
    end
    found_stories_title + found_stories_content
  end
end
