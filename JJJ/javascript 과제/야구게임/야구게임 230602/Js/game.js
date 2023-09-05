
let a = document.querySelectorAll(".a"); //주자 위치 배열
let b = document.querySelector("#be") //휘두르기 버튼
let see = document.querySelector("#see") //지켜보기 버튼
let stc = document.querySelectorAll(".s") //스트라이크 원
let bac = document.querySelectorAll(".b") //볼 원
let outc = document.querySelectorAll(".o") //아웃 원
let btt = document.querySelector("#bt"); //타자 행동
let pii = document.querySelector("#pi") //투수 행동
let sta = document.querySelector("#sta") //투수 스트라이크 버튼
let baa = document.querySelector("#baa") //투수 볼 버튼
let comsocre = document.querySelector("#comscore") // 컴퓨터 점수
let userscore = document.querySelector("#userscore") // 유저 점수
let display = document.querySelector("#display"); //플레이 표시
let setuser = 0; //가변 유저 점수
let setcom = 0; //가변 컴퓨터 점수
let st = 0; //스트라이크 카운터
let ba = 0; //볼 카운터
let out = 0; //아웃 카운터
let play = true; //플레이어 공격 수비 확인
let d1 = false; //1루 존재여부
let d2 = false; //2루 존재여부
let d3 = false; //3루 존재여부
let round = 1;
let inout = true;
let roundplay = document.querySelector("#roundplay")
let ak = document.querySelector("#ak")
let timer = new Date();
let timerdisplay = document.querySelector("#timedisplay"); //시간 표현
let homerun = document.querySelector("#homerun")
let homeck = false;
pii.style.opacity = "0"; // 투수 조작 숨기기
a.forEach(a=>a.style.opacity = "0") // 주자 숨기기

display.innerHTML = "경기시작"

