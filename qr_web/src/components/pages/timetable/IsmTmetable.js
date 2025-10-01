import React, { useEffect, useState } from 'react'
import DateTime from '../../custumUI/DateTime.js'
import { Courses, DaysList, Programs, StaffMembers, YearSelect } from '../../custumUI/Seleects.js'
import API from '../../Api/ApiProvider.js'
import axios from 'axios'
import { TimetableIsm1, TimetableIsm2, TimetableIsm3 } from '../../custumUI/Timetable.js'



export default function IsmTmetable() {
    const [isLoadind, setIsLoadind] = useState(false)

    const [course_id, setcourse_id] = useState('')
    const [day, setday] = useState('')
    const [date, setdate] = useState(null)
    const [start_time, setstart_time] = useState(null)
    const [end_time, setend_time] = useState(null)
    const [lecture_id, setlecture_id] = useState('')
    const [class_year, setclass_year] = useState('')
    const [program_id, setprogram_id] = useState('')
    const [class_level, setclass_level] = useState('')

    // const [isIsm1, setIsIsm1] = useState(false)
    // const [isIsm2, setIsIsm2] = useState(false)
    // const [isIsm3, setIsIsm3] = useState(false)

    const addTimeTableHandle = async (e) => {
        e.preventDefault()
        try {
            const data = {
                course_id: course_id,
                day: day,
                date: date,
                start_time: start_time,
                end_time: end_time,
                lecture_id: lecture_id,
                class_year: class_year,
                program_id: program_id,
                class_level: class_level

            }
            console.log('object', data)
            setTimeout(async () => {
                await axios.post(`${API.timetables}`, data)

                    .then((resp) => {
                        console.log("data are", resp.data)
                    })
                    .catch((e) => {
                        setIsLoadind(true)
                        console.log("error at ", e.message)
                    })
                setIsLoadind(false)
                window.location.reload()
            }, 400)

        } catch (error) {
            setIsLoadind(false)
            alert('internla error :', error.message)
        }

    }
   const currentYear = new Date().getFullYear();
  const startYear = currentYear - 100;

  const years = [];
  for (let year = currentYear; year >= startYear; year--) {
    years.push(year);
  }

    return (
        <div>
            {/* <!-- Modal for ISM1--> */}
            <div class="modal fade" id="addToism1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body"  >
                            <form onSubmit={addTimeTableHandle}>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">course Name</label>
                                    <Courses course={setcourse_id} />
                                    {/* <input type="text" class="form-control" value={course_id} onChange={(e) => setcourse_id(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" /> */}
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">day</label>
                                    <DaysList dayValue={setday} />
                                    {/* <input type="text" class="form-control" value={setday} onChange={(e) => setday(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" /> */}
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">date</label>
                                    <input required type="date" class="form-control" value={date} onChange={(e) => setdate(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">start_time</label>
                                    <input required type="time" class="form-control" value={start_time} onChange={(e) => setstart_time(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">end_time</label>
                                    <input required type="time" class="form-control" value={end_time} onChange={(e) => setend_time(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">lecture_id</label>
                                    <StaffMembers staffId={setlecture_id} />
                                    {/* <input type="text" class="form-control" value={setlecture_id} onChange={(e) => setlecture_id(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" /> */}
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">class_year</label>

                                    <YearSelect studyYear ={setclass_year} />
       
                          {/* <input required type="text" class="form-control" value={class_year} onChange={(e) => setclass_year(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" /> */}
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">program_id</label>
                                    <Programs programId={setprogram_id} />
                                    {/* <input type="text" class="form-control" value={setprogram_id} onChange={(e) => setprogram_id(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" /> */}
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">class_level</label>
                                    <input required type="text" class="form-control" value={class_level} onChange={(e) => setclass_level(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
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

            {/* TABLES */}

            <div class="row">
                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">ISM1</div>
                            <div class="ms-md-auto py-2 py-md-0 mx-3" style={{ float: "right" }} >
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addToism1">
                                    Add Member
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card-sub">
                                <span><h5>Study Year:<b className='text-success' > <DateTime /></b></h5></span>
                            </div>
                            <table class="table mt-3">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">course_id</th>
                                        <th scope="col">day</th>
                                        <th scope="col">date</th>
                                        <th scope="col">start_time</th>
                                        <th scope="col">end_time</th>
                                        <th scope="col">lecture_id</th>
                                        <th scope="col">class_year</th>
                                        <th scope="col">program_id</th>
                                        <th scope="col">class_level</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <TimetableIsm1 />

                            </table>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">ISM2</div>
                            <div class="ms-md-auto py-2 py-md-0 mx-3" style={{ float: "right" }} >
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addToism1">
                                    Add Member
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card-sub">
                                <span><h5>Study Year:<b className='text-success' > <DateTime /></b></h5></span>
                            </div>
                            <table class="table mt-3">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">course_id</th>
                                        <th scope="col">day</th>
                                        <th scope="col">date</th>
                                        <th scope="col">start_time</th>
                                        <th scope="col">end_time</th>
                                        <th scope="col">lecture_id</th>
                                        <th scope="col">class_year</th>
                                        <th scope="col">program_id</th>
                                        <th scope="col">class_level</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <TimetableIsm2 />
                            </table>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">ISM3</div>
                            <div class="ms-md-auto py-2 py-md-0 mx-3" style={{ float: "right" }} >
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addToism1">
                                    Add Member
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card-sub">
                                <span><h5>Study Year:<b className='text-success' > <DateTime /></b></h5></span>
                            </div>
                            <table class="table mt-3">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">course_id</th>
                                        <th scope="col">day</th>
                                        <th scope="col">date</th>
                                        <th scope="col">start_time</th>
                                        <th scope="col">end_time</th>
                                        <th scope="col">lecture_id</th>
                                        <th scope="col">class_year</th>
                                        <th scope="col">program_id</th>
                                        <th scope="col">class_level</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <TimetableIsm3 />

                            </table>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    )
}
