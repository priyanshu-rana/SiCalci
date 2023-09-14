import 'package:flutter/material.dart';

class SICalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SICalculatorState();
  }
}

class _SICalculatorState extends State<SICalculator> {
  var _formKey = GlobalKey<FormState>();

  var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Others'];
  var _currentItemSelected = '';
  var displayResult = '';

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              getImageAsset(),
              Padding(
                padding: EdgeInsets.only(bottom: 5, top: 5),
                child: TextFormField(
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: "Principal",
                      hintText: "Enter Principal e.g. 10000",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  controller: principalController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Principal amount can not be empty';
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: "Rate",
                      hintText: "Enter Rate of Interest",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                  controller: rateController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Rate can not be empty';
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        style: textStyle,
                        decoration: InputDecoration(
                            labelText: "Term",
                            hintText: "Time in years",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        keyboardType: TextInputType.number,
                        controller: termController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Term can not be empty';
                          }
                        },
                      ),
                    ),
                    Container(width: 25),
                    Expanded(
                        child: DropdownButton<String>(
                      items: _currencies.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem));
                      }).toList(),
                      onChanged: (String? newSelectedValue) {
                        _onDropDownItemSelected(newSelectedValue!);
                      },
                      value: _currentItemSelected,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        textColor: Colors.white,
                        color: Colors.black54,
                        child: Text('Reset'),
                        onPressed: () {
                          setState(() {
                            _formKey.currentState!.reset();
                            _onResetButton();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 5,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Calculate'),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              displayResult = _onSubmitButton();
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(style: TextStyle(fontSize: 20), displayResult),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String? selectedValue) {
    setState(() {
      this._currentItemSelected = selectedValue!;
    });
  }

  void _onResetButton() {
    setState(() {
      principalController.text = '';
      rateController.text = '';
      termController.text = '';
      displayResult = '';
      _currentItemSelected = _currencies[0];
    });
  }

  String _onSubmitButton() {
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double term = double.parse(termController.text);

    double totalAmount = principal + (principal * term * rate) / 100;
    String result =
        'Total amount will be worth $totalAmount $_currentItemSelected @$rate% in $term years.';
    return result;
  }

  Widget getImageAsset() {
    AssetImage imageAsset = AssetImage('images/SiCalci.jpg');
    Image image = Image(image: imageAsset, width: 250, height: 250);
    return Container(child: image);
  }
}
