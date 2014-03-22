class Film < ActiveRecord::Base
    has_and_belongs_to_many :actors

    validates :name, uniqueness: true, presence: true
    validates :description, presence: true
    validates :actor_ids, presence: true

    mount_uploader :picture, PictureUploader

    def self.search(search)
      search_condition = "%" + search + "%"
      find(:all, :conditions => ['name LIKE ?', search_condition])
    end
end
