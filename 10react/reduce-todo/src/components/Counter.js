import React, { useReducer } from 'react';

function reducer(state, action) {
    switch(action.type) {
        case 'INCREMENT':
            return state+1;
        case 'DECREMENT':
            return state-1;
        default:
            return state;
    } 
}

function Counter(props) {
    const [number, dispatch] = useReducer(reducer, 0);
    const onIncrease = () => {
        dispatch({type: 'INCREMENT'})
    }

    const onDecrease = () => {
        dispatch({type: 'DECREMENT'})
    }

    return (
        <div>
            <p>{number}</p>
            <button onClick={onIncrease}>+1</button>
            <button onClick={onDecrease}>-1</button>
        </div>
    );
}

export default Counter;