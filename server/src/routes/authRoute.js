const router = require('express').Router();
const authcontroller = require('../controller/authController')


router.get('/students',authcontroller.getAllStudents)
router.post('/admin_register_student',authcontroller.AdminregisterStudent)
router.post('/login',authcontroller.studentLogin)
router.post('/register',authcontroller.studentRequestRegister)


module.exports= router