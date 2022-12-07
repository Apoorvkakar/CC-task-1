import 'package:flutter/material.dart';
import 'second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(
          title: const Text("Flashcards", style: TextStyle(color: Colors.white, fontSize: 30)),
          toolbarHeight: 70,
          toolbarOpacity: 1,
          elevation: 4.00,
          backgroundColor: Colors.purpleAccent,
        ),
        body: GridView.builder(
          itemCount: 5,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const SecondPage(title: 'SecondPage');
                          }
                          )
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(30.0,20.0,30.0,0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                              child: Text(
                                'Text',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 8.0),
                              child: Text(
                                'Answer',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 0.0),
                                  child: IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.white, size: 40.0),
                                    tooltip: 'Delete',
                                    onPressed: () {
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dataset_outlined),
              label: 'Cards',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.handshake_outlined),
              label: 'Practice',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            setState(() {
            });
          },
          child: const Icon(Icons.add),
        ),

      ),
    );
  }
}