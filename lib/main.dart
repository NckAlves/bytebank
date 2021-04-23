import 'package:flutter/material.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FormularioTransferencia(),
    ));
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controlaorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realizar Transferência'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorNumeroConta,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: 'Número da Conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controlaorValor,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int numeroConta = int.tryParse(_controladorNumeroConta.text);
              final double valor = double.tryParse(_controlaorValor.text);

              if (numeroConta != null && valor != null) {
                Tranferencia(numeroConta, valor);
              }
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia('RS 200,00', '1000'),
          ItemTransferencia('RS 100,00', '1000'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final String valor;
  final String numeroConta;

  ItemTransferencia(this.valor, this.numeroConta); // QUE CONSTRUTOR LINDO!

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(valor),
        subtitle: Text(numeroConta),
      ),
    );
  }
}

class  Tranferencia {
  final double valor;
  final int numeroConta;

  Tranferencia(this.numeroConta, this.valor);
}
