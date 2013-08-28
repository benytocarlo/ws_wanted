# config/initializers/imgkit.rb
IMGKit.configure do |config|
  config.wkhtmltoimage = Rails.root.join('lib', 'wkhtmltoimage-amd64').to_s
  #IN PADRINO: config.wkhtmltoimage = Padrino.root + '/lib' + '/wkhtmltoimage-amd64' if ENV['RACK_ENV'] == 'production'
end