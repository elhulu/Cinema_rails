class Actor < ActiveRecord::Base
    has_and_belongs_to_many :films

    validates :first_name, presence: true
    validates :last_name, presence: true

    mount_uploader :picture, PictureUploader

    def self.search(search)
      search_condition = "%" + search + "%"
      find(:all, :conditions => ['first_name LIKE ? OR last_name LIKE ?', search_condition, search_condition])
    end
end
