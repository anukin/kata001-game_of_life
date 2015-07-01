require 'pry'
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
#working till here
class Emulate
	attr_reader :board
	def initialize(board)
		@board=board
	end
	def live_nieghbours(x,y)
		count=0
		(x-1..x+1).each do |p|
			(y-1..y+1).each do |q|
				count +=1 if @board[p][q].state== "live"
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
				curr_state=@board[p][q].state
				curr_cell=@board[p][q]
				if curr_state == "live"
					self.live_change(curr_cell,livecells)
				else
					self.dead_change(curr_cell,livecells)
				end
			end
		end
		p=Print.new(@board)
		p.print
	end
	def live_change(cell,livecount)
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
	def dead_change(cell,livecount)
		cell.state ="live" if livecount ==3
	end
end

class Print
	def initialize(board)
		@board=board
	end
	def print
		m=@board.m
		n=@board.n
		(1..m).each do |x|
			(1..n).each do |y|
				puts "||#{@board[x][y].state}||"
			end
			puts "\n"
		end
	end
end
b=Board.new(3,4)
b.get_livecells
e=Emulate.new(b)
e.start_emulation

