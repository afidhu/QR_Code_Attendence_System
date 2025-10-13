import React, { useState } from 'react'
import DateTime from '../../custumUI/DateTime.js'
import { StudentListIsm1, StudentListIsm2, StudentListIsm3 } from '../../custumUI/StudentList.js'
import { Courses, Programs, YearSelect } from '../../custumUI/Seleects.js'
import axios from 'axios'
import API from '../../Api/ApiProvider.js'


export default function IsmIndex() {

        const [isLoadind, setIsLoadind] = useState(false)
    const [student_name, setstudent_name] = useState('')
    const [student_reg, setstudent_reg] = useState(null)
    const [student_password, setstudent_password] = useState(null)
    const [student_role, setstudent_role] = useState('')
    const [year, setyear] = useState('')
    const [program_id, setprogram_id] = useState('')
    const [student_level, setstudent_level] = useState('')


    const addTimeStudentHandle = async (e) => {
        e.preventDefault()
        try {
            const data = {
                student_name: student_name,
                student_reg: student_reg,
                student_password: student_password,
                student_role: student_role,
                year: year,
                program_id: program_id,
                student_level: student_level,
                // program_id: program_id,
                // class_level: class_level

            }
            console.log('object', data)
            setTimeout(async () => {
                await axios.post(`${API.students}`, data)

                    .then((resp) => {
                        console.log("data are", resp.data)
                    })
                    .catch((e) => {
                        setIsLoadind(true)
                        console.log("error at ", e.message)
                    })
                setIsLoadind(false)
                window.location.reload()
            }, 200)

        } catch (error) {
            setIsLoadind(false)
            alert('internla error :', error.message)
        }

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
                            <form onSubmit={addTimeStudentHandle}>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">student_name </label>
                                    {/* <Courses course={setcourse_id} /> */}
                                    <input type="text" class="form-control" value={student_name} onChange={(e) => setstudent_name(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">student_reg</label>
                                    <input required type="text" class="form-control" value={student_reg} onChange={(e) => setstudent_reg(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">student_password</label>
                                    <input required type="password" class="form-control" value={student_password} onChange={(e) => setstudent_password(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">student_role</label>
                                    <input required type="text" class="form-control" value={student_role} onChange={(e) => setstudent_role(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">year</label>

                                    <YearSelect studyYear={setyear} />

                                    {/* <input required type="text" class="form-control" value={class_year} onChange={(e) => setclass_year(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" /> */}
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">program_id</label>
                                    <Programs programId={setprogram_id} />
                                    {/* <input type="text" class="form-control" value={setprogram_id} onChange={(e) => setprogram_id(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" /> */}
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">student_level</label>
                                    <input required type="text" class="form-control" value={student_level} onChange={(e) => setstudent_level(e.target.value)} id="exampleInputEmail1" aria-describedby="emailHelp" />
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
                                        <th scope="col">#d</th>
                                        <th scope="col">student_name</th>
                                        <th scope="col">student_reg</th>
                                        <th scope="col">student_password</th>
                                        <th scope="col">student_role</th>
                                        <th scope="col">year</th>
                                        <th scope="col">program_id</th>
                                        <th scope="col">student_level</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <StudentListIsm1 />
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
                                        <th scope="col">#d</th>
                                        <th scope="col">student_name</th>
                                        <th scope="col">student_reg</th>
                                        <th scope="col">student_password</th>
                                        <th scope="col">student_role</th>
                                        <th scope="col">year</th>
                                        <th scope="col">program_id</th>
                                        <th scope="col">student_level</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <StudentListIsm2 />
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
                                        <th scope="col">#d</th>
                                        <th scope="col">student_name</th>
                                        <th scope="col">student_reg</th>
                                        <th scope="col">student_password</th>
                                        <th scope="col">student_role</th>
                                        <th scope="col">year</th>
                                        <th scope="col">program_id</th>
                                        <th scope="col">student_level</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <StudentListIsm3 />
                            </table>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    )
}
