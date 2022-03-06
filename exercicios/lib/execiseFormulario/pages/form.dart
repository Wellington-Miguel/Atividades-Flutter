import 'package:exercicio/execiseFormulario/Components/checkBoxContact.dart';
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
  DateTime? selctedDate;
  bool obscurepass = true;
  final dateController = TextEditingController();
  bool emailCheckController = true;
  bool phoneCheckController = true;
  bool switchTerms = false;

  void alertConfimation() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              Words.titeConfirmation,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            content: Text(
              Words.contentConfirmation,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Sair'),
              ),
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Confirmar'),
              ),
            ],
          );
        });
  }

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
          BuildSections(context, Words.sectionDateaccess),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              isDense: true,
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
              isDense: true,
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
                isDense: true,
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
          BuildSections(context, Words.sectionPersonalData),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              labelText: Words.fullname,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: Words.birthDate,
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  onTap: dateDialog,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: Words.phone,
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.go,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          BuildSections(context, Words.sectionContact),
          CheckBoxContact(
            check: phoneCheckController,
            onchange: (value) {
              setState(() {
                phoneCheckController = value!;
              });
            },
            text: Words.phone,
            label: Icons.phone,
            theme: widget.curretTheme,
          ),
          const SizedBox(
            height: 10,
          ),
          CheckBoxContact(
              theme: widget.curretTheme,
              check: emailCheckController,
              onchange: (value) {
                setState(() {
                  emailCheckController = value!;
                });
              },
              text: Words.email,
              label: Icons.email),
          const SizedBox(
            height: 10,
          ),
          SwitchListTile(
              dense: true,
              title: Text(
                Words.terms,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              value: switchTerms,
              onChanged: (value) {
                setState(() {
                  switchTerms = value;
                });
              }),
          ElevatedButton(
            onPressed: alertConfimation,
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  Padding BuildSections(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  void dateDialog() {
    final currentDate = DateTime.now();
    final firstDate = DateTime(
      currentDate.year - 18,
      currentDate.month,
      currentDate.day,
    );

    showDatePicker(
      context: context,
      initialDate: selctedDate ?? firstDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((selected) {
      if (selected != null) {
        selctedDate = selected;
        dateController.text =
            "${selected.day}/${selected.month}/${selected.year}";
      }
    });
  }
}
