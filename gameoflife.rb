class Cell
	attr_accessor :state

	def initialize(state="dead")
		@state=state
	end
end

class Board
	attr_reader :m ,:n

	def initialize(m,n)
		@board=[]
		@m=m
		@n=n
		temp=[]
		(1..n).each{temp << Cell.new}
		(1..m).each{@board << temp}
		self.get_livecells
	end
	def get_livecells
		puts "Pls enter no of cells you wish to change \n"
		r=gets.chomp.to_i
		(1..r).each{self.change}
	end
	def change
		puts "Enter the co-ordinates for live cells \n"
		x=gets.chomp.to_i
		y=gets.chomp.to_i
		@board[x][y].state="live"
	end
end
#b=Board.new(4,3)

class Emulate
	def initialize(board)
		@board=board
	end
	def live_nieghbours(x,y)
		count=0
		(x-1..x+1).each do |p|
			(y-1..y+1).each do |q|
				count +=1 if @board[p][q]== "live"
			end
		end
		count
	end
	def start_emulation
		m=@board.m
		n=@board.n
		(1..m).each do |p|
			(1..n).each do |q|
				livecells=live_nieghbours(p,q)
				#self.change(@board[p][q],livecells)
			end
		end
	end
	def live_change(cell,livecount)
		deadcount=8-livecount
		if (0...2).include?livecount
			cell.state="dead"
		end
		if (2...3).include?livecount
			cell.state="live"
		end
		if livecount>3
			cell.state="dead"
		end
	end
end

