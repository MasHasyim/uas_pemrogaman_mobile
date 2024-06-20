import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _fullName;
  String? _password;
  String? _confirmPassword;
  String? _role;
  String? _email;
  String? _phone;
  String? _address;
  DateTime? _birthdate;

  // FocusNodes for tracking the focus state
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  // Track if the form has been submitted to show validation messages
  bool _isSubmitted = false;

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _fullNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  void _register() {
    setState(() {
      _isSubmitted = true;
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  Future<void> _selectBirthdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _birthdate) {
      setState(() {
        _birthdate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 174, 61, 13),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Colors.white), // Mengubah warna ikon back menjadi putih
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Register',
          style: TextStyle(
            fontWeight:
                FontWeight.bold, // Membuat teks "Register" menjadi tebal
            color: Colors.white, // Mengubah warna teks "Register" menjadi putih
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/register_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 320,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 188, 93, 15).withOpacity(0.6),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Username
                    TextFormField(
                      focusNode: _usernameFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (_isSubmitted && (value == null || value.isEmpty)) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _username = value;
                      },
                    ),
                    SizedBox(height: 10),

                    // Full Name
                    TextFormField(
                      focusNode: _fullNameFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.account_circle, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (_isSubmitted && (value == null || value.isEmpty)) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _fullName = value;
                      },
                    ),
                    SizedBox(height: 10),

                    // Password
                    TextFormField(
                      focusNode: _passwordFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      validator: (value) {
                        if (_isSubmitted && (value == null || value.isEmpty)) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value;
                      },
                    ),
                    SizedBox(height: 10),

                    // Confirm Password
                    TextFormField(
                      focusNode: _confirmPasswordFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      validator: (value) {
                        if (_isSubmitted && (value == null || value.isEmpty)) {
                          return 'Please confirm your password';
                        }
                        if (value != _password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _confirmPassword = value;
                      },
                    ),
                    SizedBox(height: 10),

                    // Role in Futsal
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Role in Futsal',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.sports_soccer, color: Colors.white),
                      ),
                      dropdownColor: Color.fromARGB(255, 188, 93, 15),
                      style: TextStyle(color: Colors.white),
                      value: _role,
                      items: const [
                        DropdownMenuItem(
                          child: Text('Kipper'),
                          value: 'Kipper',
                        ),
                        DropdownMenuItem(
                          child: Text('Defender'),
                          value: 'Defender',
                        ),
                        DropdownMenuItem(
                          child: Text('Midfielder'),
                          value: 'Midfielder',
                        ),
                        DropdownMenuItem(
                          child: Text('Flank'),
                          value: 'Flank',
                        ),
                        DropdownMenuItem(
                          child: Text('Striker'),
                          value: 'Striker',
                        ),
                        DropdownMenuItem(
                          child: Text('Pivot'),
                          value: 'Pivot',
                        ),
                        DropdownMenuItem(
                          child: Text('Play Maker'),
                          value: 'Play Maker',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _role = value;
                        });
                      },
                      validator: (value) {
                        if (_isSubmitted && (value == null || value.isEmpty)) {
                          return 'Please select your role in futsal';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    // E-mail
                    TextFormField(
                      focusNode: _emailFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (_isSubmitted && (value == null || value.isEmpty)) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value ?? '')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value;
                      },
                    ),
                    SizedBox(height: 10),

                    // Phone Number
                    TextFormField(
                      focusNode: _phoneFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (_isSubmitted && (value == null || value.isEmpty)) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _phone = value;
                      },
                    ),
                    SizedBox(height: 10),

                    // Address
                    TextFormField(
                      focusNode: _addressFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Colors.white),
                        errorStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.home, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (_isSubmitted && (value == null || value.isEmpty)) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _address = value;
                      },
                    ),
                    SizedBox(height: 10),

                    // Birthdate
                    InkWell(
                      onTap: () => _selectBirthdate(context),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Birthdate',
                          labelStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                          prefixIcon:
                              Icon(Icons.calendar_today, color: Colors.white),
                        ),
                        child: Text(
                          _birthdate == null
                              ? 'Select your birthdate'
                              : '${_birthdate!.day}/${_birthdate!.month}/${_birthdate!.year}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Register Button
                    ElevatedButton(
                      onPressed: _register,
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
