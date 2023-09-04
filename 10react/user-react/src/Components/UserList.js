import React, { useEffect } from "react";

function User({user, onToggle, onRemove}) {
    useEffect(()=> {
        console.log("화면에 나타남");
        return ()=> {
            console.log("화면에서 사라짐");
        }
    },[])

    return(
        <li key={user.id}>
            <b onClick={()=> onToggle(user.id)} style={{ color: user.active ? 'darkseagreen' : 'black' }}>이름 : {user.username} 이메일 : {user.email}</b>
            <button onClick={()=> onRemove(user.id)}>삭제</button>
        </li>
    )
}

function UserList({users, onRemove, onToggle}) {
    // { users: [], age: '20' } -> props
    // const users = props.users;
    // const age = props.age;
    // 위처럼 하면 번거로우니 구조분해할당으로 아래 한줄로 끝냄 
    // const { users, age } = props; 
    // 얘를 users 라는 변수에 값을 담아서 바로 사용함
    
    return(
        <div>
            <ul>
                {users.map(user => (
                    <User user={user} 
                    onRemove={onRemove} 
                    onToggle={onToggle} 
                    key={user.id} />
                ))}
            </ul>
        </div>
    )
}

export default UserList;