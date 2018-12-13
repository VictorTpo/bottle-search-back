object @search => :search
attributes :total, :remaining_count, :bottles_count
child :results, object_root: false do
  attributes :id, :name, :vintage, :purchased, :stored, :color, :family,
             :sparkling
end
