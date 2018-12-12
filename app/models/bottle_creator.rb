class BottleCreator
  def initialize(params)
    @params = params
    @number = @params.delete(:number) || 1
    @box_id = Bottle.next_box_id
  end

  def save
    bottle = Bottle.new(
      box_id:     @box_id,
      name:       @params[:name],
      vintage:    @params[:vintage],
      color:      @params[:color],
      family:     @params[:family],
      sparkling:  @params[:sparkling],
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