roundplay.innerHTML = "1회 초"
ak.innerHTML = "사용자 공격 차례"
//실시간 시간흐리기
timerdisplay.innerHTML = `${timer.getFullYear()}년 ${timer.getMonth()}월 ${timer.getDate()}일 ${timer.getHours()}시 ${timer.getMinutes()}분 ${timer.getSeconds()}초`
setInterval(time,1000);
function time(){
    let timer = new Date();
    timerdisplay.innerHTML = `${timer.getFullYear()}년 ${timer.getMonth()+1}월 ${timer.getDate()}일 ${timer.getHours()}시 ${timer.getMinutes()}분 ${timer.getSeconds()}초`
}
//휘두루기
b.addEventListener("click",aa)
function aa(){
    coloronoff(b)     //휘두루기 버튼 클릭시 색깔 추가 및 제거[버튼은 매개변수로 받는다.]
    coloronoff(sta)    //스트라이크 버튼 클릭시 색깔 추가 및 제거[버튼은 매개변수로 받는다.]
    let ch = Math.floor(Math.random()*99)
    if(ch>=0&&ch<=9){
        a1()
        display.innerHTML = "1루타"
    }
    if(ch>=10&&ch<=16){
        a2()
        display.innerHTML = "2루타"
    }
    if(ch>=17&&ch<=19){
        a3()
        display.innerHTML = "3루타"
    }
    if(ch>=20&&ch<=21){
        a4()
        display.innerHTML = "홈런"
    }
    if(ch>=22&&ch<=75){
        let or = Math.floor(Math.random()*99)
        if(or>=0&&or<=66){
            display.innerHTML = "스트라이크"
        }
        else{
            display.innerHTML = "파울"
        }
        see2()
    }
    if(ch>=76&&ch<=99){
        let or2 = Math.floor(Math.random()*99)
        if(or2<=0&&or2>=49){
            display.innerHTML = "플라이 아웃"
        }
        else{
            display.innerHTML = "파울 플라이 아웃"
        }
        outt()
    }
    userscore.innerHTML = setuser
    comsocre.innerHTML = setcom
}
//주자 생성 삭제
function Positions(){
    a[1].style.opacity = d1 ? "1" : "0" //d1 = 베이스 1이 트루일때만 주자를 표시
    a[2].style.opacity = d2 ? "1" : "0" //d2 = 베이스 2가 트루일때만 주자를 표시
    a[3].style.opacity = d3 ? "1" : "0" //d3 = 베이스 3가 트루일때만 주자를 표시
}
//1루타
function a1(){
    reset();
    //루가 모두 비어있을때
    if(!d1&&!d2&&!d3){
        d1 = true;
    }
    //1루가 채워져있을때
    else if(!d2&&!d3){
        d2 = true;
    }
    //2루가 채워져있을때
    else if(!d1&&!d3){
        d1 = true;
        d2 = false;
        d3 = true;
    }
    //3루가 채워져있을때
    else if(!d1&&!d2){
        d1 = true;
        d3 = false;
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
    }
    //1루 2루가 채워져있을때
    else if(!d3){
        d3 = true;

    }
    //1루 3루가 채워져있을때
    else if(!d2){
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
        d2 = true;
        d3 = false;

    }
    //2루 3루가 채워져있을때
    else if(!d1){
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
        d1 = true;
        d2 = false;

    }
    //만루 상황
    else{
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
    }
    Positions();
}
//2루타
function a2(){
    reset();
    //루가 모두 비어있을때
    if(!d1&&!d2&&!d3){
        d2 = true;
    }
    //1루가 채워져있을때
    else if(!d2&&!d3){
        d1 = false;
        d2 = true;
        d3 = true;

    }
    //2루가 채워져있을때
    else if(!d1&&!d3){
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
    }
    //3루가 채워져있을때
    else if(!d1&&!d2){
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
        d3 = false;

    }
    //1루 2루가 채워져있을때
    else if(!d3){
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
        d1 = false;
        d3 = true;

    }
    //1루 3루가 채워져있을때
    else if(!d2){
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
        d1 = false;
        d2 = true;
    }
    //2루 3루가 채워져있을때
    else if(!d1){
        if(play){
            setuser += 2;
        }
        else if(!play){
            setcom += 2;
        }
        d3 = false;
    }
    //만루 상황
    else{
        if(play){
            setuser += 2;
        }
        else if(!play){
            setcom += 2;
        }
        d1 = false;
    }
    Positions();
}
//3루타
function a3(){
    reset();
    //루가 모두 비어있을때
    if(!d1&&!d2&&!d3){
        a[3].style.opacity = "1"
        d3 = true;
    }
    //1루가 채워져있을때
    else if(!d2&&!d3){
        a[1].style.opacity = "0"
        a[3].style.opacity = "1"
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
        d1 = false;
        d3 = true;
    }
    //2루가 채워져있을때
    else if(!d1&&!d3){
        a[2].style.opacity = "0"
        a[3].style.opacity = "1"
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
        d2 = false;
        d3 = true;
    }
    //3루가 채워져있을때
    else if(!d1&&!d2){
        a[3].style.opacity = "1"
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
    }
    //1루 2루가 채워져있을때
    else if(!d3){
        a[1].style.opacity = "0"
        a[2].style.opacity = "0"
        a[3].style.opacity = "1"
        if(play){
            setuser += 2;
        }
        else if(!play){
            setcom += 2;
        }
        d1 = false;
        d2 = false;
        d3 = true;
    }
    //1루 3루가 채워져있을때
    else if(!d2){
        a[1].style.opacity = "0"
        a[3].style.opacity = "1"
        if(play){
            setuser += 2;
        }
        else if(!play){
            setcom += 2;
        }
        d1 = false;
    }
    //2루 3루가 채워져있을때
    else if(!d1){
        a[2].style.opacity = "0"
        a[3].style.opacity = "1"
        if(play){
            setuser += 2;
        }
        else if(!play){
            setcom += 2;
        }
        d2 = false;
    }
    //만루 상황
    else{
        a[1].style.opacity = "0"
        a[2].style.opacity = "0"
        a[3].style.opacity = "1"
        if(play){
            setuser += 3;
        }
        else if(!play){
            setcom += 3;
        }
        d1 = false;
        d2 = false;
    }
}
//홈런
function a4(){
    reset();
    a[1].style.opacity = "0"
    a[2].style.opacity = "0"
    a[3].style.opacity = "0"
    //모든 루가 비워져있을때
    if(!d1&&!d2&&!d3){
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
    }
    //1루가 채워져있을때
    else if(!d2&&!d3){
        a[1].style.opacity = "0"
        if(play){
            setuser += 2;
        }
        else if(!play){
            setcom += 2;
        }
        d1 = false;
    }
    //2루가 채워져있을때
    else if(!d1&&!d3){
        a[2].style.opacity = "0"
        if(play){
            setuser += 2;
        }
        else if(!play){
            setcom += 2;
        }
        d2 = false;
    }
    //3루가 채워져있을때
    else if(!d1&&!d2){
        a[3].style.opacity = "0"
        if(play){
            setuser += 2;
        }
        else if(!play){
            setcom += 2;
        }
        d3 = false;
    }
    //1루 2루가 채워져있을때
    else if(!d3){
        a[1].style.opacity = "0"
        a[2].style.opacity = "0"
        if(play){
            setuser += 2;
        }
        else if(!play){
            setcom += 2;
        }
        d1 = false;
        d2 = false;
    }
    //1루 3루가 채워져있을때
    else if(!d2){
        a[1].style.opacity = "0"
        a[3].style.opacity = "0"
        if(play){
            setuser += 3;
        }
        else if(!play){
            setcom += 3;
        }
        d1 = false;
        d3 = false;
    }
    //2루 3루가 채워져있을때
    else if(!d1){
        a[2].style.opacity = "0"
        a[3].style.opacity = "0"
        if(play){
            setuser += 3;
        }
        else if(!play){
            setcom += 3;
        }
        d2 = false;
        d3 = false;
    }
    //만루 상황
    else{
        a[1].style.opacity = "0"
        a[2].style.opacity = "0"
        a[3].style.opacity = "0"
        if(play){
            setuser += 4;
        }
        else if(!play){
            setcom += 4;
        }
        d1 = false;
        d2 = false;
        d3 = false;
    }
    console.log("aaaaa")
    homerun.style.width = "650px"
    homerun.style.height = "350px"
    homeck = true;
    onoff();
    setTimeout(function(){
        console.log("bbbbb")
        homerun.style.width = "0px"
        homerun.style.height = "0px"
        homeck = false;
        onoff();
    },1500)
}
//홈런시 버튼 활성화 비활성화
function onoff(){
    if(homeck){
        be.disabled = true;
        see.disabled = true;
        sta.disabled = true;
        baa.disabled = true;
    }
    if(!homeck){
        be.disabled = false;
        see.disabled = false;
        sta.disabled = false;
        baa.disabled = false;
    }
}
//점수카운터
function score(){
    if(play){
        setuser = set;
    }
    else if(!play){
        setcom = set;
    }
}
//지켜보기
see.addEventListener("click",see1)
function see1(){
    coloronoff(see)     //지켜보기 버튼 클릭시 색깔 추가 및 제거[버튼은 매개변수로 받는다.]
    if(st<2){
        let stb = Math.floor(Math.random()*3+1)
        if(stb<=2){
            display.innerHTML = "스트라이크"
            see2();
        }
        else if(stb==3){
            see3();
        }
    }
    else if(st==2){
        let sta = Math.floor(Math.random()*99)
        if(sta>=0&&sta<=49){
            display.innerHTML = "스트라이크"
            see2() //스트라이크
        }
        else if(sta>=50&&sta<=94) {
            see3() //볼
        }
        else if(sta>=95){
                a1();
                display.innerHTML = "낫아웃 1루씩 진루"
            // 폭투[낫아웃] (공흘림)
        }
    }
    userscore.innerHTML = setuser
    comsocre.innerHTML = setcom
}
//스트라이크
function see2(){
    st += 1;
    if(st==1){
        stc[0].style.background = "red"
    }
    if(st==2){
        stc[1].style.background = "red"
    }
    if(st==3){
        stc[0].style.background = "none"
        stc[1].style.background = "none"
        st = 0;
        soutt();
    }
}
//볼
function see3(){
    coloronoff(baa)     //볼 버튼 클릭시 색깔 추가 및 제거[버튼은 매개변수로 받는다.]
    display.innerHTML = "볼"
    ba += 1;
    if(ba==1){
        bac[0].style.background = "green"
    }
    if(ba==2){
        bac[1].style.background = "green"
    }
    if(ba==3){
        bac[2].style.background = "green"
    }
    if(ba==4){
        bac[0].style.background = "none"
        bac[1].style.background = "none"
        bac[2].style.background = "none"
        ba = 0;
        see4();
    }
    userscore.innerHTML = setuser
    comsocre.innerHTML = setcom
}
//포볼
function see4(){
    display.innerHTML = "포볼"
    reset();
    if(!d1&&!d2&&!d3){
        a[1].style.opacity = "1"
        d1 = true;
    }
    //1루가 채워져있을때
    else if(!d2&&!d3){
        a[1].style.opacity = "1"
        a[2].style.opacity = "1"
        d2 = true;
    }
    //2루가 채워져있을때
    else if(!d1&&!d3){
        a[1].style.opacity = "1"
        d1 = true;
    }
    //3루가 채워져있을때
    else if(!d1&&!d2){
        a[1].style.opacity = "1"
        d1 = true;
    }
    //1루 2루가 채워져있을때
    else if(!d3){
        a[3].style.opacity = "1"
        d3 = true;
    }
    //1루 3루가 채워져있을때
    else if(!d2){
        a[2].style.opacity = "1"
        d2 = true;
    }
    //2루 3루가 채워져있을때
    else if(!d1){
        a[1].style.opacity = "1"
        d1 = true;
    }
    //만루 상황
    else{
        if(play){
            setuser += 1;
        }
        else if(!play){
            setcom += 1;
        }
    }
}
//아웃카운터
function outt(){
    out += 1;
    if(out==1){
        outc[0].style.background = "red"
    }
    if(out==2){
        outc[1].style.background = "red"
    }
    if(out==3){
        tu();
    }
}
//스트라이크 아웃
function soutt(){
    display.innerHTML = "삼진 아웃"
    reset();
    out += 1;
    if(out==1){
        outc[0].style.background = "red"
    }
    if(out==2){
        outc[1].style.background = "red"
    }
    if(out==3){
        tu();
    }
}
//공수교대
function tu(){
    if(out==3){
        reset();
        display.innerHTML = "쓰리아웃 공수 교대"
        out = 0
        outc[0].style.background = "none"
        outc[1].style.background = "none"
        a[1].style.opacity = "0"
        a[2].style.opacity = "0"
        a[3].style.opacity = "0"
        d1 = false;
        d2 = false;
        d3 = false;
        if(play){
            pii.style.opacity = "1"
            btt.style.opacity = "0"
            play = false;
            b.disabled = true
            see.disabled = true
            sta.disabled = false
            baa.disabled = false
            inout = false;
            if(!inout){
                roundplay.innerHTML = `${round}회 말`
                ak.innerHTML = "컴퓨터 공격 차례"
            }
        }
        else {
            pii.style.opacity = "0"
            btt.style.opacity = "1"
            play = true;
            b.disabled = false
            see.disabled = false
            sta.disabled = true
            baa.disabled = true
            round += 1;
            over();
            inout = true;
            if(inout){
                roundplay.innerHTML = `${round}회 초`;
            }
        }
    }
}
//투수 스트라이크
sta.addEventListener("click",aa);
//투수 볼
baa.addEventListener("click",see3)
//게임 종료
function over(){
    if(round==9){
        if(setuser==setcom){
            alert(`사용자 ${setuser} 대 컴퓨터 ${setcom}로 비겼습니다.`)
            setuser = 0;
            setcom = 0;
            userscore.innerHTML = setuser
            comsocre.innerHTML = setcom
            return
        }
        else if(setuser>setcom){
            alert(`사용자 ${setuser} 대 컴퓨터 ${setcom}로 승리하셨습니다.`)
            setuser = 0;
            setcom = 0;
            userscore.innerHTML = setuser
            comsocre.innerHTML = setcom
            return
        }
        else if(setuser<setcom){
            alert(`사용자 ${setuser} 대 컴퓨터 ${setcom}로 패배하셨습니다.`)
            setuser = 0;
            setcom = 0;
            userscore.innerHTML = setuser
            comsocre.innerHTML = setcom
            return
        }
    }
}
//볼카운터 초기화
function reset(){
    stc[0].style.background = "none"
    stc[1].style.background = "none"
    bac[0].style.background = "none"
    bac[1].style.background = "none"
    bac[2].style.background = "none"
    st = 0;
    ba = 0;
}
//버튼 클릭시 색깔추가및 제거
function coloronoff (e) {
    e.style.background = "#bbb"
    setTimeout(function(){
    e.style.background = "#fff"
    },200)
}