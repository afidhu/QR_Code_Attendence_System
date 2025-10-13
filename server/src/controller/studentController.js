
const pool = require('../connection/db')

exports.getallStudent = async (req, resp) => {
    try {
        
    const allstudent =await pool.query('SELECT*FROM students');

    if(allstudent.rowCount >0){
        return resp.status(200).json({status:'success', data:allstudent.rows});
    }
    else{
        return resp.status(200).json(allstudent.rows)
    }
    } catch (error) {
        return resp.status(500).json({status:'fail' ,message:error.message})

    }
}



exports.addStudents = async (req, resp) => {
    try {
        const {student_name,student_reg,student_password, student_role, year, program_id,student_level} = req.body
        const addquery = await pool.query(`INSERT INTO students (student_name,student_reg,student_password,student_role,year,program_id,student_level)
             VALUES($1, $2, $3, $4, $5, $6, $7) RETURNING *`, [student_name, student_reg,student_password,student_role,year,program_id,student_level]);
        if (addquery) {
            return resp.status(201).json({ status: 'success', data: addquery.rows[0] });
        } else {
            return resp.status(404).json({ status: 'fail', message: "fail to add data" })
        }

    } catch (error) {
        return resp.status(500).json({ status: 'fail', message: error.message });
    }
}

