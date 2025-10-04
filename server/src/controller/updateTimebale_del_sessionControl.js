
const pool = require('../connection/db')



exports.updateTableDeleteSession = async (req, resp) => {
    try {
        const is_sessioned = false;
        const { timetable_id } = req.params
        const alltimetable = await pool.query('UPDATE timetable SET is_sessioned=$1 WHERE timetable_id=$2 RETURNING *', [is_sessioned, timetable_id])

        if (alltimetable) {
            // const sessionTable = await pool.query('DELETE  FROM sessions WHERE timetable_id =$1', [timetable_id])

            // if (sessionTable) {
            //     return resp.status(200).json({ status: 'success', timetable: alltimetable.rows, seeion:sessionTable.rows });
            // }
            // else {
            //     return resp.status(400).json('fail to delete sesion')
            // }

  return resp.status(200).json({ status: 'success', timetable: alltimetable.rows, });
        } else {
            return resp.status(400).json('fail')
        }

    } catch (error) {
        return resp.status(400).json(`'error at ${error.message}`)
    }
}