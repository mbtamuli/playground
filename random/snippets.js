// console log without line numbers in Chrome dev console
setTimeout (console.log.bind (console, "This is a console line without line numbers"));

// https://gitmoji.carloscuesta.me/
document.querySelectorAll('article.emoji .gitmoji-code code').forEach(element => element.innerText);