import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  TextEditingController emailController =
      TextEditingController(text: "sobhi@gmail.com");

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Standard Text Input mit Validierung
            TextField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Vollständigen Namen',
              ),
              onChanged: (text) {
                print(text);
              },
            ),
            const SizedBox(height: 16),

            // E-Mail Text Input mit Validierung
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Passwort Text Input mit Validierung
            TextFormField(
              textInputAction: TextInputAction.next,
              obscureText: showPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: Icon(showPassword
                        ? Icons.visibility
                        : Icons.visibility_off)),
                border: const OutlineInputBorder(),
              ),
              validator: (password) {
                // Password wurde garnicht ausgefüllt
                if (password == null) {
                  return "Bitte Passwort angeben";
                } else if (password.length < 8) {
                  // Passwort muss größer als 8 Zeichen sein
                  return "Bitte 8 Zeichen angeben";
                }

                // Alles ist in Ordnung, keine Probleme
                return null;
              },
              onChanged: (password) {
                if (password.length >= 5) {
                  emailController.text = "admin@gmail.com";
                }
              },
            ),
            const SizedBox(height: 16),

            // Telefonnummer Text Input mit Validierung
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(12),
              ],
              decoration: const InputDecoration(
                labelText: 'Telefonnummer',
                labelStyle: TextStyle(fontSize: 14),
                // label: Icon(Icons.email),
                hintText: 'Bitte mit +491 beginnen',
                hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Nummerischer Text Input mit Validierung
            TextFormField(
              textInputAction: TextInputAction.done,
              style: const TextStyle(fontSize: 12, color: Colors.green),
              keyboardType: TextInputType.number,
              cursorColor: Colors.green,
              decoration: const InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green, width: 2, strokeAlign: 2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(emailController.text)));
                },
                child: const Center(
                  child: Text("Text anzeigen"),
                ))
          ],
        ),
      ),
    );
  }
}
