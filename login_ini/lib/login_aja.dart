// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'hitung_aja.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _nimkelompok(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Selamat Datang",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Masukkan akun untuk lanjut hehe"),
      ],
    );
  }

  _inputField(context) {
    String username = ""; // State untuk menyimpan nilai username
    String password = ""; // State untuk menyimpan nilai password

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          onChanged: (value) {
            username = value;
          },
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
        ),
        SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            // Update nilai password saat input berubah
            password = value;
          },
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Periksa jika username dan password adalah "admin" atau "045" atau "032"
            if ((username == "admin" && password == "admin") || (username == "032" && password == "032") || (username == "045" && password == "045") ) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HitungPage()),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Login Berhasil'),
                    content: Text('Selamat datang! Anda telah berhasil login.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Tutup dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              ); // end if
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Login Gagal!'),
                    content: Text('Username atau Password salah'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Tutup dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } // end if
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        )
      ],
    );
  }

  _nimkelompok(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nim anggota kelompok : "),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("123210032"),
            SizedBox(width: 10),
            Text("123210045"),
          ],
        ),
      ],
    );
  }

}