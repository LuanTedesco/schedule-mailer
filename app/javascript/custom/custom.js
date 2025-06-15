document.addEventListener('turbo:load', event => {
  applyTheme()
})

document.addEventListener('DOMContentLoaded', event => {
  applyTheme()
})

document.addEventListener('DOMContentLoaded', function () {
  const passwordToggles = document.querySelectorAll('[data-password]');

  passwordToggles.forEach(toggle => {
    toggle.addEventListener('click', function () {
      const input = this.previousElementSibling;
      const isPassword = input.getAttribute('type') === 'password';
      input.setAttribute('type', isPassword ? 'text' : 'password');
      this.setAttribute('data-password', !isPassword);
    });
  });
});

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

document.addEventListener(
  'wheel',
  function (event) {
    if (event.ctrlKey) {
      document.querySelector('.kanban').scrollLeft += event.deltaY
    }
  },
  { passive: false }
)

function getLuminance(hex) {
  hex = hex.replace('#', '')

  let r = parseInt(hex.substring(0, 2), 16) / 255
  let g = parseInt(hex.substring(2, 4), 16) / 255
  let b = parseInt(hex.substring(4, 6), 16) / 255

  r = r <= 0.03928 ? r / 12.92 : Math.pow((r + 0.055) / 1.055, 2.4)
  g = g <= 0.03928 ? g / 12.92 : Math.pow((g + 0.055) / 1.055, 2.4)
  b = b <= 0.03928 ? b / 12.92 : Math.pow((b + 0.055) / 1.055, 2.4)

  return 0.2126 * r + 0.7152 * g + 0.0722 * b
}
