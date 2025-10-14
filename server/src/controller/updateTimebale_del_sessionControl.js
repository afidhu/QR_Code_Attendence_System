
const pool = require('../connection/db')



exports.updateTableDeleteSession = async (req, resp) => {
    try {
        const is_sessioned = false;
        const { timetable_id } = req.params
        const getsessionId = await pool.query("SELECT*FROM sessions WHERE  timetable_id =$1", [timetable_id])
        const deleteAttendence = await pool.query(' DELETE  FROM attendence WHERE session_id =$1', [getsessionId.rows[0].session_id])
        console.log(deleteAttendence.rowCount)
        if (deleteAttendence.rowCount ===0) {

            const deletesession = await pool.query(' DELETE  FROM sessions WHERE timetable_id =$1', [getsessionId.rows[0].session_id])
            if (deletesession) {
                const alltimetable = await pool.query('UPDATE timetable SET is_sessioned=$1 WHERE timetable_id=$2 RETURNING *', [is_sessioned, timetable_id])
                if (alltimetable) {
                    return resp.status(200).json({ status: 'success', timetable: alltimetable.rows,});

                } else {
                    return resp.status(400).json('fail to update  timetable')
                }

            } else {
                return resp.status(400).json('fail to delete sesion')
            }
        } else {
            return resp.status(400).json('fail to delete attendences')
        }
    } catch (error) {
        return resp.status(400).json(`'error at ${error.message}`)
    }
}