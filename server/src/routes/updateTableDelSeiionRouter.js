
const router = require('express').Router();

const timetableUpdate = require('../controller/updateTimebale_del_sessionControl.js')

router.get('/:timetable_id',timetableUpdate.updateTableDeleteSession  );



module.exports = router