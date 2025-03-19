import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playground/data/constants.dart';
import 'package:playground/views/widget_tree.dart';

class LoginFormWidget extends StatefulWidget {
  final bool isLogin;
  const LoginFormWidget({super.key, required this.isLogin});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final int _minPasswordLength = 6;
  bool _isLoading = false;
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'ujsoj@sjs.com');
    _passwordController = TextEditingController(text: 'asdijoijsio');
    _emailController.addListener(_onEmailChanged);
  }

  void _onEmailChanged() {
    debugPrint(_emailController.text);
  }

  @override
  void dispose() {
    _emailController.removeListener(_onEmailChanged);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorText = '';
    });

    try {
      if (widget.isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      }

      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => WidgetTree(title: 'Home')),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      String error;
      switch (e.code) {
        case 'weak-password':
          error = 'La password fornita è troppo debole.';
          break;
        case 'email-already-in-use':
          error = 'Esiste già un account per questa email.';
          break;
        default:
          error = e.message ?? 'Si è verificato un errore.';
      }
      setState(() {
        _errorText = error;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextField(
            label: 'Email',
            hint: 'Inserisci la tua email',
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Per favore inserisci la tua email';
              }
              if (!emailRegex.hasMatch(value)) {
                return 'Inserisci una email valida';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          _buildTextField(
            label: 'Password',
            hint: 'Inserisci la tua password',
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Per favore inserisci la password';
              }
              if (value.length < _minPasswordLength) {
                return 'La password deve essere di almeno $_minPasswordLength caratteri';
              }
              return null;
            },
          ),
          if (_errorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                _errorText,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: _submit,
            child:
                _isLoading
                    ? const CircularProgressIndicator.adaptive()
                    : Text(widget.isLogin ? 'Login' : 'Register'),
          ),
          if (widget.isLogin)
            TextButton(
              onPressed: () {},
              child: const Text('Password dimenticata?'),
            ),
        ],
      ),
    );
  }
}
