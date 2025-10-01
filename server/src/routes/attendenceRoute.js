const router= require('express').Router()

const attendencecontroller =require('../controller/attendeceController');

router.get('/', attendencecontroller.getAttendeceData);
router.post('/', attendencecontroller.postDataToAtendance);




module.exports =router