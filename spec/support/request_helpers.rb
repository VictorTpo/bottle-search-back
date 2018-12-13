module RequestHelpers
  def json_body
    @_json_body ||= Oj.load(response.body) || {}
  end
end
