const pool = require('../connection/db');



//////////// get all Time Table
exports.getalltimetable = async (req, resp) => {
    try {

        // const alltimetable = await pool.query
        // ('SELECT t.*, c.course_name,s.staff_name FROM timetable t INNER JOIN courses c ON t.course_id = c.course_id INNER JOIN staff s ON t.lecture_id = s.staff_id');

        const alltimetable = await pool.query('SELECT*FROM timetable')

        if (alltimetable.rowCount > 0) {
            return resp.status(200).json({ status: 'success', data: alltimetable.rows });

        } else {
            return resp.status(200).json({ data: [] })
        }


    } catch (error) {
        return resp.status(500).json({ status: 'fail', message: error.message })

    }
}
//////////// get  Time Table BY ID
exports.getalltimetableSingle = async (req, resp) => {
    try {
           const{timetable_id} = req.params;
        const alltimetable = await pool.query('SELECT*FROM timetable WHERE timetable_id =$1 ', [timetable_id])

        if (alltimetable.rowCount > 0) {
            return resp.status(200).json({ status: 'success', data: alltimetable.rows[0] });

        } else {
            return resp.status(200).json({ data: [] })
        }


    } catch (error) {
        return resp.status(500).json({ status: 'fail', message: error.message })

    }
}


///////////Admin add time Table///////////////

exports.addTimetable = async (req, resp) => {
    try {
        const { course_id, day, date, start_time, end_time, lecture_id, class_year ,program_id ,class_level} = req.body
        const addquery = await pool.query(`INSERT INTO timetable (course_id, day, date, start_time, end_time, lecture_id, class_year ,program_id ,class_level)
             VALUES($1, $2, $3, $4, $5, $6, $7,$8,$9)  RETURNING *`, [course_id, day, date, start_time, end_time, lecture_id, class_year ,program_id ,class_level]);
        if (addquery) {
            return resp.status(201).json({ status: 'success', data: addquery.rows[0] });
        } else {
            return resp.status(402).json({ status: 'fail', message: "fail to add data" })
        }

    } catch (error) {
        return resp.status(500).json({ status: 'fail', message: error.message });
    }
}


///////////CR Filter timetable By Day and Date ///////////

exports.CrFiltertimetable = async (req, resp) => {
    try {

        const { program_id, class_year, class_level } = req.params;
        let { day, date } = req.query;


        //         // Treat empty strings as null
        //         day = day && day.trim() !== "" ? day : null;
        //         date = date && date.trim() !== "" ? date : null;


        // if (day && !["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"].includes(day)) {
        //   return resp.status(400).json({ error: "Invalid day" });
        // }

        // if (date && isNaN(Date.parse(date))) {
        //   return resp.status(400).json({ error: "Invalid date format" });
        // }


        ///////////////////This is only filter
        //     const query = `
        //   SELECT *
        //   FROM timetable
        //   WHERE course_id = $1
        //     AND ($2::text IS NULL OR day = $2)
        //     AND ($3::date IS NULL OR DATE(date) = $3)
        // `;

        const checkIfprogram_idClass_yearClass_levelExist_ = await pool.query('SELECT EXISTS(SELECT (program_id,class_year,class_level) FROM timetable WHERE program_id=$1 AND class_year =$2 AND class_level=$3)', [program_id, class_year, class_level]);
        if (!checkIfprogram_idClass_yearClass_levelExist_.rows[0].exists) {
            return resp.status(403).json({ status: 'fail', message: 'You are not assigned as CR of any program' });
        }
        else {
            day = day && day.trim() !== "" ? day : null;
            date = date && date.trim() !== "" ? date : null;

            const query = `
                            SELECT 
                                t.timetable_id,
                                t.day,
                                t.date,
                                t.start_time,
                                t.end_time,
                                t.class_year,
                                t.class_level,
                                t.program_id,
                                t.is_sessioned,
                                p.program_name
                            FROM timetable t
                            INNER JOIN programs p ON t.program_id = p.program_id
                            WHERE t.program_id = $1
                            AND t.class_year = $2
                            AND t.class_level = $3
                            AND ($4::text IS NULL OR t.day = $4)
                            AND ($5::date IS NULL OR DATE(t.date) = $5)
                        `;

            const filtertimetable = await pool.query(query, [
                program_id,
                class_year,
                class_level,
                day,
                date,
            ]);
            if (filtertimetable.rowCount > 0) {
                return resp.status(200).json({ status: `search result ${filtertimetable.rowCount}`, data: filtertimetable.rows })
            } else {
                return resp.status(404).json('Specified timetable not found')
            }
        }
    } catch (error) {
        return resp.status(500).json({ status: 'fail', message: error.message })

    }
}

///////////HERE bellow update Timetable at field , is_sessioned=true///////////

exports.updateTimetable_is_sessioned = async(req, resp)=>{
    try {
        const{timetable_id} = req.params;
        const updateTableresult = await pool.query("UPDATE timetable SET is_sessioned=true WHERE timetable_id =$1 RETURNING *",[timetable_id])
      
        if(updateTableresult){qr_web
        return resp.status(200).json(updateTableresult.rows[0])
        }
        else{
            return resp.status(400).json('Fail to update')
        }
    } catch (error) {
        return resp.status(400).json({msg:'internal error', error:error.message})
        
    }
}