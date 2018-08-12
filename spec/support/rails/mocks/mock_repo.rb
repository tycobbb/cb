# frozen_string_literal: true
class MockRepo
  def initialize
    @id = 0
    @data = {}
  end

  # contract
  def instance(id, attrs)
    raise NotImplementedError, 'subclasses of `MockRepo` must implement `instance`'
  end

  # crud
  def get(id)
    data[id]
  end

  def build(**kwargs)
    id = next_id
    result = instance(id, kwargs)
    result.id = id
    data[id] = result
    result
  end

  private

  def next_id
    result = id
    @id += 1
    result
  end

  attr_reader :id, :data
end
