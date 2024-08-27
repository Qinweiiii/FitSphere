import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:swe2109537_swe311_assm1/db_service.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {

  List<Map<String, dynamic>> _moods = [];
  // TextEditingController可以控制和监听TextField里面的内容
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _refreshMoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 28.0,),
        onPressed: () {
          _showModal(null);
        },
        backgroundColor: Colors.deepPurple.shade100, // 背景颜色
        foregroundColor: Colors.deepPurple.shade900, // 前景颜色（图标颜色）
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // 圆角矩形形状
        ),
        elevation: 5.0, // 阴影高度
      ),
      body: ListView.builder(
          itemCount: _moods.length,
          // itemBuilder是一个回调函数 用于构建每个列表项
          itemBuilder: (context, index) => Card(
              color: Color(0xFFFEFFE2),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                title: Text(
                    _moods[index]['date'],
                    style: GoogleFonts.comicNeue(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    )
                ),
                subtitle: Text(
                    _moods[index]['description'],
                    style: GoogleFonts.comicNeue(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )
                ),
                trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: (){
                            _showModal(_moods[index]['id']);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: (){
                            _deleteItem(_moods[index]['id']);
                          },
                        )
                      ],
                    )
                ),
              )
          )
      ),
    );
  }

  Widget modalComponent(int? id){
    return Container(
        padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: 270
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(hintText: 'Date'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(hintText: 'Mood Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async{
                  if(id == null){
                    await _addItem();
                  }

                  if(id != null){
                    await _updateItem(id);
                  }

                  _dateController.text = '';
                  _descriptionController.text = '';

                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child:Text(
                  id == null ? 'Create New' : 'Update',
                  style: const TextStyle(
                      color: Colors.white
                  ),
                )
            )
          ],
        )
    );
  }

  void _showModal(int? id) {
    if (id != null) {
      final existingMood = _moods.firstWhere((mood) => mood['id'] == id);
      _dateController.text = existingMood['date'] ?? '';
      _descriptionController.text = existingMood['description'] ?? '';
    } else {
      _dateController.text = '';
      _descriptionController.text = '';
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 是modal框地告诉随内容而变化
      builder: (BuildContext context){
        return modalComponent(id);
      }
    );
  }

  void _refreshMoods() async {
    final data = await DatabaseService.getItems();
    setState(() {
      _moods = data;
    });
  }

  Future<void> _addItem() async{
    if (_dateController.text.isEmpty || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Date and description cannot be empty')),
      );
      return;
    }

    await DatabaseService.createItem(_dateController.text, _descriptionController.text);
    _refreshMoods();
  }

  Future<void> _updateItem(int id) async {
    if (_dateController.text.isEmpty || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Date and description cannot be empty')),
      );
      return;
    }

    await DatabaseService.updateItem(id, _dateController.text, _descriptionController.text);
    _refreshMoods();
  }

  void _deleteItem(int id) async {
    await DatabaseService.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully delete a note.'),
    ));
    _refreshMoods();
  }

}