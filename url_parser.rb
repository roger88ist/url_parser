class UrlParser
	# attr_accessor :scheme
	def initialize(uri)
		@url = uri
	end

	def scheme
		if @url.include?('https')
			"https"
		elsif @url.include?('http')
			"http"
		else
			"not a valid url"
		end	
	end

	def domain
		@url.split('//')[1].split(':')[0]
	end

	def port
		@url.split('//')[1].split(':')[1].split('/')[0]
	end

	def path
		@url.split('//')[1].split(':')[1].split('/')[1].split('?')[0]
	end

	def query_string
		query = @url.split('//')[1].split(':')[1].split('/')[1].split('?')[1].split('#')[0]
		hash = Hash.new
		query.split('&').each do |element|
			item = element.split("=")
			hash[item[0]] = item[1]
		end
		hash
	end

	def fragment_id
		@url.split('#')[1]
	end





	# expected: {"q" =>"cat", "name"=>"Tim"}










end