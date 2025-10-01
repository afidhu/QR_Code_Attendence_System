import axios from 'axios'
import React, { useEffect, useState } from 'react'
import API from '../Api/ApiProvider.js'

export  function TimetableIsm1() {

    const [timetable, setTimetable] = useState([])
    const allTimetable = async () => {
        await axios.get(API.timetables)
            .then((resp) => {
                setTimetable(resp.data.data)
            })
            .catch((e) => {
                console.log("error at :", e.message)
            })
    }

    useEffect(() => {
        allTimetable()
    }, [])


    return (

        <tbody>
            {
                timetable.map((item, index) => {
                    if (item.class_level === 'ism1') {
                        return (
                            <tr>
                                <td>{index+1}</td>
                                <td>{item.course_id}</td>
                                <td>{item.day}</td>
                                <td>{item.date}</td>
                                <td>{item.start_time}</td>
                                <td>{item.end_time}</td>
                                <td>{item.lecture_id}</td>
                                <td>{item.class_year}</td>
                                <td>{item.program_id}</td>
                                <td>{item.class_level}</td>
                                <td>@mdo</td>
                            </tr>

                        )
                    }
                    
                })
            }
        </tbody>
    )
}



export  function TimetableIsm2() {

    const [timetable, setTimetable] = useState([])
    const allTimetable = async () => {
        await axios.get(API.timetables)
            .then((resp) => {
                setTimetable(resp.data.data)
            })
            .catch((e) => {
                console.log("error at :", e.message)
            })
    }

    useEffect(() => {
        allTimetable()
    }, [])


    return (

        <tbody>
            {
                timetable.map((item, index) => {
                    if (item.class_level === 'ism2') {
                        
                        return (
                            <tr>
                               <td>{index+1}</td>
                                <td>{item.course_id}</td>
                                <td>{item.day}</td>
                                <td>{item.date}</td>
                                <td>{item.start_time}</td>
                                <td>{item.end_time}</td>
                                <td>{item.lecture_id}</td>
                                <td>{item.class_year}</td>
                                <td>{item.program_id}</td>
                                <td>{item.class_level}</td>
                                <td>@mdo</td>
                            </tr>

                        )
                    }
                    
                })
            }
        </tbody>
    )
}



export  function TimetableIsm3() {

    const [timetable, setTimetable] = useState([])
    const allTimetable = async () => {
        await axios.get(API.timetables)
            .then((resp) => {
                setTimetable(resp.data.data)
            })
            .catch((e) => {
                console.log("error at :", e.message)
            })
    }

    useEffect(() => {
        allTimetable()
    }, [])


    return (

        <tbody>
            {
                timetable.map((item, index) => {
                    if (item.class_level === 'ism3') {
                        return (
                            <tr>
                             <td>{1+1}</td>
                                <td>{item.course_id}</td>
                                <td>{item.day}</td>
                                <td>{item.date}</td>
                                <td>{item.start_time}</td>
                                <td>{item.end_time}</td>
                                <td>{item.lecture_id}</td>
                                <td>{item.class_year}</td>
                                <td>{item.program_id}</td>
                                <td>{item.class_level}</td>
                                <td>@mdo</td>
                            </tr>

                        )
                    }
                    
                })
            }
        </tbody>
    )
}
