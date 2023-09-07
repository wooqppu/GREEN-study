import React, { useState } from 'react';
import { SERVER_URL } from '../constants';

function Weather(props) {

    const [weatherdate, setCdate] = useState({
        CurrentDate: "",
        CityAreaId: ""
    });

    const [weathers, setTours] = useState([]);

    const onChange = (e) => {
        setCdate({
            ...weatherdate,
            [e.target.name] : e.target.value
        });
    }

    const getWeather = () => {
        fetch(`${SERVER_URL}weather/wea?CurrentDate=${weatherdate.CurrentDate}&CityAreaId=${weatherdate.CityAreaId}`)
        .then(response => response.json())
        .then(data => {
            console.log(data.response.body.items.item);
            setTours(data.response.body.items.item);
        })
        .catch(e => console.log(e));  
    }

    return (
        <div>
            관광 기후 지수 조회
            <input name="CurrentDate" value={weatherdate.cdate} onChange={onChange} />

            <select name='CityAreaId' onChange={onChange}>
                <option value="2717000000">대구 서구</option>
                <option value="2644000000">부산 강서구</option>
                <option value="1168000000">서울 강남구</option>
                <option value="3114000000">울산 남구</option>
                <option value="2871000000">인천 강화군</option>
                <option value="4681000000">전남 강진군</option>
                <option value="3023000000">대전 대덕구</option>
                <option value="2650000000">부산 수영구</option>
                <option value="3117000000">울산 동구</option>
                <option value="4613000000">전남 여수시</option>
            </select>

            <button onClick={getWeather}>조회</button>
            <div>
                <ul>
                    {weathers.map((t, index)=><li key={index}>{t.tm} {t.totalCityName} 
                    : {t.TCI_GRADE} {t.kmaTci}</li>)}
                </ul>
            </div>
        </div>
    );
}

export default Weather;
