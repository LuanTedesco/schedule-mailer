# frozen_string_literal: true

require "rails_helper"

RSpec.configure do |config|
  config.swagger_root = Rails.root.join("swagger").to_s

  config.swagger_docs = {
    "v1/swagger.json" => {
      openapi: "3.0.1",
      info: {
        title: "API V1",
        version: "v1",
      },
      paths: {},
      servers: [
        {
          url: "http://localhost:3000",
          variables: {
            defaultHost: {
              default: "localhost:3000",
            },
          },
        },
      ],
    },
  }

  config.swagger_format = :json
end
