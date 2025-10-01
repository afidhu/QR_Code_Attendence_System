const router = require('express').Router();

const timetable = require('../controller/timetableController')

router.get('/', timetable.getalltimetable );
router.post('/', timetable.addTimetable );
router.put('/:timetable_id', timetable.updateTimetable_is_sessioned );
router.get('/:timetable_id', timetable.getalltimetableSingle );
router.get('/filter/:program_id/:class_year/:class_level/', timetable.CrFiltertimetable );


// client url=const url = `/timetable/filter/${courseId}?day=${day}&date=${date}`;


module.exports = router