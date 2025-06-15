require 'pagy/extras/bootstrap'
require 'pagy/extras/overflow'
require 'pagy/extras/i18n'

Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT[:limit] = 20
Pagy::DEFAULT[:size]  = 10