// 유저 환경설정 ON/OFF
const toggles = document.getElementsByClassName('toggle');
for(let toggle of toggles) {
    toggle.addEventListener("click", e => {
        toggle.classList.toggle("checked");
        
        const key = e.target.getAttribute("key");
        let value = toggle.classList.contains('checked') ? 'Y' : 'N';

        fetch("changeSetting?key=" + key + "&value=" + value)
        .then(resp => resp.text())
        .then(result => {
            if(result == 0) {
                alert('설정 변경 실패');
            }
        })
        .catch(e => console.log(e));
    });
}