import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _RformKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String _name = '';
  String _email = '';
  String _phone = '';
  String _password = '';

  void _register() {
    if (_RformKey.currentState!.validate()) {
      print('Nombre: $_name');
      print('Correo: $_email');
      print('Teléfono: $_phone');
      print('Contraseña: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _RformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  } else if (value.length < 3 || value.length > 10) {
                    return 'El nombre debe tener entre 3 y 10 caracteres';
                  }
                  _name = value;
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu correo';
                  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@+[a-zA-Z]{2,4}\.edu\.hn$').hasMatch(value)) {
                    return 'Por favor ingresa un correo válido que termine en .edu.hn';
                  }
                  _email = value;
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Teléfono'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu teléfono';
                  } else if (!RegExp(r'^[39][0-9]{7}$').hasMatch(value)) {
                    return 'El teléfono debe comenzar con 3 o 9 y tener exactamente 8 dígitos';
                  }
                  _phone = value;
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una contraseña';
                  } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[!@#$&*]).{8,}$').hasMatch(value)) {
                    return 'La contraseña debe tener al menos 8 caracteres, una mayúscula y un carácter especial';
                  }
                  _password = value;
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor confirma tu contraseña';
                  } else if (value != _passwordController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.blue, // Color del texto del botón
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Borde redondeado del botón
                  ),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8), // Padding del botón
                ),
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}