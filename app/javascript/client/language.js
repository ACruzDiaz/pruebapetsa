document.addEventListener('DOMContentLoaded', ()=>{
    
    const savedStorage = localStorage.getItem('locale') || 'en'
    if(savedStorage !== I18n.locale){
        window.location.href = `/${savedStorage}`;
    }

    document.addEventListener('click', (el)=>{
        
        if(el.target.id == 'esl' ||el.target.id == 'enl' ){
            const locale = el.getAttribute('href').split('/').pop();
            localStorage.setItem('locale',locale)
        }
    })


})
