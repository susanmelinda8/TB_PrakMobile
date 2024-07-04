import 'package:flutter/material.dart';
import 'package:projek/project/halaman/halaman_hasil.dart';
import 'halaman_akun.dart';
import 'halaman_favorit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HalamanUtama extends StatefulWidget {
  final String username;
  final int index;
  HalamanUtama({Key? key, required this.index, required this.username})
      : super(key: key);

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  late int index = widget.index;

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch() {
    String _search = _searchController.value.text;
    if (_search.isNotEmpty) {
      FocusScope.of(context).unfocus(); // Sembunyikan keyboard
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HasilPencarian(value: _search, index: 5)),
      );
    } else {
      // Tambahkan snackbar untuk menunjukkan bahwa pencarian kosong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Field pencarian tidak boleh kosong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/project/images/background.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Text(
                    "Selamat datang di Cooking",
                    style: TextStyle(
                        fontFamily: "Pacifico",
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: Text(
                    "Cari makanan yang ingin Anda buat!",
                    style: TextStyle(
                      fontFamily: "Merienda_One",
                      fontSize: 18,
                      color: Colors.white60,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 7),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 49, 49, 49)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white60,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Cari",
                            hintStyle: TextStyle(color: Colors.black38),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search, color: Colors.black38),
                              onPressed: _onSearch,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 77, 76, 76),
        items: <Widget>[
          Icon(Icons.home, size: 25),
          Icon(Icons.favorite, size: 25),
          Icon(Icons.account_circle, size: 25),
        ],
        onTap: (index) {
          setState(() {
            switch (index) {
              case 0:
                break;

              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Favorit(username: widget.username)),
                );
                break;

              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Akun(user: widget.username)),
                );
                break;
            }
          });
        },
      ),
    );
  }
}
