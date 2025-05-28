import 'package:flutter/material.dart';
import 'package:benin_express/presentation/common/widgets/home/home_header.dart';
import 'package:benin_express/presentation/common/widgets/home/home_new_parcel_button.dart';
import 'package:benin_express/presentation/common/widgets/home/home_secondary_actions.dart';
import 'package:benin_express/presentation/common/widgets/home/home_recent_parcels.dart';
import 'package:benin_express/presentation/common/widgets/home/home_footer.dart';
import 'package:benin_express/presentation/common/widgets/app_drawer.dart';
import 'package:benin_express/presentation/features/auth/login_screen.dart'; // Import UserType enum

class HomeScreen extends StatefulWidget {
  final UserType userType;

  const HomeScreen({super.key, required this.userType});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF008751)),
        title: Text(
          'Tableau de bord (${widget.userType == UserType.expediteur ? "Expéditeur" : "Livreur"})', // Display user type in title for verification
          style: const TextStyle(
            color: Color(0xFF008751),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HomeHeader(),
                const SizedBox(height: 20),
                HomeNewParcelButton(
                  userType: widget.userType,
                ), // Pass userType here and remove const
                const SizedBox(height: 20),
                const HomeSecondaryActions(),
                const SizedBox(height: 20),
                const HomeRecentParcels(),
                const SizedBox(height: 20),
                const HomeFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
