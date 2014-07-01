class Post < ActiveRecord::Base
	belongs_to :board
	validates_presence_of :content
	validates_length_of :author, :minimum => 1 

	validate :content_name_classify

	private

	def content_name_classify
		if content.first != author.first.upcase
			errors[:content] << "字首要大寫"
	  end
	end

end
