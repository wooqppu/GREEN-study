import React, { useContext } from 'react';
import { DarkContext } from '../context/DarkContext';

function Main() {
    const { isDark } = useContext(DarkContext);

    return (
        <div className='main' style={{
            backgroundColor: isDark ? '#222' : null,
            color: isDark ? '#fff' : '#222'
        }}>
            메인페이지 입니다.
        </div>
    );
}

export default Main;