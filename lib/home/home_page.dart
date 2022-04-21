import 'package:flutter/material.dart';
import 'package:person_calculator/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _homeController = HomeController(title: 'My Shop');

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_homeController.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Colors.red.withOpacity(0.25),
              Colors.blue.withOpacity(0.25),
            ],
          ),
        ),
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: _homeController.counter,
            builder: (context, int value, child) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _homeController.canShopReceiveNewClients(value),
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      '$value',
                      style: TextStyle(
                        fontSize: theme.textTheme.headline4?.fontSize,
                        fontStyle: theme.textTheme.headline4?.fontStyle,
                        color: _homeController.isFull ? Colors.red : null,
                      ),
                    ),
                  ],
                );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ValueListenableBuilder(
          valueListenable: _homeController.counter,
          builder: (context, int value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  onPressed: _homeController.canDecrement(value),
                  tooltip: 'Leave',
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Leave'),
                  backgroundColor: _homeController.isEmpty ? theme.primaryColor.withOpacity(0.05) : null,
                ),
                const SizedBox(width: 32),
                FloatingActionButton.extended(
                  onPressed: _homeController.canIncrement(value),
                  tooltip: 'Enter',
                  icon: const Icon(Icons.login_rounded),
                  label: const Text('Enter'),
                  backgroundColor: _homeController.isFull ? theme.primaryColor.withOpacity(0.05) : null,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
