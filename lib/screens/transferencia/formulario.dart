import 'package:byteBank/components/editor.dart';
import 'package:byteBank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Criando Transferencia')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(controlador: _controladorCampoNumeroConta, dica: '0000', rotulo: 'Numero da conta',),
            Editor(controlador: _controladorCampoValor, dica: '0.00', rotulo: 'Valor', icone: Icons.monetization_on,),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criaTransferencia(context),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta != null && valor != null){
      final transferenciaCriada =  Transferencia(valor, numeroConta);
      debugPrint('Criando transfereência');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }

}
