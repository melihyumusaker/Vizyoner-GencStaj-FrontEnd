import 'package:flutter/material.dart';
import 'package:proje/main.dart';
import 'package:proje/pages/screens/home_screen/home_page.dart';
import 'package:proje/themecolors/colors.dart';

class SearchPage extends StatefulWidget {
  String email;
  SearchPage({Key? key, required this.email}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _data = [
    'Aselsan',
    'Havelsan',
    'TUSAS',
    'TR. Eğitim A.Ş.',
  ];
  List<String> _filteredData = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    //Simulates waiting for an API call
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      _filteredData = _data
          .where((element) => element
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomTabBar(
                          email: widget.email,
                        )),
              );
            },
          ),

          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [OurColor.firstColor, OurColor.secondColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: TextField(
            controller: _searchController,
            style: TextStyle(color: Colors.white),
            cursorColor: OurColor.firstColor,
            decoration: const InputDecoration(
              hintText: 'Ara',
              hintStyle: TextStyle(color: Color.fromARGB(255, 251, 251, 251)),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              _isLoading
                  ? Center(
                      child:
                          CircularProgressIndicator(color: OurColor.firstColor),
                    )
                  : ListView.builder(
                      itemCount: _filteredData.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          _filteredData[index],
                          style: TextStyle(color: OurColor.firstColor),
                        ),
                      ),
                    );
              // Perform search functionality here
            },
          ),
          // you can put any Widget
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(color: OurColor.firstColor),
              )
            : ListView.builder(
                itemCount: _filteredData.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    _filteredData[index],
                    style: TextStyle(color: OurColor.firstColor),
                  ),
                ),
              ),
        backgroundColor: Colors.white,
      );
}
