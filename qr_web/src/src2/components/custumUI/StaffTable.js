import axios from 'axios'
import React, { useEffect, useState } from 'react'
import API from '../Api/ApiProvider.js'

export default function StaffTable() {


  const[staffList, setStaffList] =useState([])
  const allStaff= async()=>{
    await axios.get(API.staff)
    .then((resp)=>{
      console.log("object", resp.data.data)
      setStaffList(resp.data.data)
    })
    .catch((e)=>{
      console.log("error",e.message)
    })
  }

useEffect(()=>{
  allStaff()
},[])


  return (
    <div>
            <div class="row">
        <div class="col-md-12">

          <div class="card">
            <div class="card-header">
              <div class="card-title">Staff Members</div>
            </div>
            <div class="ms-md-auto py-2 py-md-0 mx-3">
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addmember">
                Add Member
              </button>
            </div>

            <div class="card-body">
              <div class="card-sub">
                This is the basic table view of the ready dashboard :
              </div>
              <table class="table mt-3">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">DAte</th>
                    <th scope="col">Action</th>
                  </tr>
                </thead>
                <tbody>

                  {
                    staffList.map((item,index)=>{
                      return(
                  <tr>
                    <td>{index+1}</td>
                    <td>{item.staff_name}</td>
                    <td>Otto</td>
                    <td>Action</td>
                  </tr>
                      )
                    })
                  }


                </tbody>
              </table>
            </div>
          </div>


        </div>

      </div>
    </div>
  )
}
