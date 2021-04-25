import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';

const _titulo = 'Realizar Transferencia';

const _rotuloNumeroConta = 'Numero da Conta';
const _dicaNumeroConta = '0000';

const _rotuloValor = 'Valor';
const _dicaValor = '0.00';

const _textoBotao = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controlaorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorNumeroConta,
              rotulo: _rotuloNumeroConta,
              dica: _dicaNumeroConta,
            ),
            Editor(
                controlador: _controlaorValor,
                rotulo: _rotuloValor,
                dica: _dicaValor,
                icone: Icons.monetization_on),
            ElevatedButton(
              onPressed: () {
                _criaTransferencia(context);
              },
              child: Text(_textoBotao),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double valor = double.tryParse(_controlaorValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(numeroConta, valor);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}