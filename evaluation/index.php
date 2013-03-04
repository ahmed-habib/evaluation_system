<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instructor Control Panel</title>        
        <script  type="text/javascript" src="styles/jquery-1.8.0.js"></script>
        <script  type="text/javascript" src="styles/script.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>        
        <?php
        // put your code here
        ?>
        
        <div id="tabs">
            <ul>
                <li><a href="#fragment-1"><span>Main</span></a></li>
                <li><a href="#fragment-2"><span>Instructor</span></a></li>
                <li><a href="#fragment-3"><span>Course</span></a></li>
                <li><a href="#fragment-4"><span>Track</span></a></li>
                <li><a href="#fragment-5"><span>Students</span></a></li>
                <li><a href="#fragment-6"><span>Evaluations</span></a></li>
                <li><a href="#fragment-7"><span>Intake</span></a></li>
            </ul>
            <div id="fragment-1">
                <form method="post" action="main.php">
                    Intake:
                    <select name="intake">
                        <option value="intake32">intake32</option>                                                
                        <option value="intake33">intake33</option>                                                
                    </select>            
                    <br>
                    Track:
                    <select name="track">
                        <option value="os">Open Source</option>                        
                    </select>                    
                    <br>
                    Course:
                    <select name="course">
                        <option value="os">PHP</option>                        
                    </select>                    
                    <br>
                    Instructor:
                    <select name="instructor">
                        <option value="os">Ahmed Gneidy</option>                        
                    </select> 
                    <br>
                    Due Date:
                    <input type="text" name="due_date"/> 
                    <br>                    
                    <input type="submit" name="instructor_eval" value="Instructor Evaluation"/>                    
                    <input type="submit" name="course_eval" value="Course Evaluation"/>
                    <input type="submit" name="deactivate" value="Deactivate"/>
                    <input type="submit" name="delete" value="Delete"/>
                    <input type="submit" name="edit" value="Edit"/>
                    <input type="submit" name="late_students" value="Late Students"/>
                </form> 
                
            </div>
            <!-- ----------------------------------------------------------------------- -->
            <div id="fragment-2">
                <form method="post" action="instructor.php">
                    Name:
                    <select name="instructor_id">
                        <option value="0">Mahmoud Ouf</option>                        
                    </select>            
                    <br>
                    Title:
                    <input type="text" name="instructor_title"/> 
                    <br><br>
                    <input type="submit" name="add" value="Add"/>                    
                    <input type="submit" name="edit" value="Edit"/>
                    <input type="submit" name="delete" value="Delete"/>
                    
                </form>
            </div>
            <!-- ----------------------------------------------------------------------- -->
            <div id="fragment-3">
                <form method="post" action="course.php">
                    Name:
                    <select name="course_id">
                        <option value="0">PHP</option>                        
                    </select>            
                    <br>
                    Code:
                    <input type="text" name="course_code"/> 
                    <br><br>
                    <input type="submit" name="add" value="Add"/>                    
                    <input type="submit" name="edit" value="Edit"/>
                    <input type="submit" name="delete" value="Delete"/>
                    
                </form>
            </div>
            <!-- ----------------------------------------------------------------------- -->
            <div id="fragment-4">
                   <form method="post" action="track.php">
                    Name:
                    <select name="track_id">
                        <option value="0">Open Source</option>                        
                    </select>            
                    
                    <br><br>
                    <input type="submit" name="add" value="Add"/>                    
                    <input type="submit" name="edit" value="Edit"/>
                    <input type="submit" name="delete" value="Delete"/>
                    
                </form>                
            </div>
            <!-- ----------------------------------------------------------------------- -->
            <div id="fragment-5">
                <form method="post" action="students.php">
                    Track:
                    <select name="student_track">
                        <option value="0">Open Source</option>                        
                    </select>            
                    <br>
                    Name
                    <select name="student_name">
                        <option value="0">Farag</option>                        
                    </select>            
                    <br><br>
                    <input type="submit" name="add" value="Add"/>                    
                    <input type="submit" name="edit" value="Edit"/>
                    <input type="submit" name="delete" value="Delete"/>
                    <br><br>
                    Transfer Student:

                    Track:
                    <select name="track_old">
                        <option value="0">Open Source</option>                        
                    </select>            
                    <br>
                    Name
                    <select name="student_name">
                        <option value="0">Farag</option>                        
                    </select> 
                    <br>
                    New Track:
                    <select name="track_new">
                        <option value="0">Open Source</option>                        
                    </select>            
                    <br><br>
                    <input type="submit" name="transfer" value="Delete"/>
                </form>
            </div>
            <!-- ----------------------------------------------------------------------- -->
            <div id="fragment-6">
                <form method="post" action="evaluations.php">
                Track:
                    <select name="track">
                        <option value="0">Open Source</option>                        
                    </select>            
                    <br>
                Course:
                    <select name="course">
                        <option value="0">C++</option>                        
                    </select>            
                    <br>
                Instructor:
                <select name="instructor">
                    <option value="0">Mahmoud Ouf</option>                        
                </select>            
                <br>
                Due Date:
                    <input type="text" name="due_date"/>
                    
                <input type="submit" name="activate" value="Activate"/>
                </form>
            </div>
            <!-- ----------------------------------------------------------------------- -->
            <div id="fragment-7">
                <form method="post" action="intake.php">
                    Intake no:
                    <select name="intake_no">
                        <option value="0">33</option>                        
                    </select>            
                    
                    <br><br>
                    <input type="submit" name="set_as_current" value="Set as current"/>                    
                    <input type="submit" name="delete" value="Delete"/>
                    
            </div>
        </div>


    </body>
</html>
