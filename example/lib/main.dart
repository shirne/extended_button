import 'package:enhanced_button/enhanced_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnhancedButton Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.standard,
      ),
      home: const ButtonDemoPage(),
    );
  }
}

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EnhancedButton Demo'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: EnhancedButton(
                    onPressed: () {},
                    child: const Text('EnhancedButton without style'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom().copyWith(
                      surfaceTintColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.transparent;
                        }
                        return Colors.green.withAlpha(100);
                      }),
                    ),
                    child: const Text('ElevatedButton'),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: EnhancedButton(
                    onPressed: null,
                    enhancedStyle: EnhancedButtonStyle(
                      gradient: MaterialStateProperty.all(const LinearGradient(
                          colors: [Colors.blue, Colors.red])),
                    ),
                    child: const Text('EnhancedButton disabled'),
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('ElevatedButton disabled'),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: EnhancedButton(
                    onPressed: () {},
                    enhancedStyle: EnhancedButtonStyle(
                      gradient: MaterialStateProperty.all(const LinearGradient(
                          colors: [Colors.blue, Colors.red])),
                    ),
                    child: const Text('EnhancedButton linear'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: EnhancedButton(
                    onPressed: () {},
                    enhancedStyle: EnhancedButtonStyle(
                      gradient: MaterialStateProperty.all(
                        const SweepGradient(
                          colors: [
                            Colors.blue,
                            Colors.green,
                            Colors.cyan,
                            Colors.red,
                            Colors.blue,
                          ],
                        ),
                      ),
                    ),
                    child: const Text('EnhancedButton sweep'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: EnhancedButton(
                    onPressed: () {},
                    height: 68,
                    enhancedStyle: EnhancedButtonStyle(
                      gradient: MaterialStateProperty.all(const LinearGradient(
                          colors: [Colors.blue, Colors.red])),
                    ),
                    child: const Text('EnhancedButton with height'),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: EnhancedButton(
                    onPressed: () {},
                    width: 100,
                    height: 28,
                    enhancedStyle: EnhancedButtonStyle(
                      gradient: MaterialStateProperty.all(
                        const SweepGradient(
                          colors: [
                            Colors.blue,
                            Colors.green,
                            Colors.cyan,
                            Colors.red,
                            Colors.blue,
                          ],
                        ),
                      ),
                    ),
                    child: const Text('with size'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: EnhancedButton(
                    onPressed: () {},
                    enhancedStyle: EnhancedButtonStyle(
                      gradient: MaterialStateProperty.resolveWith(
                        (state) {
                          if (state.contains(MaterialState.pressed)) {
                            return const LinearGradient(
                              colors: [
                                Colors.red,
                                Colors.amber,
                                Colors.blue,
                                Colors.green,
                              ],
                            );
                          }
                          return const LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.green,
                              Colors.red,
                              Colors.amber,
                            ],
                          );
                        },
                      ),
                      duration: MaterialStateProperty.all(
                        const Duration(milliseconds: 1000),
                      ),
                    ),
                    child: const Text('EnhancedButton switch gradient'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: EnhancedButton(
                    onPressed: () {},
                    enhancedStyle: EnhancedButtonStyle(
                      gradient: MaterialStateProperty.all(
                        const LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.red,
                          ],
                        ),
                      ),
                      transform: MaterialStateProperty.resolveWith((state) {
                        if (state.contains(MaterialState.pressed)) {
                          return Matrix4.identity()..scale(0.95);
                        }
                        return Matrix4.identity();
                      }),
                      duration: MaterialStateProperty.resolveWith((state) {
                        if (state.contains(MaterialState.pressed)) {
                          return const Duration(milliseconds: 200);
                        }
                        return const Duration(milliseconds: 500);
                      }),
                      curve: MaterialStateProperty.resolveWith((state) {
                        if (state.contains(MaterialState.pressed)) {
                          return Curves.easeOut;
                        }
                        return Curves.bounceOut;
                      }),
                    ),
                    child: const Text('EnhancedButton scaled'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: EnhancedButton(
                    onPressed: () {},
                    enhancedStyle: EnhancedButtonStyle(
                      image: MaterialStateProperty.all(
                        const DecorationImage(
                          image: AssetImage(
                            'assets/images/button.png',
                          ),
                        ),
                      ),
                    ),
                    child: const Text(''),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: EnhancedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      elevation: 2,
                    ),
                    enhancedStyle: EnhancedButtonStyle(
                      image: MaterialStateProperty.all(
                        const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/button.png',
                          ),
                        ),
                      ),
                      enableShadow: true,
                      enableSplash: true,
                    ),
                    child: const SizedBox(width: 95, height: 30),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Splash and shadow was disabled for decorationImage,'
              'but you can open by enable*',
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
