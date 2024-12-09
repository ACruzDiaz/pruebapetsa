let isDark = true;
document.addEventListener('DOMContentLoaded', ()=>{
    let elems = document.querySelectorAll('.sidenav')
    let instances = M.Sidenav.init(elems)
    const theme = localStorage.getItem('theme') || 'lightmode'
    document.body.classList.add(theme)

    const themeBtn = document.getElementById('themeBtn')
    document.addEventListener('click', (el)=>{
        
        if(el.target.id == 'themeBtn'){
            const actualTheme = document.body.classList.contains('lightmode') ? 'lightmode' : 'darkmode';
            const newTheme = actualTheme === 'lightmode' ? 'darkmode': 'lightmode'
            document.body.classList.remove(actualTheme)
            document.body.classList.add(newTheme)
            localStorage.setItem('theme', newTheme);
        }
    })


})
