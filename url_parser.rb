class UrlParser

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
		if @url.split('//')[1].split('/')[1][0] == "?"
			nil
		else
			@url.split('//')[1].split(':')[1].split('/')[1].split('?')[0]
		end
	end

	def query_string
		hash = Hash.new
		if @url.include?('?q=')
			query = @url.split('?')[1].split('#')[0]
			key_value = query.split('&')
			key_value.each do |element|
				item = element.split('=')
				hash[item[0]] = item[1]
			end
		else
			return nil
		end
		hash
	end

	def fragment_id
		@url.split('#')[1]
	end















end