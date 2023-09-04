import React from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { addTodo, deleteTodo, toggleTodo } from '../modules/todos';
import Todos from './Todos';

function TodosContainer(props) {

    const todos = useSelector(state => state.todos);
    const dispatch = useDispatch();

    // dispatch({액션객체}) 액션 객체 생성 함수 -> return action
    const onCreate = text => dispatch(addTodo(text));
    const onToggle = id => dispatch(toggleTodo(id));
    const onRemove = id => dispatch(deleteTodo(id));

    return (
        <Todos 
        todos={todos} 
        onCreate={onCreate} 
        onToggle={onToggle} 
        onRemove={onRemove} 
        />
    );
}

export default TodosContainer;