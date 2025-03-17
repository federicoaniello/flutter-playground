import 'package:flutter/material.dart';
import 'package:playground/views/pages/expanded_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController(text: 'Ciao');
  bool? isChecked = false;
  bool isSwitched = false;
  int dropdown = 1;
  final List<double> values = [0.5, 1.0, 2.0, 3.0, 4.0, 5.0, 10.0, 15.0];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // /automaticallyImplyLeading: false,
        title: Text(widget.title),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ExpandedPage();
                      },
                    ),
                  );
                },
                child: Text('Vai ad expanded/flexible'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        content: Text('Are you sure?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('CLICCA'),
              ),

              DropdownButton(
                value: dropdown,
                items: [
                  DropdownMenuItem(value: 1, child: Text('Item 1')),
                  DropdownMenuItem(value: 2, child: Text('Item 2')),
                  DropdownMenuItem(value: 3, child: Text('Item 3')),
                ],
                onChanged: (int? value) {
                  setState(() {
                    dropdown = value!;
                  });
                },
              ),
              TextField(
                obscureText: false,
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(controller.text),
              Checkbox.adaptive(
                tristate: true,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile.adaptive(
                value: isChecked,
                tristate: true,
                title: Text('Click me'),
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Switch.adaptive(
                value: isSwitched,
                onChanged:
                    (value) => setState(() {
                      isSwitched = value;
                    }),
              ),
              SwitchListTile.adaptive(
                title: Text('Click'),
                value: isSwitched,
                onChanged:
                    (value) => setState(() {
                      isSwitched = value;
                    }),
              ),
              Slider.adaptive(
                value: selectedIndex.toDouble(),
                divisions: values.length - 1,
                min: 0,
                max: values.length - 1,
                label: values[selectedIndex].toString(),
                onChanged: (double value) {
                  setState(() {
                    selectedIndex = value.toInt();
                  });
                },
              ),
              Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      print('Tapped');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.white12,
                    ),
                  ),
                  Image.asset('assets/images/wallpaper.jpg'),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.blue,
                    ),
                    child: Text('CLICCA'),
                  ),
                  FilledButton(onPressed: () {}, child: Text('CLICCA')),
                  TextButton(
                    onPressed: () {
                      print('Cliccato');
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.blue,
                    ),
                    child: Text('Clicca'),
                  ),
                  OutlinedButton(onPressed: () {}, child: Text('Clicca')),
                  CloseButton(onPressed: () {}),
                  BackButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
