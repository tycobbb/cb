extensions_path = Rails.root.join('lib', 'extensions', '**', '*.rb')

Dir[extensions_path].each do |file|
  require(file)
end
