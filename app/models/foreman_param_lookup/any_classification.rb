class AnyClassification < Classification
  def initialize args = { }
    super args
    @classes = args[:classes]
  end

  private

  def puppetclass_ids
    @classes.map {|c| c.id}
  end
end
