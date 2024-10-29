<?php
require_once __DIR__ . '/dbh.inc.php';
require_once __DIR__ . '/../models/Employee.php';

class EmployeeRepository {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function createEmployee(Employee $employee) {
        $sql = "INSERT INTO employee (fullname, number, department, username, password) VALUES (:fullname, :number, :department, :username, :password)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            'fullname' => $employee->fullname,
            'number' => $employee->number,
            'department' => $employee->department,
            'username' => $employee->username,
            'password' => $employee->password
        ]);
    }

    public function getEmployeeById($empid) {
        $sql = "SELECT * FROM employee WHERE empid = :empid";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['empid' => $empid]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function getAllEmployees() {
        $sql = "SELECT * FROM employee";
        $stmt = $this->pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function updateEmployee(Employee $employee) {
        $sql = "UPDATE employee SET fullname = :fullname, number = :number, department = :department, username = :username, password = :password WHERE empid = :empid";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([
            'fullname' => $employee->fullname,
            'number' => $employee->number,
            'department' => $employee->department,
            'username' => $employee->username,
            'password' => $employee->password,
            'empid' => $employee->empid
        ]);
    }

    public function deleteEmployee($empid) {
        $sql = "DELETE FROM employee WHERE empid = :empid";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['empid' => $empid]);
    }
}
?>
