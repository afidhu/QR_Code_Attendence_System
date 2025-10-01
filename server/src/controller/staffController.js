
const pool = require('../connection/db')


exports.addStaff = async(req, resp)=>{
    const{staff_name} = req.body

            const registeruser = await pool.query('INSERT INTO staff (staff_name) VALUES($1) RETURNING *', [staff_name])

        if (registeruser) {
            return resp.status(201).json({ status: 'success', data: registeruser.rows[0] })
        } else {
            return resp.status(400).send('fail to register user')
        }
}


exports.getAllstaff =async(req, resp)=>{

        const alltimetable = await pool.query('SELECT*FROM staff')

        if (alltimetable.rowCount > 0) {
            return resp.status(200).json({ status: 'success', data: alltimetable.rows });

        } else {
            return resp.status(200).json({ data: [] })
        }
}