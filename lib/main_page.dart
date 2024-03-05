import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Calculator'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 80,
                height: 80,
                child: const Image(
                  image: AssetImage('images/enfermeira.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Calcule seu IMC',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: TextField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Altura (m)',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    double altura = double.parse(alturaController.text);
                    double peso = double.parse(pesoController.text);
                    double imc = peso / (altura * altura);
                    String imcResultado = '';
                    if (imc < 18.5) {
                      imcResultado = 'Abaixo do peso';
                    } else if (imc >= 18.5 && imc < 24.9) {
                      imcResultado = 'Peso ideal (parabéns)';
                    } else if (imc >= 25 && imc < 29.9) {
                      imcResultado = 'Levemente acima do peso';
                    } else if (imc >= 30 && imc < 34.9) {
                      imcResultado = 'Obesidade grau 1';
                    } else if (imc >= 35 && imc < 39.9) {
                      imcResultado = 'Obesidade grau 2 (severa)';
                    } else if (imc >= 40) {
                      imcResultado = 'Obesidade grau 3 (mórbida)';
                    }
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Resultado'),
                          content: Text(imcResultado),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Fechar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
