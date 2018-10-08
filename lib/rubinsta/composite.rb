module Rubinsta
	class Composite
		def initialize(init_actions: [], actions: [], times_to_run: 10)
			@init_actions = init_actions
			@actions = actions
			@times_to_run = times_to_run
		end

		def execute
			init_actions.map { |action| action.execute }
			times_to_run.times do
				actions.map { |action| action.execute }
				sleep 2
			end
		end

		private

		attr_reader :init_actions, :actions, :times_to_run
	end
end
