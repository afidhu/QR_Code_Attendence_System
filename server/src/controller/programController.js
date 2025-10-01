
const pool = require('../connection/db')


exports.getAllProgram =async(req, resp)=>{

        const alltimetable = await pool.query('SELECT*FROM programs')

        if (alltimetable.rowCount > 0) {
            return resp.status(200).json({ status: 'success', data: alltimetable.rows });

        } else {
            return resp.status(200).json({ data: [] })
        }
}