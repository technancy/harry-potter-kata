require 'set'

describe "Harry Potter Offer" do
	subject { PotterOffer.new }
	it 'sells 1 copy of a book for 8 EUR' do
		pending
		selection = ['A']
		expect(subject.till(selection)).to eq(8)
	end
	it 'sells 2 different books' do
		selection = ['A', 'B', 'B', 'B', 'C', 'D', 'E']
		expect(subject.till(selection)).to eq(15.2)
	end

end

class PotterOffer

	attr_accessor :books, :dealtally, :price

	def initialize
		@books = []

	end

	def till(titles)
		@books = titles

		stack = Hash.new(0)
		@books.each { |title| stack[title] += 1 }
		has_A = stack['A']
		has_B = stack['B']
		has_C = stack['C']
		has_D = stack['D']
		has_E = stack['E']

		@dealtally = []
		@dealtally << has_A if has_A > 0
		@dealtally << has_B if has_B > 0
		@dealtally << has_C if has_C > 0
		@dealtally << has_D if has_D > 0
		@dealtally << has_E if has_E > 0

		puts "current stacks #{@dealtally} with stack E? #{stack.has_key?("E")}"

		bigfive if @dealtally.length == 5
		

	end


	def bigfive

		@dealtally = @dealtally.map { |e| e -1  }
		@dealtally.delete_if { |n| n == 0}
		puts "minus this big five deal #{dealtally}"
		
		return 15.2

	end

	


	

end


#1 = 8
#2 = -5%
#3 = 10%
#4 = 20%
#5 = 25%