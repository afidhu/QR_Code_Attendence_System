import React from 'react'
import DateTime from '../../custumUI/DateTime.js'


export default function Csnindex() {
  return (
    <div>
                    {/* TABLES */}

            <div class="row">
                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">ISM1</div>
                            <div class="ms-md-auto py-2 py-md-0 mx-3" style={{ float: "right" }} >
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addToism1">
                                    Add Member
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card-sub">
                                <span><h5>Study Year:<b className='text-success' > <DateTime /></b></h5></span>
                            </div>
                            <table class="table mt-3">
                                <thead>
                                    <tr>
                                        <th scope="col">#dfghj</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                               {/* <StudentList/> */}
                            </table>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">ISM3</div>
                            <div class="ms-md-auto py-2 py-md-0 mx-3" style={{ float: "right" }} >
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addmember">
                                    Add Member
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card-sub">
                                Add
                                <code class="highlighter-rouge">.table-striped</code> to
                                rows the striped table
                            </div>
                            <table class="table table-striped mt-3">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td colspan="2">Larry the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="card-sub">
                                Add
                                <code class="#highlighter-rouge">.table-striped-bg-*states</code>
                                to change background from striped rows
                            </div>
                            <table class="table table-striped table-striped-bg-black mt-3">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td colspan="2">Larry the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-striped table-striped-bg-danger mt-4">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td colspan="2">Larry the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">RISM2</div>
                            <div class="ms-md-auto py-2 py-md-0 mx-3" style={{ float: "right" }} >
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addmember">
                                    Add Member
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card-sub">
                                Create responsive tables by wrapping any table with
                                <code class="highlighter-rouge">.table-responsive</code>
                                <code class="highlighter-rouge">DIV</code> to make them
                                scroll horizontally on small devices
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                            <th>Table heading</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                            <td>Table cell</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
    </div>
  )
}
