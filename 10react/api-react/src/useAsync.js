// import axios from 'axios';
// import React, { useEffect, useReducer } from 'react';
import { useEffect, useReducer } from 'react';


function reducer(state, action) {
    switch (action.type) {
        case "LOADING":
            return{
                loading: true,
                users: null,
                error: null
            };
            case "SUCCESS":
                return {
                    loading: false,
                    users: action.data,
                    error: null
                };
            case "ERROR":
                return {
                    loading: false,
                    users: null,
                    error: action.error
                }    
        default:
            return state;    
    }
}

function useAsync(callback) {

    const [state, dispatch] = useReducer(reducer, {
        loading: false,
        users: null,
        error: false
    })

    const fetchData = async () => {
        dispatch({ type: "LOADING" });
        try{
            // const response = await axios.get('https://jsonplaceholder.typicode.com/users');
            const data = await callback();
            
            // dispatch({type:"SUCCESS", data: response.data});
            dispatch({type:"SUCCESS", data: data});

        }
        catch(e) {
            dispatch({type:"ERROR", error: e});
        }
    }

    useEffect(() => {
        fetchData();
    }, [])

    return [state, fetchData];

}

export default useAsync;