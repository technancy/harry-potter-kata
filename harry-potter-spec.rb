require 'set'

describe "Harry Potter Offer" do
	subject { PotterOffer.new }
	it 'sells 1 copy of a book for 8 EUR' do
		selection = ['A']
		expect(subject.till(selection)).to eq(8)
	end
	it 'sells 2 different books' do
		selection = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'E']
		expect(subject.till(selection)).to eq(51.20)
	end

end

class PotterOffer

	attr_accessor :books, :dealtally, :price, :total

	def initialize
		@books = []
		@price = 8
		@total = 0

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

		puts "stacks #{@dealtally}"

		quintet while @dealtally.length == 5
		quartet while @dealtally.length == 4
		trio while @dealtally.length == 3
		duo while @dealtally.length == 2
		@total = (@total + @price) if @dealtally.length == 1 

		return @total 
	end


	def quintet

		@dealtally = @dealtally.map { |e| e -1  }
		@dealtally.delete_if { |n| n == 0}
		
		deal = (@price * 5)
		discount = (deal * 0.25)
		@total = @total + (deal - discount)	

		puts "quin #{@dealtally} calc: #{deal} - #{discount} = #{@total}"

	end

	def quartet

		@dealtally = @dealtally.map { |e| e -1  }
		@dealtally.delete_if { |n| n == 0}
		
		deal = (@price * 4)
		discount = (deal * 0.20)
		@total = @total + (deal - discount)

		puts "quar #{@dealtally} calc: #{deal} - #{discount} = #{@total}"

	end	

	def trio

		@dealtally = @dealtally.map { |e| e -1  }
		@dealtally.delete_if { |n| n == 0}

		deal = (@price * 3)
		discount = (deal * 0.10)
		@total = @total + (deal - discount)

		puts "trio #{@dealtally} calc: #{deal} - #{discount} = #{@total}"
		
	end	

	def duo

		@dealtally = @dealtally.map { |e| e -1  }
		@dealtally.delete_if { |n| n == 0}

		deal = (@price * 2)
		discount = (deal * 0.05)
		@total = @total + (deal - discount)

		puts "duo #{@dealtally} calc: #{deal} - #{discount} = #{@total}"

	end	

end
