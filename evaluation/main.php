<?php
    ///////////////// Instructor Evaluation /////////////////
    if(isset($_POST['instructor_eval']))
    {
        echo "<title>Instructor Evaluation</title>";
    }
    ///////////////// Course Evaluation /////////////////
    if(isset($_POST['course_eval']))
    {
        echo "<title>Course Evaluation</title>";
    }
    ///////////////// Deactivate Evaluation /////////////////
    if(isset($_POST['deactivate']))
    {
        echo "<title>Deactivate</title>";
    }
    
    ///////////////// Delete Evaluation /////////////////
    if(isset($_POST['delete']))
    {
        echo "<title>Delete</title>";
    }
    
    ///////////////// Edit/////////////////
    if(isset($_POST['edit']))
    {
        echo "<title>Edit</title>";
    }
    
    ///////////////// Late Students /////////////////
    if(isset($_POST['late_students']))
    {
        echo "<title>Late Students</title>";
    }
    
?>
