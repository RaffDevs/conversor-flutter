import 'package:conversor/modules/conversor/components/utils/conversor_field.dart';
import 'package:conversor/modules/conversor/components/utils/get_data_message.dart';
import 'package:conversor/modules/conversor/controllers/conversor_controller.dart';
import 'package:conversor/modules/conversor/models/currencies.dart';
import 'package:flutter/material.dart';

class ConversorPage extends StatefulWidget {
  const ConversorPage({Key? key}) : super(key: key);

  @override
  State<ConversorPage> createState() => _ConversorPageState();
}

class _ConversorPageState extends State<ConversorPage> {
  final conversorController = ConversorController();
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar = 0.0;
  double euro = 0.0;

  getData() async {
    final data = await conversorController.getData();

    return data;
  }

  _clearAll() {
    realController.clear();
    dolarController.clear();
    euroController.clear();
  }

  _onRealChange(String text) {
    if (text.isEmpty) {
      _clearAll();

      return;
    }

    double real = double.parse(text);

    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }

  _onDolarChange(String text) {
    if (text.isEmpty) {
      _clearAll();

      return;
    }

    double dolar = double.parse(text);

    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  _onEuroChange(String text) {
    if (text.isEmpty) {
      _clearAll();

      return;
    }

    double euro = double.parse(text);

    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: GetDataMessage(text: 'Carregando dados...')
              );
            default:
              if (snapshot.hasError) {   
                print(snapshot.error);

                return const GetDataMessage(text: 'Erro ao carregar dados!');
              } 
              else {
                final data = snapshot.data as Map;
                dolar = data["results"]["currencies"]["USD"]["buy"];
                euro = data["results"]["currencies"]["EUR"]["buy"];
                
                return SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                       const  Icon(
                          Icons.monetization_on,
                          size: 150,
                          color: Colors.amber
                        ),
                        const Divider(),
                        ConversorField(
                          countryCurrency: Currencies.brazil, 
                          fieldController: realController,
                          currencyChange: _onRealChange,
                        ),
                        const Divider(),
                        ConversorField(
                          countryCurrency: Currencies.usa,
                          fieldController: dolarController,
                          currencyChange: _onDolarChange,
                        ),
                        const Divider(),
                        ConversorField(
                          countryCurrency: Currencies.europe,
                          fieldController: euroController,
                          currencyChange: _onEuroChange,
                        )
                        
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
