const { getAllProgram } = require('../controller/programController.js');

const router = require('express').Router();



router.get('/', getAllProgram)



module.exports = router;



