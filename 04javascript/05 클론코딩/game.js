// html 요소 선언
const shortleftElem = document.querySelector("#short-left");
const comScoreElem = document.querySelector("#computer-score");
const userScoreElem = document.querySelector("#user-score");
const textElem = document.querySelector("#text");
const comBtn = document.querySelector(".btn-computer");
const userBtn = document.querySelectorAll(".btn-user");

// 변수 설정 
// 컴퓨터 점수, 사람 점수, 남은 슛 횟수
let comScore = 0;
let userScore = 0;
let shortLeft = 5; // 슛 횟수
let isConputerTurn = true;

// 컴퓨터 먼저 슛을 한다 
// 2점 슛인지 3점 슛인지 랜덤으로 결정 
// 2점 슛 - 50% 확률로 성공, 3점 슛 - 30% 확률로 성공 
// 컴퓨터가 슛을 할 때 동작하는 함수
shortleftElem.innerHTML = shortLeft; 
function onComputerShoot() {
    let shootType = Math.random() > 0.5 ? 2 : 3;
    if(shootType == 2) {
        // 50퍼센트 확률로 성공 
        // 성공했을 때 글자를 변경, 컴퓨터 점수 업데이트 
        if(Math.random() < 0.5) {
            comScore = comScore + 2;
            comScoreElem.innerHTML = comScore;
            textElem.innerHTML = "컴퓨터가 2점 슛을 성공했습니다.";
        } else {
            textElem.innerHTML = "실패했습니다.";
        }

    } else {
        // 30퍼센트 확률로 성공
        if(Math.random() < 0.3) {
            comScore = comScore + 3;
            comScoreElem.innerHTML = comScore;
            textElem.innerHTML = "컴퓨터가 3점 슛을 성공했습니다.";
        } else {
            textElem.innerHTML = "실패했습니다.";
        }
    }
    // 사람이 게임할 차례로 돌려줌
    isConputerTurn = false;
    comBtn.disabled = true;
    userBtn.forEach(btn => {
        btn.disabled = false;
    });
}


// 유저가 2점, 3점 슛을 클릭했을 때 실행되는 함수 
function onUserShoot(num) {
    let ran = num == 2 ? 0.5 : 0.3;
    if (Math.random() < ran) {
        userScore = userScore + num;
        userScoreElem.innerHTML = userScore;
        textElem.innerHTML = "사용자가 " + num +"점 슛에 성공했습니다.";
    } else {
        textElem.innerHTML = "사용자가 " + num + "점 슛에 실패했습니다.";
    }

    // 남은 슛 횟수를 1회씩 빼줌 
    shortLeft = shortLeft -1;
    shortleftElem.innerHTML = shortLeft;

    // 컴퓨터가 게임할 차례로 돌려줌
    isConputerTurn = true;
    comBtn.disabled = false;
    userBtn.forEach(btn => {
        btn.disabled = true;
    })

    if(shortLeft == 0) {
        gameOver();
    }
} 

// // 유저가 3점 슛을 클릭했을 때 실행되는 함수 
// function onUserShoot3() {
//     if (Math.random() < 0.3) {
//         userScore = userScore +3;
//         userScoreElem.innerHTML = userScore;
//         textElem.innerHTML = "사용자가 3점 슛에 성공했습니다.";
//     } else {
//         textElem.innerHTML = "사용자가 3점 슛에 실패했습니다.";
//     }

//     // 남은 슛 횟수를 1회씩 빼줌 
//     shortLeft = shortLeft -1;
//     shortleftElem.innerHTML = shortLeft;

//     // 컴퓨터가 게임할 차례로 돌려줌
//     isConputerTurn = true;
//     comBtn.disabled = false;
//     userBtn.forEach(btn => {
//         btn.disabled = true;
//     })

//     if(shortLeft == 0) {
//         gameOver();
//     }
// } 

function gameOver() {
    if(userScore > comScore) {
        textElem.innerHTML = "사용자가 이겼습니다.";
    } else if (userScore == comScore) {
        textElem.innerHTML = "비겼습니다."
    } else {
        textElem.innerHTML = "컴퓨터가 이겼습니다."
    }
    comBtn.disabled = true;
}


comBtn.addEventListener("click", onComputerShoot);
userBtn[0].addEventListener("click", function() {
    onUserShoot(2);
});
userBtn[1].addEventListener("click", function() {
    onUserShoot(3);
});
