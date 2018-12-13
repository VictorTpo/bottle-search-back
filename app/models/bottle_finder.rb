class BottleFinder
  attr_reader :results, :total, :remaining_count, :bottles_count

  def initialize(params)
    @params = params
    @results = []
  end

  def call
    @search           = Bottle.where(sql_query_search).where(hash_search)
    @total            = @search.count
    @remaining_count  = @search.remaining.count
    @bottles_count    = @search.remaining.sum(&:stored)
  end

  private

  def sql_query_search
    return unless @params[:text].present?
    text_fields = %w(description grapes offerer purchase_occasion recipes_sample
                     taste_description name)
    q = []
    text_fields.each do |field|
      q << "#{field} LIKE '%#{@params[:text]}%'"
    end
    q.join(' OR ')
  end

  def hash_search
    q = {}
    basic_fields = %i(vintage color sparkling full)
    basic_fields.each do |field|
      q.merge!(field => @params[field]) if @params[field].present?
    end
    q
  end
end
