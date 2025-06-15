import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  fetchProgressesForFilter(event) {
    const boardId = event.target.value

    if (!boardId) return

    fetch(`/boards/${boardId}/progresses_for_filter`)
      .then(response => response.text())
      .then(html => {
        document.getElementById("filter-progress-container").innerHTML = html
      })
  }

  fetchProgresses(event) {
    const boardId = event.target.value
    const isFilter = event.target.id.includes('filter_board')
    const progressSelectId = isFilter ? 'filter_progress' : 'task_progress_id'

    this.clearProgressSelect(progressSelectId)

    if (boardId) {
      fetch(`/tasks/fetch_progresses?board_id=${boardId}`, {
        headers: { Accept: 'application/json' }
      })
        .then(response => response.json())
        .then(progresses => {
          this.updateProgressSelect(progressSelectId, progresses)
        })
        .catch(error => console.error('Erro ao buscar progressos:', error))
    }
  }

  clearProgressSelect(progressSelectId) {
    const progressSelect = document.getElementById(progressSelectId)
    if (!progressSelect) return

    if (progressSelect.tomselect) {
      progressSelect.tomselect.clearOptions()
      progressSelect.tomselect.addOption({ value: '', text: 'Selecione' })
      progressSelect.tomselect.refreshOptions(false)
    } else {
      progressSelect.innerHTML = ''
      const promptOption = document.createElement('option')
      promptOption.value = ''
      promptOption.text = 'Selecione'
      progressSelect.appendChild(promptOption)
    }
  }

  updateProgressSelect(progressSelectId, progresses) {
    const progressSelect = document.getElementById(progressSelectId)
    if (!progressSelect) return

    if (progressSelect.tomselect) {
      progresses.forEach(progress => {
        progressSelect.tomselect.addOption({
          value: progress.id,
          text: progress.name
        })
      })
      progressSelect.tomselect.refreshOptions(false)
    } else {
      progresses.forEach(progress => {
        const option = document.createElement('option')
        option.value = progress.id
        option.textContent = progress.name
        progressSelect.appendChild(option)
      })
    }
  }
}
