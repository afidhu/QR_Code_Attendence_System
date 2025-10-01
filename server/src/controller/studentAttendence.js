const pool = require('../connection/db')


exports.getStudentattendence =async(req, resp)=>{
    const{student_reg} = req.query

        const alltimetable = await pool.query('SELECT*FROM attendence WHERE student_reg =$1',[student_reg])

        if (alltimetable.rowCount > 0) {
            return resp.status(200).json({ status: 'success', data: alltimetable.rows });

        } else {
            return resp.status(200).json({ data: [] })
        }
}