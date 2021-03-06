class Dilemma < ActiveRecord::Base

  has_attached_file :option1, :styles => { :large => "600x600", :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  crop_attached_file :option1, :aspect => "4:5"
  validates_attachment_content_type :option1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :option2, :styles => { :large => "600x600", :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  crop_attached_file :option2, :aspect => "4:5"
  validates_attachment_content_type :option2, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  validates :option1, presence: true
  validates :option2, presence: true

  has_many :votes,
            -> { extending WithUserAssociationExtension },
            dependent: :destroy

end
