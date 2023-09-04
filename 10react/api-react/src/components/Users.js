// import axios from 'axios';
// import React, { useEffect, useReducer, useState } from 'react';
// import React, { useEffect, useReducer } from 'react';

import React, { useContext, useEffect } from 'react';
import { getUsers, useUsersDispatch, useUsersState } from '../UsersContext';

// import useAsync from '../useAsync';
// import axios from 'axios';


// function reducer(state, action) {
//     switch(action.type) {
//         case 'LOADING':
//             return {
//                 loading: true,
//                 users: null,
//                 error: null
//             };
//         case 'SUCCESS':
//             return {
//                 loading: false,
//                 users: action.data,
//                 error: null
//             };
//         case 'ERROR':
//             return {
//                 loading: false,
//                 users: null,
//                 error: action.error
//             };

//         default:
//             return state;    
//     }
// }


// async function getUsers() {
//     const response = await axios.get('https://jsonplaceholder.typicode.com/users');
//     return response.data;
// }


function Users(props) {
    
//     // 상태를 생성 users, loading, error
//     // const [users, setUsers] = useState(null);
//     // const [loading, setLoading] = useState(false);
//     // const [error, setError] = useState(null);  

//     const [state, dispatch] = useReducer(reducer, {
//         loading: false,
//         users: null,
//         error: null
//     })

//     // axios 요청
//     const fetchUsers = async () => {
//         try {
//             // 요청 시작 - error와 users는 초기화, loading은 true
//             // setUsers(null);
//             // setError(null);
//             // setLoading(true); 

//             dispatch({type: 'LOADING'});

//             const response = await axios.get('https://jsonplaceholder.typicode.com/users');
//             // response.data 안에 데이터가 있음
//             // 요청 성공 - 받아온 데이터를 users에 담기 
//             // setUsers(response.data);

//             dispatch({type:'SUCCESS', data: response.data});

//         } 
//         catch (e) {
//             // 요청 실패 
//             // setError(e);
//             dispatch({type:'ERROR', error: e})
//         }

//         // setLoading(false);
//     }

//     useEffect(() => {

//         // 함수 호출 
//         fetchUsers();
//     }, [])


    // const [state, refetch] = useAsync(getUsers);    // [state, fetchData]

    // const {loading, error, users} = state;


    // 상태를 리턴  useContext(UsersStateContext)
    const state = useUsersState();
    // dispatch를 리턴 useContext(UsersDispatchContext)
    const dispatch = useUsersDispatch();  // 객체 형태
    // 초기값 { loading: false, error: null, data: null } 
    const { loading, error, data } = state;

    const refetch = () => {
        getUsers(dispatch);
    }

    useEffect(()=> {
        getUsers(dispatch);
    }, []);

    if(loading) return <div>로딩중.....</div>;
    if(error) return <div>에러가 발생했습니다.</div>;
    
    // if(!users) return <div>데이터가 없습니다.</div>;
    if(!data) return <div>데이터가 없습니다.</div>;


    return (
        <div>
            <ul>
                {/* {users.map(user=> (
                    <li key={user.id}>
                        {user.username} ({user.name})
                    </li>
                ))} */}

                {data.map(user=> (
                    <li key={user.id}>
                        {user.brand} ({user.model})
                    </li>
                ))}
            </ul>

            <button onClick={refetch}>다시 불러오기</button>
        </div>
    );
}

export default Users;