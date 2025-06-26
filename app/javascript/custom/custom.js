document.addEventListener('turbo:load', event => {
  applyTheme()
})

document.addEventListener('DOMContentLoaded', event => {
  applyTheme()
})

document.addEventListener('DOMContentLoaded', function () {
  const passwordToggles = document.querySelectorAll('[data-password]')

  passwordToggles.forEach(toggle => {
    toggle.addEventListener('click', function () {
      const input = this.previousElementSibling
      const isPassword = input.getAttribute('type') === 'password'
      input.setAttribute('type', isPassword ? 'text' : 'password')
      this.setAttribute('data-password', !isPassword)
    })
  })
})

function applyTheme() {
  let localTheme = localStorage.getItem('userTheme')
  const htmlElement = document.documentElement
  let currentTheme = htmlElement.getAttribute('data-bs-theme') || 'light'

  if (localTheme) {
    setTheme(localTheme)
  } else {
    setTheme(currentTheme)
  }

  document
    .getElementById('light-dark-mode')
    .addEventListener('click', toggleTheme)
}

function toggleTheme() {
  const htmlElement = document.documentElement
  let currentTheme = htmlElement.getAttribute('data-bs-theme')

  let newTheme = currentTheme === 'light' ? 'dark' : 'light'
  setTheme(newTheme)

  localStorage.setItem('userTheme', newTheme)
}

function setTheme(theme) {
  const htmlElement = document.documentElement
  const topbarElement = document.querySelector('.navbar-custom')
  const themeIcon = document.getElementById('theme-icon-toggle')

  htmlElement.setAttribute('data-bs-theme', theme)
  htmlElement.setAttribute('data-menu-color', theme)
  htmlElement.setAttribute('data-topbar-color', theme)

  if (theme === 'light') {
    topbarElement.classList.remove('bg-dark')
    topbarElement.classList.add('bg-light')
    themeIcon.classList.replace('ri-sun-line', 'ri-moon-line')
  } else {
    topbarElement.classList.remove('bg-light')
    topbarElement.classList.add('bg-dark')
    themeIcon.classList.replace('ri-moon-line', 'ri-sun-line')
  }
}
