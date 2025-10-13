import axios from 'axios'
import React, { useEffect, useState } from 'react'
import API from '../Api/ApiProvider.js'

export  function StudentListIsm1() {
    
 const[students, setstudent] = useState([])
  const allStudent= async()=>{
    await axios.get(API.students)
    .then((resp)=>{
      console.log("object", resp.data.data)
      setstudent(resp.data.data)
    })
    .catch((e)=>{
      console.log("error",e.message)
    })
  }

useEffect(()=>{
  allStudent()
},[])

  return (
 
       <tbody>
            {
                students.map((item, index) => {
              if (item.student_level === 'ism1') {
                        return (
                            <tr key={index} >
                                <td>{index+1}</td>
                                <td>{item.student_name}</td>
                                <td>{item.student_reg}</td>
                                <td>{item.student_password}</td>
                                <td>{item.student_role}</td>
                                <td>{item.year}</td>
                                <td>{item.program_id}</td>
                                <td>{item.student_level}</td>
                                {/* <td>{item.class_level}</td> */}
                                <td>Actionns</td>
                            </tr>

                        )
                      }
                })
            }
        </tbody>

  )
}

export  function StudentListIsm2() {
    
 const[students, setstudent] = useState([])
  const allStudent= async()=>{
    await axios.get(API.students)
    .then((resp)=>{
      console.log("object", resp.data.data)
      setstudent(resp.data.data)
    })
    .catch((e)=>{
      console.log("error",e.message)
    })
  }

useEffect(()=>{
  allStudent()
},[])

  return (
 
       <tbody>
            {
                students.map((item, index) => {
              if (item.student_level === 'ism2') {
                        return (
                            <tr key={index} >
                                <td>{index+1}</td>
                                <td>{item.student_name}</td>
                                <td>{item.student_reg}</td>
                                <td>{item.course_id}</td>
                                <td>{item.student_password}</td>
                                <td>{item.student_role}</td>
                                <td>{item.year}</td>
                                <td>{item.program_id}</td>
                                <td>{item.student_level}</td>
                                {/* <td>{item.class_level}</td> */}
                                <td>Actionns</td>
                            </tr>

                        )
              }
                })
            }
        </tbody>

  )
}
export function StudentListIsm3() {
    
 const[students, setstudent] = useState([])
  const allStudent= async()=>{
    await axios.get(API.students)
    .then((resp)=>{
      console.log("object", resp.data.data)
      setstudent(resp.data.data)
    })
    .catch((e)=>{
      console.log("error",e.message)
    })
  }

useEffect(()=>{
  allStudent()
},[])

  return (
 
       <tbody>
            {
                students.map((item, index) => {
              if (item.student_level === 'ism3') {
                        return (
                            <tr key={index} >
                                <td>{index+1}</td>
                                <td>{item.student_name}</td>
                                <td>{item.student_reg}</td>
                                <td>{item.course_id}</td>
                                <td>{item.student_password}</td>
                                <td>{item.student_role}</td>
                                <td>{item.year}</td>
                                <td>{item.program_id}</td>
                                <td>{item.student_level}</td>
                                {/* <td>{item.class_level}</td> */}
                                <td>Actionns</td>
                            </tr>

                        )
                      }
                })
            }
        </tbody>

  )
}