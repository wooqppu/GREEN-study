import React from 'react';
import { useLocation, useSearchParams } from 'react-router-dom';

function View(props) {

    const location = useLocation();
    console.log(location);

    const [searchParams, setSearchParams] = useSearchParams();
    // http://localhost:3000/view?name=green&color=white

    console.log(searchParams.get("name"));      // green
    console.log(searchParams.get("color"));     // white

    const name = searchParams.get("name");
    const color = searchParams.get("color");

    return (
        <div>
            <h2>상세보기</h2>
            <p>상세보기 페이지입니다.</p>

            <p>name값은 : {name}</p>
            <p>color값은 : {color}</p>
        </div>
    );
}

export default View;