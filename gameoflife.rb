class Cell
	attr_accessor :state
	@DEAD="dead"
	@LIVE="live"
	def initialize(state="dead")
		@state=state
	end
end
