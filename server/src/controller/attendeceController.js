
const pool = require('../connection/db')


/////////Get all Attendence data
exports.getAttendeceData = async (req, resp) => {

  try {
      const reqult = await pool.
        query(`SELECT a.*, s.student_name, c.course_name, t.start_time,t.end_time,t.day,st.staff_name FROM attendence a INNER JOIN students s ON a.student_reg = s.student_reg
                INNER JOIN sessions se  ON a.session_id = se.session_id
                INNER JOIN timetable t  ON se.timetable_id = t.timetable_id
                INNER JOIN courses  c  ON t.course_id = c.course_id
                INNER JOIN staff    st ON t.lecture_id = st.staff_id
            `);

        //      const reqult =await pool.
        // query('SELECT*FROM attendence')

        if(reqult.rowCount >0){
            return resp.status(200).json({ status: 'success', data: reqult.rows })
        }else{
            return resp.status(200).json({ status: 'success', data: reqult.rows })
        }
    
  } catch (error) {

    return resp.status(500).json({status:'fail', message:error.message})
    
  }
    
}




/////////// student asidned in Atendances

exports.postDataToAtendance= async(req, resp) =>{
    try {
        const{session_id,student_reg,student_sign,device_id,device_name} = req.body
        const addAttendance = await pool.query(`INSERT INTO attendence (session_id, student_reg, student_sign, device_id, device_name)
                                                 VALUES($1, $2, $3, $4, $5) RETURNING *`,[session_id, student_reg, student_sign,device_id ,device_name ]);

        if(addAttendance){
            return resp.status(201).json({status:'success', data:addAttendance.rows[0]})
        }
        else{
            return resp.status(404).send('fail to make attendance');
        }
        
    } catch (error) {
        return resp.status(500).json({status:'fail', messaage:error.messaage})
        
    }
}


