const pool = require('../connection/db');



///////get all students
exports.getAllStudents = async (req, res) => {
    try {
        const getStudent = await pool.query("SELECT*FROM students");

        return res.status(200).json({ status: 'success', data: getStudent.rows })
    } catch (error) {
        return res.status(500).json({ status: 'fail', message: error.message })

    }
}



/////////////////Register student

exports.AdminregisterStudent = async (req, resp) => {
    try {
        const { student_name, student_reg, course_id } = req.body

        const checkUserExist = await pool.query("SELECT EXIST(SELECT*FROM students WHERE student_reg =$1)", [student_reg]);
        if (checkUserExist.rows[0].exists) {
            return resp.status(403).json('User exists in database');
        }
        const registeruser = await pool.query('INSERT INTO student (student_name, student_reg, course_id) VALUES($1, $2, $3) RETURNING *', [student_name, student_reg, course_id])

        if (registeruser) {
            return resp.status(201).json({ status: 'success', data: registeruser.rows[0] })
        } else {
            return resp.status(400).send('fail to register user')
        }

    } catch (error) {
        return resp.status(500).json({ staus: 'fail', message: error.message })

    }
}



/////////////////Here student register only update data, by useing student_reg existed, only password added

exports.studentRequestRegister = async (req, resp) => {
    try {
        const { student_password, student_reg } = req.body;
        if (!student_password || !student_reg) {
            return resp.status(403).json('All fields Required')
        }
        const checkIfStudentExist = await pool.query("SELECT EXISTS(SELECT sAttendancestudent_reg FROM students WHERE student_reg =$1)", [student_reg]);
        if (checkIfStudentExist.rows[0].exists) {
            const studentUpdateSetPassword = await pool.query("UPDATE students SET student_password =$1  WHERE student_reg =$2", [student_password, student_reg]);
            if (studentUpdateSetPassword.rowCount.length != 0) {
                return resp.status(200).json({ status: 'success', data: studentUpdateSetPassword.rows[0] })
            } else {
                return resp.status(400).json({ status: 'fail to update ' })
            }


        } else {
            return resp.status(400).json('Your are Not exist or Wrong credential')
        }

    } catch (error) {
        return resp.status(500).json({ error: 'Internal error', message: error.message })

    }
}




////////////////Student Login(check, student_reg,student_password, Then take course_id, also ttake student_role)

exports.studentLogin = async (req, resp) => {
    try {
        const { student_reg, student_password } = req.body

        if (!student_reg || !student_password) {
            return resp.status(400).json('faill all credentials');
        }

        const UserlogninCheck = await pool.query("SELECT EXISTS(SELECT*FROM students WHERE student_reg =$1 AND student_password =$2 )", [student_reg, student_password]);
        if (UserlogninCheck.rows[0].exists) {
            const Userlogned = await pool.query("SELECT*FROM students WHERE student_reg =$1 AND student_password =$2 ", [student_reg, student_password]);

            if (Userlogned.rows[0].student_role === 'CR') {
                const studentTakeCourse = await pool.query("SELECT*FROM courses WHERE course_id =$1 ", [Userlogned.rows[0].course_id]);
                if (studentTakeCourse.rowCount > 0) {
                    const selectFromTimetable = await pool.query("SELECT*FROM Timetable WHERE course_id =$1 ", [studentTakeCourse.rows[0].course_id]);
                    if (selectFromTimetable.rowCount > 0) {
                        return resp.status(200).json(Userlogned.rows[0]);

                    } else {
                        return resp.status(400).json('you are not CR course for this course');
                    }
                    //  return resp.status(200).json({status:'success login', data:studentTakeCourse.rows[0]});

                }

            }

            else {
                return resp.status(200).json( Userlogned.rows[0]);

            }


        } else {
            return resp.status(403).json({ error: 'Wrong Credential login' });
        }

    } catch (error) {
        return resp.status(500).json({ staus: 'fail', message: error.message })

    }
}