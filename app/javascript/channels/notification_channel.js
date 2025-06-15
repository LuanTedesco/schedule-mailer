import consumer from './consumer'

consumer.subscriptions.create('NotificationChannel', {
  received(data) {
    if (Notification.permission === 'granted') {
      new Notification(data.title, {
        body: data.content,
        icon: '/assets/favicon.png',
        data: {
          url: data.link
        }
      }).onclick = event => {
        event.preventDefault()
        window.open(event.target.data.url, '_blank')
      }
    }
  }
})
