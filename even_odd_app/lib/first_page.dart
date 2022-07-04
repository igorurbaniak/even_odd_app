import 'package:even_odd_app/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController? controller;
  String? value = '';
  String label = '';
  Function? onChanged;
  String? error;
  Widget? icon;
  final bool allowDecimal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Even or odd finder",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller,
              initialValue: value,
              onChanged: onChanged as void Function(String)?,
              readOnly: false,
              keyboardType:
                  TextInputType.numberWithOptions(decimal: allowDecimal),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(_getRegexString())),
                TextInputFormatter.withFunction(
                  (oldValue, newValue) => newValue.copyWith(
                    text: newValue.text.replaceAll('.', ','),
                  ),
                ),
              ],
              decoration: InputDecoration(
                label: Text(label),
                errorText: error,
                icon: icon,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {},
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SecondPage(),
                  ),
                );
              },
              child: const Text('Wyszukaj'),
            ),
          ],
        ),
      ),
    );
  }

  String _getRegexString() =>
      allowDecimal ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}
