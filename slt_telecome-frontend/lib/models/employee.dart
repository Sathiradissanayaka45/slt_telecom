class Employee {
  final int? empid;
  final String fullname;
  final String number;
  final String department;
  final String username;
  final String password;

  Employee({
    this.empid,
    required this.fullname,
    required this.number,
    required this.department,
    required this.username,
    required this.password,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      empid: json['empid'],
      fullname: json['fullname'],
      number: json['number'],
      department: json['department'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'number': number,
      'department': department,
      'username': username,
      'password': password,
    };
  }
}
