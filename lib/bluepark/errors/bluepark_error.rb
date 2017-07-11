class BlueparkError < StandardError
  def initialize(msg = 'Some error occurred')
    super(msg)
  end
end
