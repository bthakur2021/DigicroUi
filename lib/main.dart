import 'package:digicro_ui/utils/ColorUtils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digicro'),
      ),
      body: getMainWidget(),
    );
  }

  Widget getMainWidget() {
    return Column(
      children: [
        Expanded(child: scrollViewUI()),
        /*InkWell(
          onTap: () {
            _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
          },
          child: Container(
            color: Colors.blue,
            child: const Text('Scroll to top'),
          ),
        ),*/
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
              },
              child: const Text('Scroll to top')),
        ),
      ],
    );
  }

  Widget scrollViewUI() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        titleWidget('Vertical List 1'),
        _listViewVertical(),
        titleWidget('Horizontal List 1'),
        _listViewHorizontal(),
        titleWidget('Vertical List 2'),
        _listViewVertical(),
      ],
    );
  }

  Widget titleWidget(String title) {
    return SliverToBoxAdapter(
        child: Container(
      height: 60,
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ));
  }

  Widget _listViewVertical() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(top: 8),
            height: 100,
            color: ColorUtils.instance.randomGeneratorByIndex(index),
          );
        },
        childCount: 10,
      ),
    );
  }

  Widget _listViewHorizontal() {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            width: 200,
            color: ColorUtils.instance.randomGeneratorByIndex(index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    ));
  }
}
