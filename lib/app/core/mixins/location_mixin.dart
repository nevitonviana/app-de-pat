import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

typedef TryAgain = void Function();

mixin LocationMixin<E extends StatefulWidget> on State<E> {
  void showDialogLocationServiceUnavailable() {
    showDialog(
      context: context,
      builder: (contextDialog) => AlertDialog(
        title: const Text("Precisamos da sua localização"),
        content: const Text("para realizar a bsuca da sua localização, precisamos que voce ative o GPS "),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
              },
              child: const Text("Cancelar")),
          TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
                Geolocator.openLocationSettings();
              },
              child: const Text("Abrir as configurações")),
        ],
      ),
    );
  }

  void showDialogLocationDenied({TryAgain? tryAgain}) {
    showDialog(
      context: context,
      builder: (contextDialog) => AlertDialog(
        title: const Text("Precisamos da sua authorização"),
        content: const Text("para realizar a bsuca da sua localização, authorize a sua localizção "),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
              },
              child: const Text("Cancelar")),
          TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
                if (tryAgain != null) {
                  tryAgain();
                }
              },
              child: const Text("tentar novamente")),
        ],
      ),
    );
  }

  void showDialogLocationDeniedForever() {
    showDialog(
      context: context,
      builder: (contextDialog) => AlertDialog(
        title: const Text("Precisamos da sua authorização"),
        content: const Text("para realizar a bsuca da sua localização, Clique no botão avrir configurações "),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
              },
              child: const Text("Cancelar")),
          TextButton(
              onPressed: () {
                Navigator.pop(contextDialog);
                Geolocator.openLocationSettings();
              },
              child: const Text("Abrir as configurações")),
        ],
      ),
    );
  }
}
