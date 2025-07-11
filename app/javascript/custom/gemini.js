function geminiAction(btn) {
  const textarea = document.querySelector("#email_body");
  const text = textarea.value;

  if (!text.trim()) {
    Swal.fire({
      icon: 'warning',
      title: 'Campo vazio',
      text: 'Corpo do e-mail está vazio!',
      theme: "dark",
      confirmButtonText: 'Ok'
    });
    return;
  }

  Swal.fire({
    title: 'Confirmação',
    text: 'Deseja enviar seu texto para o Gemini?',
    icon: 'question',
    showCancelButton: true,
    confirmButtonText: 'Sim',
    cancelButtonText: 'Não',
    theme: "dark"
  }).then((result) => {
    if (!result.isConfirmed) return;

    // Modal de loading do SweetAlert2
    Swal.fire({
      title: 'Carregando...',
      allowOutsideClick: false,
      didOpen: () => {
        Swal.showLoading();
      },
      theme: "dark"
    });

    const url = `/emails/${btn.id}`;

    fetch(`${url}?body=${encodeURIComponent(text)}`)
      .then(res => res.json())
      .then(data => {
        textarea.value = data.result;
      })
      .catch(err => {
        console.error(err);
        Swal.fire({
          icon: 'error',
          title: 'Erro',
          text: 'Erro ao processar o texto.',
          theme: "dark"
        });
      })
      .finally(() => {
        Swal.close();
      });
  });
}

window.geminiAction = geminiAction;
