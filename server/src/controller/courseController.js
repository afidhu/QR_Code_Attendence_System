
const pool = require('../connection/db')


exports.getAllCourses =async(req, resp)=>{

        const alltimetable = await pool.query('SELECT*FROM courses')

        if (alltimetable.rowCount > 0) {
            return resp.status(200).json({ status: 'success', data: alltimetable.rows });

        } else {
            return resp.status(200).json({ data: [] })
        }
}