class Image
	def initialize(image)
		@image = image
	end

	def output_image
		@image.each do |row|
			puts row.join(" ")
		end
	end

	def blur_image
		blur_image = []
		pixel = []
		@image.each_with_index do |row, y|
			@image.each_with_index do |col, x|
				# puts "#{y}, #{x} = #{@image[y][x]}"
				if @image[y][x] == 1
					pixel << [y, x]
				end
			end
		end

		pixel.each do |p|
			if p[0] > 0
				@image[p[0]-1][p[1]] = 1
			end

			if p[0] < @image.length
				@image[p[0]+1][p[1]] = 1
			end

			if p[1] > 0
				@image[p[0]][p[1]-1] = 1
			end

			if p[1] < @image[0].length-1
				@image[p[0]][p[1]+1] = 1
			end
		end
	end

end

	image = Image.new([
		[0, 0, 0, 0],
	  	[0, 1, 0, 0],
	  	[0, 0, 0, 1],
	  	[0, 0, 0, 0] 
	])

	image.blur_image
	image.output_image