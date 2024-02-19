import 'package:e_com/app/view/modules/auth/providers/auth_provider.dart';
import 'package:e_com/core/extensions.dart';
import 'package:e_com/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;

  bool _isLogin = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _isLogin ? 'Login' : 'Register',
                  style: context.textTheme.headlineLarge,
                ),
                const Text('Welcome Back'),
                const Gap(32),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const Gap(12),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const Gap(32),
                ElevatedButton(
                  onPressed: () async {
                    if (_emailController.text.trim().isEmpty ||
                        _passwordController.text.isEmpty) {
                      showToast('Please fill in all fields');
                      return;
                    }

                    if (_isLogin) {
                      await ref.read(authProviderProvider.notifier).login(
                            _emailController.text,
                            _passwordController.text,
                          );
                    } else {
                      await ref.read(authProviderProvider.notifier).register(
                            _emailController.text,
                            _passwordController.text,
                          );
                    }
                  },
                  child: Text(_isLogin ? 'Login' : 'Register'),
                ),
                TextButton(
                  onPressed: toggleLogin,
                  child: Text(
                    !_isLogin
                        ? 'Already have an account? Login'
                        : "Don't have an account? Register",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleLogin() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }
}
