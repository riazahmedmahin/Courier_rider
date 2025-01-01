import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class geid_view extends StatefulWidget {
  const geid_view({Key? key}) : super(key: key);

  @override
  State<geid_view> createState() => _geid_viewState();
}

class _geid_viewState extends State<geid_view> {
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: isSelected[index] ? AppColors.primaryColor : Colors.grey.shade300,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          choices[index].imageAsset,
                          width: 70,
                          height: 70,
                          //color:  Colors.black,
                        ),
                        SizedBox(height: 10),
                        Text(
                          choices[index].title,
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isSelected[index] ? Colors.white : Colors.black87,
                          ),
                        ),
                      ],
                    ),
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
  const Choice(title: 'Motor Bike,', imageAsset: 'assets/bike.png'),
  const Choice(title: 'Car', imageAsset: 'assets/delivery-truck.png'),
  const Choice(title: 'Cycle', imageAsset: 'assets/cycle.png'),
  const Choice(title: 'Walker', imageAsset: 'assets/man.png'),
];
