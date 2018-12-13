class BottleCreator
  def initialize(params)
    @params = params
    @number = @params[:purchased] || 1
  end

  def save
    bottle = Bottle.new(
      name:       @params[:name],
      vintage:    @params[:vintage],
      purchased:  @number,
      stored:     @number,
      color:      @params[:color],
      family:     @params[:family],
      sparkling:  @params[:sparkling] || false,
      grapes:     @params[:grapes],
      purchase_date:      @params[:purchase_date],
      purchase_occasion:  @params[:purchase_occasion],
      offerer:            @params[:offerer],
      description:        @params[:description],
      taste_description:  @params[:taste_description],
      recipes_sample:     @params[:recipes_sample]
    )
    return false unless bottle.valid?
    @number.times { bottle.dup.save }
    true
  end
end
