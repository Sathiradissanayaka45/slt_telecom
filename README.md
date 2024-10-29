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

### Backend (PHP + MySQL)
1. **Clone this repository to your server:**
   ```bash
   git clone https://github.com/yourusername/employee-management-backend.git
1. **Create database in your MySQL database.**  

2. **Configure database credentials** in `dbh.inc.php`.


