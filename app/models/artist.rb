class Artist < ActiveRecord::Base
  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy

  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false

  def self.search(name)
    artists_by_name(name).map(&:songs).flatten
  end

  def self.artists_by_name(name)
    Artist.where(name: name.downcase)
  end

  def print_name
    name.split(' ').map(&:capitalize).join(' ')
  end

  def lowercase_name
    name.downcase
  end
end
