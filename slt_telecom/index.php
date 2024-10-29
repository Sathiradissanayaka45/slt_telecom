<?php
require_once __DIR__ . '/includes/dbh.inc.php';
require_once __DIR__ . '/includes/EmployeeRepository.php';
require_once __DIR__ . '/controllers/EmployeeController.php';
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");


$repository = new EmployeeRepository($pdo);
$controller = new EmployeeController($repository);

// Example request handling (you can adapt this for a REST API or web forms)
$action = $_GET['action'] ?? 'viewAll';

// Parse JSON input if `$_POST` is empty
$inputData = $_POST;
if (empty($inputData)) {
    $inputData = json_decode(file_get_contents("php://input"), true);
}

switch ($action) {
    case 'create':
        $data = [
            'fullname' => $inputData['fullname'] ?? null,
            'number' => $inputData['number'] ?? null,
            'department' => $inputData['department'] ?? null,
            'username' => $inputData['username'] ?? null,
            'password' => $inputData['password'] ?? null
        ];
        $controller->create($data);
        echo json_encode(["status" => "Employee created successfully"]);
        break;
        
    case 'viewAll':
        $employees = $controller->viewAll();
        echo json_encode($employees);
        break;
        
    case 'view':
        $empid = $_GET['empid'];
        $employee = $controller->view($empid);
        echo json_encode($employee);
        break;
        
    case 'update':
        $empid = $inputData['empid'] ?? $_POST['empid'];
        $data = [
            'fullname' => $inputData['fullname'] ?? null,
            'number' => $inputData['number'] ?? null,
            'department' => $inputData['department'] ?? null,
            'username' => $inputData['username'] ?? null,
            'password' => $inputData['password'] ?? null
        ];
        $controller->update($empid, $data);
        echo json_encode(["status" => "Employee updated successfully"]);
        break;
        
    case 'delete':
        $empid = $inputData['empid'] ?? $_POST['empid'];
        $controller->delete($empid);
        echo json_encode(["status" => "Employee deleted successfully"]);
        break;

    default:
        echo json_encode(["error" => "Invalid action"]);
        break;
}
?>
