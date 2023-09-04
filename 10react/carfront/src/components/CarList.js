import React, { useEffect, useState } from 'react';
import { SERVER_URL } from '../constants';
import { DataGrid } from '@mui/x-data-grid';
import AddCar from './AddCar';
import EditCar from './EditCar';
import { Stack } from '@mui/material';

function CarList(props) {
    const [cars, setCars] = useState([]);
    
    // 마운트될 때 실행
    useEffect(() => {
        // fetch("http://localhost:8010/api/cars") -> SERVER_URL
        fetchCar();
    }, [cars])

    // 목록 요청 함수 
    const fetchCar = () => {
        // 옵션이 따로 없으면 get 요청
        fetch(`${SERVER_URL}api/cars`, {
            headers: {'Authorization' : sessionStorage.getItem("jwt")}
        })
        .then(response => response.json())
        .then(data => setCars(data._embedded.cars))
        .catch(e => console.log(e))
    }

    // 삭제 요청 
    const onDelete = (url) => {
        if(window.confirm("정말 삭제하시겠습니까?")) {
            fetch(url, {
                method: "DELETE",
                headers: {'Authorization' : sessionStorage.getItem("jwt")}
            })
            .then(response => {
                if(response.ok) {
                    alert("삭제되었습니다.");
                    fetchCar();
                } else {
                    alert("삭제되지 않았습니다.");
                }
            })
            .catch(e => console.log(e));
        } 
       
    }

    // 수정 요청 
    const updateCar = (car, link) => {
        fetch(link, {
            method: "PUT",
            headers: {
            "Content-Type": "application/json",
            'Authorization' : sessionStorage.getItem("jwt")
            },
            body: JSON.stringify(car)
        })
        .then(response => {
            if(response.ok) {
                alert("수정되었습니다.")
                fetchCar();
            } else {
                alert("수정되지 않았습니다.")
            }
        })
        .catch(e => console.log(e))
    }

    // 등록 요청 
    // 추가하기 -> post 전송하기 
    const addCar = (car) => {
        fetch(SERVER_URL + "api/cars", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                'Authorization' : sessionStorage.getItem("jwt")
            },
            body: JSON.stringify(car)   // JSON.stringify(obj) : 객체를 json 직렬화
        })
        .then(response => {
            if(response.ok) {
                alert("등록되었습니다.");
                fetchCar();
            } else {
                alert("등록되지 않았습니다.");
            }
        })
        .catch(e => console.log(e))
    }

    const columns = [
        {field:"brand", headerName:"Brand", width:200},
        {field:"model", headerName:"Model", width:200},
        {field:"color", headerName:"Color", width:200},
        {field:"year", headerName:"Year", width:200},
        {field:"price", headerName:"Price", width:200},

        {
            field:"_links.car.href", 
            headerName:"",
            sorttable: false,
            filtertable: false,
            renderCell: row =>
            <EditCar data={row} updateCar={updateCar} />
        },

        {
            field:"_links.self.href", 
            headerName:"", 
            sorttable: false, 
            filtertable: false, 
            renderCell : row => <button onClick={() => onDelete(row.id)}>삭제</button>
        }
    ]
    

    return (
        <div>
            {/* props 전달 fetchCar={fetchCar} */}
            <Stack mt={4} mb={4}>
            <AddCar addCar={addCar} />
            </Stack>
            <div style={{ width: 1200, margin: "0 auto" }}>
                <DataGrid rows={cars} columns={columns} getRowId={row => row._links.self.href} />
            </div>
            
            {/* <table>
                <tbody>
                {
                    cars.map((car, index) => 
                        <tr key = {index}>
                            <td>{car.brand}</td>
                            <td>{car.model}</td>
                            <td>{car.color}</td>
                            <td>{car.year}</td>
                            <td>{car.price}</td>
                        </tr>
                    )
                }
                </tbody>    
            </table> */}
            
        </div>
    );
}

export default CarList;