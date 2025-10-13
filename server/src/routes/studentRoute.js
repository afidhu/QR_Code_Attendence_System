const router = require('express').Router();

const studentscontroller = require('../controller/studentController');

router.get('/', studentscontroller.getallStudent)
router.post('/', studentscontroller.addStudents)


module.exports = router;