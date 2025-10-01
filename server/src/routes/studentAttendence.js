
const router = require('express').Router();

const studentattendence = require('../controller/studentAttendence.js');

router.get('/', studentattendence.getStudentattendence)


module.exports = router;