import { combineReducers } from "redux"
import todos from "./todos"
import counter from "./counter"


// 리덕스 모듈 합치기   combineReducers()
const rootReducer = combineReducers({
    counter: counter,
    todos: todos
})

export default rootReducer;