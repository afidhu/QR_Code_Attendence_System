const router =require('express').Router();

const sesseioncontroller =require('../controller/sessionsController');

router.get('/', sesseioncontroller.getallsetions);
router.post('/', sesseioncontroller.addSession);
router.post('/studentconfirmsession', sesseioncontroller.studentConfirmSessionId_PostInAttendence);






module.exports =router