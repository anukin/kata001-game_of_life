class Cell
	attr_accessor :state
	@DEAD="dead"
	@LIVE="live"
	def initialize(state="dead")
		@state=state
	end
end

class Board
	def initialize(m)
		@board=[]
		temp=[]
		(1..m).each{temp << Cell.new}
		(1..m).each{@board << temp}
	end
end