// index.js
require('dotenv').config();
const express = require('express');
const app = express();
const cors = require('cors');

const PORT = process.env.PORT || 3000;


app.use(cors())
app.use(express.json())


app.use('/attendence', require('./src/routes/attendenceRoute'));
app.use('/staff', require('./src/routes/staffRouter.js'));
app.use('/course', require('./src/routes/courseRouter.js'));
app.use('/program', require('./src/routes/progrmaRouter.js'));
app.use('/session', require('./src/routes/sessionsRoute'));
app.use('/timetable', require('./src/routes/timetableRoute'));
app.use('/student', require('./src/routes/studentRoute'));
app.use('/auth', require('./src/routes/authRoute'));



app.listen(PORT, () => {
  console.log(`Port is running at :${PORT}`);
});
