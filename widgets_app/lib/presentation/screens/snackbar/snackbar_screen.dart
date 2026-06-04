import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  SnackbarScreen({super.key});

  final successSnackBar = SnackBar(
    content: Text('Este es un Snackbar de éxito'),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 2),
  );
  final failSnackBar = SnackBar(
    content: Text('Este es un Snackbar de error'),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 2),
  );
  final warningSnackBar = SnackBar(
    content: Text('Este es un Snackbar de advertencia'),
    backgroundColor: const Color.fromARGB(255, 99, 90, 14),
    duration: Duration(seconds: 2),
  );

  void showCustomSnackbar(BuildContext context, [SnackBar? snackBar]) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(snackBar ?? successSnackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('¿Quieres eliminar el item?'),
        content: Text('Esta acción no se puede deshacer'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y dialogs')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                FilledButton.tonal(
                  onPressed: () {
                    showAboutDialog(
                      context: context,
                      applicationIcon: Icon(Icons.info_outline),
                      children: [Text('Este es un ejemplo de un dialogo')],
                    );
                  },
                  child: Text('Licencias usadas'),
                ),
                FilledButton.tonal(
                  onPressed: () => openDialog(context),
                  child: Text('Otra cosa'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => showCustomSnackbar(context, successSnackBar),
              child: Text('Mostrar Snackbar'),
            ),
            ElevatedButton(
              onPressed: () => showCustomSnackbar(context, failSnackBar),
              child: Text('Mostrar Snackbar'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          showCustomSnackbar(context, warningSnackBar);
        },
      ),
    );
  }
}
