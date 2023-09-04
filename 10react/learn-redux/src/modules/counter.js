// 액션 타입, 액션 생성 함수, 리듀서 

// 1. 액션 타입 

const SET_DIFF = 'Counter/SET_DIFF';
const INCREASE = 'Counter/INCREASE';
const DECREASE = 'Counter/DECREASE';


// 2. 액션 생성 함수 
// function setDiff(diff) {
//     return { type: SET_DIFF, diff: diff }
// }

export const setDiff = diff => ({ type: SET_DIFF, diff: diff });   // 액션 생성 함수를 화살표 함수 형식으로 표현 
export const increase = () => ({ type: INCREASE });
export const decrease = () => ({ type: DECREASE }); 


// 초기 상태
const initialState = {
    number: 0,
    diff: 1
}


// 3. 리듀서 
export default function counter(state = initialState, action) {
    switch(action.type) {
        case SET_DIFF:
            return {
                ...state,
                diff: action.diff
            };
        case INCREASE:
            return {
                ...state,
                number: state.number + state.diff
            };
        case DECREASE:
            return {
                ...state,
                number: state.number - state.diff
            };         
        default:
            return state;
    }
}

