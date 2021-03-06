class Product < ActiveRecord::Base
	has_many :line_items
	
	def self.find_product_title
		find(:all, :order => "title" )
	end
	
	
	validates_presence_of :title, :description, :image_url, :price
	validates_numericality_of :price, :message => "triabva da e cifri"
	validate :price_must_be_at_least_a_cent
	validates_uniqueness_of :title
	validates_format_of :image_url,
						:with => %r{\.(gif|jpg|png)$}i,
						:message => 'must be a URL for GIF, JPG ' +
						'or PNG image.'
	validates_length_of :title, :minimum => 10, :message => "at least 10 characters" 					
						
	protected #------------------------
		def price_must_be_at_least_a_cent
		errors.add(:price, 'should be at least 0.01' ) if price.nil? ||
						price < 0.01
	end
end
