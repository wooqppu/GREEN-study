// 액션 타입, 액션 생성 함수, 리듀서
// 액션 타입 

const INCREASE = "INCREASE";
const DECREASE = "DECREASE"; 

// 액션 생성 함수 
export const increase = () => ({type: INCREASE});
export const decrease = () => ({type: DECREASE});


// redux-thunk 함수 생성 -> 리덕스에서 비동기 작업 처리 시에 사용하는 미들웨어
// 비동기 작업 : 데이터 처리 요청 시 바로 동작하지 않고 시간이 걸리는 작업   
export const increaseAsync = () => dispatch => {
    setTimeout(() => dispatch(increase()), 1000);
};

export const decreaseAsync = () => dispatch => {
    setTimeout(() => dispatch(decrease()), 1000);
};


// 초기값 
const initialState = 0;

// 리듀서 
export default function counter(state = initialState, action) {
    switch(action.type) {
        case INCREASE:
            return state + 1;
        case DECREASE:
            return state - 1;
        default:
            return state;    
    }
}
