import * as postAPI from '../api/post';

// 액션 타입, 액션 생성 함수, 리듀서

// 액션 타입 
// 포스트 전체 조회 
const GET_POSTS = "GET_POSTS"   // 요청 시작 
const GET_POSTS_SUCCESS = "GET_POSTS_SUCCESS"   // 요청 성공 
const GET_POSTS_ERROR = "GET_POSTS_ERROR"       // 요청 실패 

// 포스트 한 개 조회 
const GET_POST = "GET_POST"   // 요청 시작 
const GET_POST_SUCCESS = "GET_POST_SUCCESS"   // 요청 성공 
const GET_POST_ERROR = "GET_POST_ERROR"       // 요청 실패 

// thunk 함수 
export const getPosts = () => async dispatch => {
    dispatch({ type: GET_POST });      // 요청이 시작됨
    try {
        // api 호출 
        const posts = await postAPI.getPosts();
        dispatch ({ type: GET_POSTS_SUCCESS, posts: posts })
    } 
    catch (e) {
        dispatch({ type:GET_POSTS_ERROR, error: e })
    }
} 
export const getPost = (id) => async dispatch => {
    dispatch({ type: GET_POST });      // 요청이 시작됨
    try {
        // api 호출 
        const post = await postAPI.getPostsById(id);
        dispatch ({ type: GET_POST_SUCCESS, post: post })
    } 
    catch (e) {
        dispatch({ type:GET_POST_ERROR, error: e })
    }
} 

// 초기 상태 
const initialState = {
    posts: {
        loading: false,
        data: null,
        error: null
    },
    
    post: {
        loading: false,
        data: null,
        error: null
    }
}

export default function posts(state = initialState, action) {
    switch(action.type) {
        case GET_POSTS:
            return {
                ...state,
                posts: {
                    loading: true,
                    data: null,
                    error: null
                }
            }
        case GET_POSTS_SUCCESS:
            return {
                ...state,
                posts: {
                    loading: false,
                    data: action.posts,
                    error: null
                }
            }
        
        case GET_POSTS_ERROR:
            return {
                ...state,
                posts: {
                    loading: false,
                    data: null,
                    error: action.error
                }
            }
        case GET_POST:
            return {
                ...state,
                 post: {
                    loading: true,
                    data: null,
                    error: null
                }
            }
        case GET_POST_SUCCESS:
            return {
                ...state,
                post: {
                    loading: false,
                    data: action.post,
                    error: null
                }
            }
            
        case GET_POST_ERROR:
            return {
                ...state,
                post: {
                    loading: false,
                    data: null,
                    error: action.error
                }
            }                

        default:
            return state;    
    }
}
