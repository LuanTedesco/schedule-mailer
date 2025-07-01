function geminiAction(btn){
    const spinnerContainer = document.getElementById("loading-spinner");
    const textarea = document.querySelector("#email_body");
    const text = textarea.value;

    if (!text.trim()) {
        alert("Corpo do e-mail está vazio!");
        return;
    }

    if(!confirm('Deseja enviar seu texto para o Gemini?')) {
        return;
    }

    spinnerContainer.innerHTML = `
        <div class="d-flex align-items-center gap-2 text-primary">
        <div class="spinner-border spinner-border-sm" role="status"></div>
        <strong id="spinner-text">Carregando</strong>
        </div>
    `;

    let dotCount = 0;
    const intervalId = setInterval(() => {
        const spinnerText = document.getElementById("spinner-text");
        if (!spinnerText) return clearInterval(intervalId);
        dotCount = (dotCount + 1) % 4;
        spinnerText.textContent = "Carregando" + ".".repeat(dotCount);
    }, 400);

    const url = `/emails/${btn.id}`;

    fetch(`${url}?body=${encodeURIComponent(text)}`)
        .then(res => res.json())
        .then(data => {
        textarea.value = data.result;
        })
        .catch(err => {
        console.error(err);
        alert("Erro ao processar o texto.");
        })
        .finally(() => {
        clearInterval(intervalId);
        spinnerContainer.innerHTML = '';
    });
}

window.geminiAction = geminiAction;