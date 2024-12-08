class Note < ApplicationRecord
  before_validation :trimInput
  validates :title, :body, presence: true, uniqueness: true

  def self.search_by_title(keywords)
    keywords.split.reduce(self) do |acc, word|
      acc.where "title LIKE ? ESCAPE '\\' OR body LIKE ? ESCAPE '\\'", "%#{escape_sql_pattern word}%", "%#{escape_sql_pattern word}%"
    end
  end

  private

  def self.escape_sql_pattern(pattern)
    pattern.gsub(/[%_\\]/, '\\\\\\&')
  end

  def trimInput
    self.title = title.strip unless title.nil?
    self.body = body.strip unless body.nil?
  end
end
