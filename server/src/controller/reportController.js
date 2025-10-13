const pool = require('../connection/db')


exports.generateAttendenceReport = async (req, resp) => {
    const { student_reg } = req.query

    const alltimetable = await pool.query('SELECT*FROM attendence WHERE student_reg =$1', [student_reg])

    if (alltimetable.rowCount > 0) {
        const studentTimetableData = pool.query(   `SELECT 
         a.*, 
         s.*, 
         t.*, 
         c.course_name,
         st.staff_name
       FROM attendence a
       JOIN sessions s ON a.session_id = s.session_id
       JOIN timetable t ON s.timetable_id = t.timetable_id
       LEFT JOIN courses c ON t.course_id = c.course_id
       LEFT JOIN staff st ON t.lecture_id = st.staff_id
       WHERE a.student_reg = $1`,
      [student_reg])

        /////Make joins of table
        if ( (await studentTimetableData).rowCount >0) {
            resp.status(200).json((await studentTimetableData).rows)
        } else {
            resp.status(400).json('no daata')
        }

    } else {
        return resp.status(200).json({ data: [] })
    }
}