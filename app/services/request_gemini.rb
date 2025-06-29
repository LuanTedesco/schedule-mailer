class RequestGemini
  def boost_email_body(instruction, email_body_value)
    send_request(instruction, email_body_value)
  end

  def fix_errors_body(instruction, email_body_value)
    send_request(instruction, email_body_value)
  end

  def send_request(instruction, email_body_value)
    url = "#{ENV["GEMINI_URL"]}#{ENV["TOKEN_GEMINI_API"]}"

    headers = {
      content_type: :json,
      accept: :json
    }

    payload = {
      systemInstruction: {
        parts: [
          {
            text: instruction
          }
        ]
      },
      contents: [
        {
          parts: [
            {
              text: email_body_value
            }
          ]
        }
      ]
    }

    response = RestClient.post(url, payload.to_json, headers)
    json = JSON.parse(response.body)

    json.dig("candidates", 0, "content", "parts", 0, "text")
  end
end
