import '@hotwired/turbo-rails'
import * as bootstrap from 'bootstrap'
window.bootstrap = bootstrap
import './controllers'
import './jquery'
import './channels'
import './custom/custom'
import { Application } from '@hotwired/stimulus'

const application = Application.start()
