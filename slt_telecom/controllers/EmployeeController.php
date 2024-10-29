<?php
require_once __DIR__ . '/../includes/EmployeeRepository.php';

class EmployeeController {
    private $repository;

    public function __construct(EmployeeRepository $repository) {
        $this->repository = $repository;
    }

    public function create($data) {
        $employee = new Employee($data['fullname'], $data['number'], $data['department'], $data['username'], $data['password']);
        $this->repository->createEmployee($employee);
    }

    public function viewAll() {
        return $this->repository->getAllEmployees();
    }

    public function view($empid) {
        return $this->repository->getEmployeeById($empid);
    }

    public function update($empid, $data) {
        $employee = new Employee($data['fullname'], $data['number'], $data['department'], $data['username'], $data['password'], $empid);
        $this->repository->updateEmployee($employee);
    }

    public function delete($empid) {
        $this->repository->deleteEmployee($empid);
    }
}
?>
