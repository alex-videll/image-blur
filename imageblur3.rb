class Image
	def initialize(image)
		@image = image
	end

	def output_image
		@image.each do |row|
			puts row.join(" ")
		end
	end

	def manhattan_blur(distance = 1)
		distance.times do
			blur_image
		end
	end


	def blur_image
		blur_image = []
		pixel = []
		@image.each_with_index do |row, y|
			@image.each_with_index do |col, x|
				if @image[y][x] == 1
					pixel << [y, x]
				end
			end
		end

		pixel.each_with_index do |p, i|
			if p[0] > 0
				@image[p[0]-1][p[1]] = 1
			end

			if p[0] < @image.length - 1
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
	  	[0, 0, 0, 0],
	])


	image.manhattan_blur(2)
	image.output_image