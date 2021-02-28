module ParamParsable
  extend ActiveSupport::Concern

  def parse_params(params)
    params.each do |key, value|
      params[key] = JSON.parse(value)
    end
  end
end