import 'package:flutter/material.dart';
import 'background_decoration.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF41B241),
                Color(0xFF2A7B2A),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: PathPainter(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Center(
                child: Placeholder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
