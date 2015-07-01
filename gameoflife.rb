class Cell
	attr_accessor :state
	@DEAD="dead"
	@LIVE="live"
	def initialize(state="dead")
		@state=state
	end
end

class Board
	attr_reader :m ,:n
	def initialize(m)
		@board=[]
		@m=m
		@n=m
		temp=[]
		(1..m).each{temp << Cell.new}
		(1..m).each{@board << temp}
	end
	def initialize(m,n)
		@board=[]
		@m=m
		@n=n
		temp=[]
		(1..n).each{temp << Cell.new}
		(1..m).each{@board << temp}
	end
	def get_livecells
		puts "Pls enter no of cells you wish to change \n"
		n=gets.chomp.to_i
		(1..n).each{self.change}
	end
	def change
		puts "Enter the co-ordinates for live cells \n"
		x=gets.chomp.to_i
		y=gets.chomp.to_i
		@board[x][y].state="live"
	end
end

class emulate
	def initialize(board)
		@board=board
	end
end

