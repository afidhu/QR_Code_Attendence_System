const router= require('express').Router()

const attendencecontroller =require('../controller/attendeceController');

router.get('/', attendencecontroller.getAttendeceData);
router.post('/', attendencecontroller.postDataToAtendance);
router.get('/course/:course_name', attendencecontroller.getAttendenceByCourseName);




module.exports =router