const { response } = require("express");
const pool = require("../connection/db")


exports.getallsetions = async (req, resp) => {
    const allsesions = await pool.query('SELECT*FROM sessions ORDER by created_at DESC ');

    if (allsesions.rowCount > 0) {
        return resp.status(200).json(allsesions.rows)
    }
}



/////////// Create session

exports.addSession = async (req, resp) => {
    try {
        const { timetable_id, expired_time } = req.body;
        const addSessionQl = await pool.query('INSERT INTO sessions (timetable_id, expired_time) VALUES($1, $2) RETURNING *', [timetable_id, expired_time]);
        if (addSessionQl) {
            return resp.status(201).json({ status: 'success', data: addSessionQl.rows[0] });
        }
        else {
            return resp.status(404).json('fail to create session')
        }
    } catch (error) {
        return resp.status(500).json({ status: 'fail', message: error.message })

    }
}


//////// student  after captured session_id now insert into attendence table with his device_id and student_reg and other details


exports.studentConfirmSessionId_PostInAttendence = async (req, resp) => {
    try {
        const { session_id, device_id, student_reg, student_sign, device_name, class_year, program_id, class_level } = req.body;
        const checkSession_id = await pool.query('SELECT EXISTS(SELECT session_id FROM sessions WHERE session_id =$1)', [session_id]);
        if (checkSession_id.rows[0].exists) {
            const checkIfSpecificStudent = await pool.query("SELECT * FROM sessions WHERE session_id = $1", [session_id]);
            const checkIfSpecificStudentOfTimtable = await pool.query("SELECT * FROM timetable WHERE timetable_id = $1", [checkIfSpecificStudent.rows[0].timetable_id]);

            if (
                class_year === checkIfSpecificStudentOfTimtable.rows[0].class_year &&
                program_id === checkIfSpecificStudentOfTimtable.rows[0].program_id &&
                class_level === checkIfSpecificStudentOfTimtable.rows[0].class_level
            ) {



                const checkSession_idIfExpired = await pool.query("SELECT*FROM sessions WHERE session_id = $1", [session_id]);

                const { created_time, expired_time } = checkSession_idIfExpired.rows[0];

                // Convert to JS Date
                const createdAt = new Date(created_time);  // full timestamp
                const expiresAt = new Date(createdAt.getTime() + expired_time * 60 * 1000); // add minutes

                if (new Date() > expiresAt) {
                    resp.status(400).json("Session has expired");
                } else {
                    //   resp.status(200).json(`Session is still valid within ${expired_time} min`);
                    ////////insert student data to attendence table
                    // const checksession_IdExist = await pool.query("SELECT EXISTS( SELECT session_id FROM attendence WHERE session_id =$1)", [session_id]);
                    // if (!checksession_IdExist.rows[0].exists) {
                    const checksession_IdExistAndDevice_Id = await pool.query("SELECT EXISTS(SELECT 1 FROM attendence WHERE session_id=$1 AND device_id=$2)", [session_id, device_id]);
                    if (!checksession_IdExistAndDevice_Id.rows[0].exists) {

                        ///Now Insert Data to attendence Table 
                        if (session_id !== null && session_id !== "" && device_id !== null && device_id !== "" && student_reg !== null && student_reg !== "" && student_sign !== null && student_sign !== "" && device_name !== null && device_name !== "") {
                            const studentMakeSign = await pool.query("INSERT INTO attendence (session_id,student_reg,student_sign,device_id,device_name) VALUES($1,$2,$3,$4,$5) RETURNING *", [session_id, student_reg, student_sign, device_id, device_name]);

                            if (studentMakeSign) {
                                // resp.status(201).json({ status: 'success', data: studentMakeSign.rows[0] })
                                resp.status(201).json({ status: 'Success', message: 'Successfull signed' })
                            } else {
                                return resp.status(400).json('Fail to insert data in attendence ')
                            }
                        } else {
                            return resp.status(400).json('All fields Required ')
                        }

                    } else {
                        return resp.status(403).json({ error: 'user Duplication', message: 'user Duplication or you are not owner of this device' })
                    }

                    // } else {
                    //     return resp.status(403).json({ error: 'Session id exist', message: 'You are Already Singned' });
                    // }
                }
            } else {
                console.log('Yor you are not bellow to this class"')

                return resp.status(403).json({ error: "forbidded", message: "Yor you are not bellow to this class" })
            }


        } else {

            return resp.status(403).json({ error: 'fail', message: 'Please Session Not Created' });
        }



        // } else {
        //     return resp.status(403).json('You are Not belong this Class')
        // }
    } catch (error) {
        return resp.status(500).json({ status: "fail", message: error.message })

    }
}