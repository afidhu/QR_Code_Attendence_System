
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