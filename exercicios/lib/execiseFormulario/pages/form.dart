import 'package:exercicio/execiseFormulario/resouces/strings.dart';
import 'package:flutter/material.dart';

class PersonalForms extends StatefulWidget {
  PersonalForms(this.onpresstheme, this.curretTheme, {Key? key})
      : super(key: key);
  bool curretTheme;
  Function(bool) onpresstheme;
  @override
  State<PersonalForms> createState() => _PersonalFormsState();
}

class _PersonalFormsState extends State<PersonalForms> {
  bool obscurepass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            widget.curretTheme ? Colors.green[600] : Colors.green[900],
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Formulário: dados pessoais'),
        ),
        actions: [
          IconButton(
            icon: Icon(
                widget.curretTheme ? Icons.lightbulb : Icons.lightbulb_outline),
            onPressed: () {
              widget.curretTheme = widget.curretTheme ? false : true;

              widget.onpresstheme(widget.curretTheme);
              setState(() {
                widget.curretTheme;
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: Words.userName,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: Words.email,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                labelText: Words.password,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurepass
                        ? Icons.remove_red_eye_rounded
                        : Icons.remove_red_eye_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurepass = obscurepass ? false : true;
                    });
                  },
                )),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            obscureText: obscurepass,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: Words.fullname,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: Words.birthDate,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: Words.phone,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
