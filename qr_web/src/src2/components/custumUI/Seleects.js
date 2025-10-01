import axios from "axios";
import React, { useEffect, useState } from "react";
import API from "../Api/ApiProvider.js";


export function Courses({course}) {

  const[cousers, setCourse] = useState([])

  const AllCouses =async()=>{
    await axios.get(API.courses)
    .then((resp)=>{
      setCourse(resp.data.data)

    })
    .catch((e)=>{
      console.log("error at",e.message)
    })
  }

  useEffect(()=>{
    AllCouses()
  },[])

  return (
    <div>
      <select required className="form-control" onChange={(e)=>course(e.target.value)} >
               <option value={''} >------ </option>
        {
          cousers.map((item, index)=>{
            return(
              <option value={item.course_id}  key={item.course_id}>{item.course_name}</option>
            )
          })
        }
      </select>
    </div>
  );
}

export function Programs({programId}) {

    const[program, setprogram] = useState([])

  const AllProgram =async()=>{
    await axios.get(API.programs)
    .then((resp)=>{
      setprogram(resp.data.data)

    })
    .catch((e)=>{
      console.log("error at",e.message)
    })
  }

  useEffect(()=>{
    AllProgram()
  },[])
  return (
    <div>
      <select required className="form-control" onChange={(e)=>programId(e.target.value)} >
               <option value={''} >------ </option>
       {
          program.map((item, index)=>{
            return(
              <option value={item.program_id} key={item.program_id}>{item.program_name}</option>
            )
          })
        }
      </select>
    </div>
  );
}
export function StaffMembers({staffId}) {

  const[staff, setStaff] = useState([])

  const AllStaff =async()=>{
    await axios.get(API.staff)
    .then((resp)=>{
      setStaff(resp.data.data)

    })
    .catch((e)=>{
      console.log("error at",e.message)
    })
  }

  useEffect(()=>{
    AllStaff()
  },[])

  return (
    <div>
      <select required className="form-control" onChange={(e)=>staffId(e.target.value)} >
               <option value={''} >------ </option>
       {
          staff.map((item, index)=>{
            return(
              <option value={item.staff_id} key={item.staff_id}>{item.staff_name}</option>
            )
          })
        }
      </select>
    </div>
  );
}

export function DaysList({dayValue}) {


  return (
    <div>
      <select required className="form-control" onChange={(e)=>dayValue(e.target.value)} >
               <option value={''} >------ </option>
        <option value="monday">Monday </option>
        <option value="tuesday">Tuesday </option>
        <option value="mednesday">Wednesday </option>
        <option value="thursday">Thursday </option>
        <option value="friday">Friday </option>
        <option value="saturday">Saturday </option>
        <option value="sunday">Sunday </option>
      </select>
    </div>
  );
}






 
