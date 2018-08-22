# frozen_string_literal: true
class MockRepo
  private_reader :id, :data

  def initialize
    @id = 0
    @data = {}
  end

  # contract
  protected def instance(_id, _attrs)
    raise NotImplementedError, "subclasses of `MockRepo` must implement `instance`"
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

  private def next_id
    result = id
    @id += 1
    result
  end
end
