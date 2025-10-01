import React, { useState } from 'react'
import StaffTable from '../../custumUI/StaffTable.js'
import axios from "axios";
import API from '../../Api/ApiProvider.js';

export default function Staff() {

  const [staffname, setStaffname] = useState('')
  const [isLoadind, setIsLoadind] = useState(false)

  const addStaffHandle = async (e) => {
    e.preventDefault()
    setIsLoadind(true)
    
    try {
      const data = {
        staff_name: staffname
      }
      setTimeout(async () => {
        await axios.post(`${API.staff}`, data)

          .then((resp) => {
            console.log("data are", resp.data)
          })
          .catch((e) => {
            setIsLoadind(true)
            console.log("error aet ", e.message)
          })

        setIsLoadind(false)
        window.location.reload()
      }, 400)
    } catch (error) {
      setIsLoadind(false)
      alert('internla error :', error.message)
    }

  }


  return (
    <div>
      {/* <!-- Modal --> */}
      <div class="modal fade" id="addmember" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body"  >
              <form onSubmit={addStaffHandle}>
                <div class="mb-3">
                  <label for="exampleInputEmail1" class="form-label">Staff Name</label>
                  <input type="text" class="form-control" value={staffname} onChange={(e) => setStaffname(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>

      {isLoadind ? (<h1>Loading .......</h1>) : (<StaffTable />)}



    </div>
  )
}
