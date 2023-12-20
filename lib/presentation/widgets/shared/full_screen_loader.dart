import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = <String>[
      'Cargando pelicualas',
      'Comprando palomitas de maiz',
      'Llamando a mi movia',
      'Esperando a mi crush',
      'Esto esta tardando demasiado'
    ];

    Stream<String> getLoadingMessages() {
      return Stream.periodic(const Duration(seconds: 2), (step) {
        return messages[step];
      }).take(messages.length);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(height: 20),
          StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Cargando');

                return Text(snapshot.data!);
              })
        ],
      ),
    );
  }
}
