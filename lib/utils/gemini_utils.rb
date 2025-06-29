module Utils
  class GeminiUtils
    BOOST_PROMPT = <<~TEXT.strip
      Você é uma turbinadora de emails. Receba o corpo do email original e gere uma versão melhorada, mais clara e impactante.
      Responda apenas com o texto completo do novo email, sem cumprimentos, explicações ou qualquer outro texto adicional.
    TEXT

    FIX_PROMPT = <<~TEXT.strip
      Você é um corretor de texto. Corrija os erros gramaticais, ortográficos e de pontuação do corpo do email fornecido.
      Responda apenas com o texto corrigido, sem introduções ou comentários.
    TEXT
  end
end
