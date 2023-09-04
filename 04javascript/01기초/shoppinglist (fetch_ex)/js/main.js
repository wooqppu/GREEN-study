fetch("data/data.json")
.then(response => response.json())
.then(data => { // 화살표 함수 - 코드 한줄이면 중괄호 생략 가능 
    displayItems(data.items);
    setEventItems(data.items);
}); 

// 화면 나타내기 
function displayItems(items) {
    const ul = document.querySelector("#items");
    let str = "";
    str = items.map(item => {
        return `<li class="item">
        <img src = "${item.image}">
        <span>${item.gender}, ${item.size}</span>
        </li>`
    }) .join("");
    ul.innerHTML = str;
}

// 이벤트 설정하기 
function setEventItems(items) {
    const btn = document.querySelector("#buttonDiv");
    btn.addEventListener("click", function(e){
        const dataset = e.target.dataset;
        const key = dataset.key;
        const value = dataset.value;

        console.log(dataset);
        console.log(key);
        console.log(value);

        let filtered = items.filter(item => item[key] === value);
        console.log(filtered);
        displayItems(filtered);
    })
}