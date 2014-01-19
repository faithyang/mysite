class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  
  before_save :set_default
  
  protected
  
  def set_default
    self.reads = 0 unless self.reads
  end
  
end
