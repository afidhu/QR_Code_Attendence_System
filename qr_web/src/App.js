import logo from './logo.svg';
import './App.css';

import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import MasterLayout from './components/layout/MasterLayout.js';
import MainDashboard from './components/pages/MainDashboard.js';
import IsmTmetable from './components/pages/timetable/IsmTmetable.js';
import Staff from './src2/components/pages/staffs/Staff.js';
import IsmIndex from './components/pages/students/IsmIndex.js';
import Csnindex from './components/pages/students/Csnindex.js';
// import Login from '../components/auth/Login.js';
// import Register from '../components/auth/Register.js';
// import MainDashboard from '../components/pages/MainDashboard.js';
// import Staff from '../components/pages/staffs/Staff.js';
// import IsmIndex from '../components/pages/students/ism/IsmIndex.js';
// import Csnindex from '../components/pages/students/csn/Csnindex.js';
// import IsmTmetable from '../components/pages/timetable/IsmTmetable.js';
function App() {
  return (

     <BrowserRouter>

      {/* Routes */}
      <Routes>
        <Route path="/" element={<MasterLayout />} >
        {/* <Route path="/login" element={<Login/>} />
        <Route path="/register" element={<Register />} /> */}
        <Route path="/dashboard" element={<MainDashboard />} />
        <Route path="/staff" element={<Staff/>} />
        <Route path="/ism-index" element={<IsmIndex/>} />
        <Route path="/csn-index" element={<Csnindex/>} />
        <Route path="/ism-timetable" element={<IsmTmetable/>} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
