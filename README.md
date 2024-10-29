# slt_telecom
backend development internship task using PHP and Flutter crud operations
# Simple Employee Management Application (CRUD)

This project is a **Simple Employee Management Application** built using **Flutter**, **PHP**, and **MySQL**. It allows users to perform **CRUD operations** (Create, Read, Update, Delete) on employee data through an intuitive user interface.

## Features

- **Add Employee**: Register new employees with full details.
- **View Employee List**: See all employees.
- **Edit Employee**: Modify existing employee information.
- **Delete Employee**: Remove employee records when needed.
- **Responsive Design**: Works well on mobile and tablet.

## Project Architecture

- **Frontend**: Flutter - for the cross-platform mobile app interface.
- **Backend**: PHP - serves as the API provider for database operations.
- **Database**: MySQL - securely stores employee information.

## Backend Endpoints

Replace `http://your_network_ip_address/slt_telecom/index.php` with the actual URL of your backend:

- **Create Employee**: `POST {BASE_URL}?action=create`
- **View All Employees**: `GET {BASE_URL}?action=viewAll`
- **Update Employee**: `PUT {BASE_URL}?action=update`
- **Delete Employee**: `DELETE {BASE_URL}?action=delete`

## Installation

1. **Clone this repository to your server:**
   ```bash
   git clone https://github.com/Sathiradissanayaka45/slt_telecom
   
### Backend (PHP + MySQL)

1. **Create database in your MySQL database.**  

2. **Configure database credentials** in `dbh.inc.php`.

## Frontend (Flutter)

1. **Navigate into the frontend folder and install dependencies.**
   ```bash
   flutter pub get

2. **Update the backend URL in your Flutter app to match your server by modifying the `api_service.dart` file located in the `lib/services` folder:**

   ```dart
   // lib/services/api_service.dart
   final String baseUrl = "YOUR_BACKEND_URL";

3. **Run the app on an emulator or device**
   ```bash
   flutter run

## Usage

1. **Open the app** on your device.
2. **Add a New Employee**: Use the **Add Employee** form to enter new employee details.
3. **Manage Employees**: View, edit, or delete employees directly from the employee list.

Enjoy using the app for seamless employee management!

   


