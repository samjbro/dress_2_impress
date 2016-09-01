class Dilemma < ActiveRecord::Base
  has_attached_file :option1, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_content_type :option1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :option2, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates_attachment_content_type :option2, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  validates :option1, presence: true
  validates :option2, presence: true

end
