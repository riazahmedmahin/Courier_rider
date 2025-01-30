import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/presentation/ui/utility/app_color.dart';

class GeidView extends StatefulWidget {
  const GeidView({Key? key}) : super(key: key);

  @override
  State<GeidView> createState() => _GeidViewState();
}

class _GeidViewState extends State<GeidView> {
  late List<bool> isSelected;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.generate(choices.length, (index) => index == 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5, // Adjust the height as needed
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 8.0,
          children: List.generate(choices.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = (i == index);
                  }
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: isSelected[index] ? AppColors.primaryColor : Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: isSelected[index] ? Colors.black26 : Colors.transparent,
                      blurRadius: 6.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          choices[index].imageAsset,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        choices[index].title,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isSelected[index] ? Colors.white : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.imageAsset});
  final String title;
  final String imageAsset;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Motor Bike', imageAsset: 'assets/bike.png'),
  const Choice(title: 'Car', imageAsset: 'assets/delivery-truck.png'),
  const Choice(title: 'Cycle', imageAsset: 'assets/cycle.png'),
  const Choice(title: 'Walker', imageAsset: 'assets/man.png'),
];
