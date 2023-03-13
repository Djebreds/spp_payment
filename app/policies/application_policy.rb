# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :enitity, :record

  def initialize(enitity, record)
    @enitity = enitity
    @record = record
  end
end
