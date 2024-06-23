# frozen_string_literal: true

module ActiveRecord
	class RelationType
		def initialize(model_class)
			@model_class = model_class
		end

		def inspect = "ActiveRecord::Relation(#{@model_class.name})"

		def ===(value)
			case value
			when ActiveRecord::Relation, ActiveRecord::Associations::CollectionProxy, ActiveRecord::AssociationRelation
				@model_class == value.model || value.model < @model_class
			else
				false
			end
		end
	end

	def self.Relation(model)
		RelationType.new(model)
	end
end