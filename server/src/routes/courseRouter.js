const router = require('express').Router();

const { getAllCourses } = require('../controller/courseController.js');
const { addStaff, getAllstaff } = require('../controller/staffController.js');

router.post('/', addStaff)
router.get('/', getAllCourses)



module.exports = router;

