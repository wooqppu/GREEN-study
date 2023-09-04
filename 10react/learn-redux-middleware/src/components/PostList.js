import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { getPosts } from '../modules/posts';
import { Link } from 'react-router-dom';

function PostList(props) {
    // state = {
    //     counter: 0,
    //     posts: {
    //         loading: false,
    //         data: null,
    //         error: null
    //     },
    //     post: {
    //         loading: false,
    //         data: null,
    //         error: null
    //     }
    // }

    const {data, loading, error} = useSelector(state => state.posts.posts);
    const dispatch = useDispatch();     // dispatch 리턴 

    // 컴포넌트가 마운트될(화면에 나타날) 때 포스트 전체 목록 요청
    useEffect(()=>{
        dispatch(getPosts())
    }, [dispatch])

    if(loading) return <div>로딩중....</div>    
    if(error) return <div>에러 발생....</div>
    if(!data) return null

    return (
        <div>
            <ul>
                {data.map(post=>(
                    <li key={post.id}><Link to={`/${post.id}`}>{post.title}</Link></li>
                ))}
            </ul>            
        </div>
    );
}

export default PostList;