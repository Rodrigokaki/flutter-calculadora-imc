import 'package:flutter/material.dart';
import 'styles.dart';
import 'value_controller.dart';

class IMCPage extends StatefulWidget {
  @override
  _IMCPageState createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  String resultado = "Informe seus dados!";

  void calcularIMC() {
    final peso = double.tryParse(pesoController.text);
    final alturaCm = double.tryParse(alturaController.text);

    if (peso == null || alturaCm == null) {
      setState(() => resultado = "Preencha os campos corretamente!");
      return;
    }

    if (peso < minPeso || peso > maxPeso) {
      setState(() => resultado = "Peso inválido. Deve ser entre $minPeso kg e $maxPeso kg.");
      return;
    }

    if (alturaCm < minAltura || alturaCm > maxAltura) {
      setState(() => resultado = "Altura inválida. Deve ser entre $minAltura cm e $maxAltura cm.");
      return;
    }

    final alturaM = alturaCm / 100;
    final imc = peso / (alturaM * alturaM);

    String classificacao;
    if (imc < imcMagrezaGrave) {
      classificacao = "Magreza grave";
    } else if (imc < imcMagrezaModerada) {
      classificacao = "Magreza moderada";
    } else if (imc < imcMagrezaLeve) {
      classificacao = "Magreza leve";
    } else if (imc <= imcPesoIdeal) {
      classificacao = "Peso ideal";
    } else if (imc <= imcSobrepeso) {
      classificacao = "Sobrepeso";
    } else if (imc <= imcObesidade1) {
      classificacao = "Obesidade grau 1";
    } else if (imc <= imcObesidade2) {
      classificacao = "Obesidade grau 2";
    } else {
      classificacao = "Obesidade grau 3";
    }

    setState(() {
      resultado = "IMC: ${imc.toStringAsFixed(2)} - $classificacao";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora IMC")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.person, size: 130, color: primaryColor),
            SizedBox(height: 20),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso (kg)",
                labelStyle: TextStyle(color: primaryColor),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: primaryColor),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularIMC,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Calcular", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            Text(resultado, style: resultTextStyle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
