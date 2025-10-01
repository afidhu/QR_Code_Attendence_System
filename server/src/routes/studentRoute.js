const router = require('express').Router();

const studentscontroller = require('../controller/studentController');

router.get('/', studentscontroller.getallStudent)


module.exports = router;