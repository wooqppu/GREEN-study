
import { useReducer, useRef } from 'react';
import './App.css';
import UserList from './components/UserList';
import CreateUser from './components/CreateUser';

// 초기상태값
const initalState = {
  inputs: {
    username: '',
    email: ''
  },

  users : [
    {
      id: 1,
      username: 'green',
      email: 'green@naver.com',
      active: false
    },
    {
      id: 2,
      username: 'blue',
      email: 'blue@naver.com',
      active: false
    },
    {
      id: 3,
      username: 'yellow',
      email: 'yellow@naver.com',
      active: false
    }
  ]
}

// reducer 함수 
function reducer(state, action) {
  switch (action.type) {
    case 'INPUTCHANGE':
      return {
        ...state,
        inputs: {
          ...state.inputs,
          [action.name]: action.value
        }
      };

      case 'CREATEUSER':
        return {
          inputs: initalState.inputs,
          users: [
            ...state.users,
            action.user
          ]
        };

      case 'USERREMOVE':
        // user의 id와 액션객체가 가진 id를 비교해서 
        // 다를 때 user를 리턴 [{id:1}, {id:2}, {id:3}] => [{id:1}, [id:3]]만 리턴 
        return {
          ...state, 
          users: state.users.filter(user=> user.id !== action.id)
        };

      case 'USERTOGGLE':
        // active를 반전 - true -> false, false -> true
        return {
          ...state,
          users: state.users.map(user=> user.id === action.id ? {...user, active: !user.active} : user)
        }  

    default:  
    return state;
  }
}

function App() {

  const [state, dispatch] = useReducer(reducer, initalState);
  const { users } = state;
  const { username, email } = state.inputs;

  // 1. 인풋의 값이 변경되면 inputs의 값을 변경 
  const onChange = (e) => {
    const {name, value} = e.target;
    
    dispatch({
      type:"INPUTCHANGE", 
      name: name,
      value: value
    })
  }

  // 2. 등록버튼 클릭시 users 배열에 항목 추가 
  // id 번호 필요 
  const nextId = useRef(4);
  const onCreate = () => {
    // reducer 호출 (액션객체 전달)
    dispatch({
      type: "CREATEUSER",
      user: {
        id: nextId.current,
        username: username,
        email: email,
        active: false
      }
    })
    // nextId 값을 1씩 더해라
    nextId.current += 1;
  }

  // 3. 삭제 버튼 클릭 시 users 배열에서 해당 user 제거 
  // filter에서 사용할 id를 전달, type은 삭제 전달
  const onRemove = (id) => {
    dispatch({
      type: 'USERREMOVE',
      id: id
    })
  }

  // 4. 유저 항목 클릭시 유저의 active를 반전시킴 
  // true -> false, false -> true
  // id 전달 필요
  const onToggle = (id) => {
    dispatch({
      type: 'USERTOGGLE',
      id: id
    })
  }

  return (
    <div className="App">
      <CreateUser username={username} 
      email={email} onChange={onChange} 
      onCreate={onCreate} />
      <UserList users={users} onRemove={onRemove} onToggle={onToggle} />
    </div>
  );
}

export default App;
