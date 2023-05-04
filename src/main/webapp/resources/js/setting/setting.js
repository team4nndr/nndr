/* Toggle */ 
const toggles = document.querySelectorAll('.toggle');
for(let t of toggles) {
    t.addEventListener('click', () => {
        t.classList.toggle('selected');
    });
}