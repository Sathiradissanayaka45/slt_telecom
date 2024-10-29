<?php

class Employee {
    public $empid;
    public $fullname;
    public $number;
    public $department;
    public $username;
    public $password;

    public function __construct($fullname, $number, $department, $username, $password, $empid = null) {
        $this->empid = $empid;
        $this->fullname = $fullname;
        $this->number = $number;
        $this->department = $department;
        $this->username = $username;
        $this->password = password_hash($password, PASSWORD_DEFAULT); // Hash the password for security
    }
}
?>
