Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Allow localhost in CORS
    origins /(http:\/\/)((localhost:)|(127.0.0.1:))/

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
