import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class KeduaPage extends StatefulWidget {
  const KeduaPage({super.key});

  @override
  State<KeduaPage> createState() => _KeduaPageState();
}

class _KeduaPageState extends State<KeduaPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("kelas ke 2"),
    );
  }
}
