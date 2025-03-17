import 'dart:async';
import 'package:flutter/material.dart';
import 'package:playground/api/location_api.dart';
import 'package:playground/models/location_response.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  final _locationController = TextEditingController();
  Timer? _debounce;

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (_locationController.text.length > 2) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _locationController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(
              labelText: 'Cerca',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: FutureBuilder(
              future: _locationController.text.length > 2
                  ? fetchLocations(_locationController.text)
                  : null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  if (snapshot.data?.result != null) {
                    return ListView.builder(
                      itemCount: snapshot.data!.result!.length,
                      itemBuilder: (context, index) {
                        Result result = snapshot.data!.result![index];
                        return ListTile(
                          title: Text(result.name!),
                        );
                      },
                    );
                  }
                } else if (snapshot.hasError) {
                  return Center(child: Text('ERROR'));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
