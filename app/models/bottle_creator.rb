class BottleCreator
  DEFAULT_SPARKLING = false
  DEFAULT_PURCHASED = 1

  def initialize(params)
    @params = params
    @number = @params[:purchased] || DEFAULT_PURCHASED
    @bottle = bottle_sample
  end

  def save
    return unless valid?
    @bottle.save
    true
  end

  def valid?
    @bottle.valid?
  end

  def errors
    @bottle.errors
  end

  def id
    @bottle.id
  end

  private

  def bottle_sample
    Bottle.new(
      name:       @params[:name],
      vintage:    @params[:vintage],
      purchased:  @number,
      stored:     @number,
      color:      @params[:color],
      family:     @params[:family],
      sparkling:  @params[:sparkling] || DEFAULT_SPARKLING,
      grapes:     @params[:grapes],
      purchase_date:      @params[:purchase_date],
      purchase_occasion:  @params[:purchase_occasion],
      offerer:            @params[:offerer],
      description:        @params[:description],
      taste_description:  @params[:taste_description],
      recipes_sample:     @params[:recipes_sample]
    )
  end
end
