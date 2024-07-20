import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _LformKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _email = '';
  String _password = '';

  void _login() {
    if (_LformKey.currentState!.validate()) {
      if (_email == 'saubdy.ramirez@unah.hn' &&
          _password == '20172400114') {
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: _email,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Correo o contraseña incorrectos')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _LformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Correo institucional'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu correo';
                      }
                      _email = value;
                      return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Contraseña'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu contraseña';
                        }
                      _password = value;
                      return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, 
                        backgroundColor: Colors.blue, // Color del texto del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Borde redondeado del botón
                        ),
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8), // Padding del botón
                      ),
                      child: Text('Iniciar Sesión'),
                    ),
                    ElevatedButton( 
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: Colors.blue, // Color del texto del botón
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Borde redondeado del botón
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8), // Padding del botón
                      ),
                      child: Text('Registrate'),
                    ),
                  ],
          ),
        ),
          
      ),
    );
  }
}