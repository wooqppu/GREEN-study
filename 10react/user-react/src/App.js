
import { useEffect, useRef, useState } from 'react';
import './App.css';
import UserList from './Components/UserList';
import CreateUser from './Components/CreateUser';

function App() {
  // 유저 항목을 나타내는 앱 
  const [users, setUsers] = useState([
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

  ]);

  // 인풋 입력값을 상태관리
  const [inputs, setInputs] = useState({
    username: "",
    email: ""
  });
  const {username, email} = inputs;   // 구조분해할당으로 따로따로 변수로 관리

  const onChange = e => {
    const {name, value} = e.target;

    setInputs({
      ...inputs,
      [name]: value
    }) 
  }

  const nextId = useRef(4);
  const onCreate = () => {
    // users 배열에 객체를 추가하기 
    setUsers([
      ...users,
     { id: nextId.current, username: username, email: email, active: false }
    ])

    // 입력창 초기화시키기
    setInputs({
      username: "",
      email: ""
    })

    nextId.current += 1;
  }

  const onRemove = (id) => {
    setUsers(users.filter(user => user.id !== id))
  }

  const onToggle = (id) => {
    setUsers(users.map(user => user.id === id ? 
      {...user, active: !user.active} : user))
  }



  useEffect(()=>{
    console.log("랜더링되었습니다.");
  },[])



  return (
    <div className="App">
      {/* {users: []}  props.users */}

      {/* onChange=function, username="", email="", onCreate=function */}
      <CreateUser 
        onChange={onChange} 
        username={username}
        email={email}
        onCreate={onCreate}  
      />

      <UserList users={users} onRemove={onRemove} onToggle={onToggle} />
    </div>
  );
}

export default App;
