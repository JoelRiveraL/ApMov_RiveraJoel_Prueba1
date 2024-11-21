import 'package:flutter/material.dart';
import '../controller/mostrar_digitos.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MostrarDigitos _mostrarDigitos = MostrarDigitos();
  final TextEditingController _numero = TextEditingController();
  String _resultado = ''; // Variable para almacenar el resultado

  void _calcular() {
    try {
      setState(() {
        int numero = int.parse(_numero.text);

        _resultado = _mostrarDigitos.mostrarDigitos(numero);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, introduce datos válidos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mostrar dígitos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Ingresa un número de 4 dígitos:'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _numero,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Número',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Enviar'),
            ),
            // Mostrar el resultado en pantalla
            if (_resultado.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _resultado,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
