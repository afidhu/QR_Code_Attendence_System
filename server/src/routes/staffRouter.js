const { getAllstaff, addStaff } = require('../controller/staffController.js');

const router = require('express').Router();



router.post('/', addStaff)
router.get('/', getAllstaff)



module.exports = router;