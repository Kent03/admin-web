
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
    static const String id = 'category';

  const CategoryScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Tạo danh mục mới',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
        ),
        const Divider(
           color: Colors.grey,
        ),
        Row(
          children: [
            const SizedBox(width: 10,),
            Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade800),
                  ),
                  child: const Text('abcd'),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){}, 
                  child: const Text('Tải ảnh lên'),
                  )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            const SizedBox(
              width: 200,
              child:TextField(
                decoration: InputDecoration(
                  label: Text('Nhập tên danh mục'),
                  contentPadding: EdgeInsets.zero
                ),
              ),
            ),
            const SizedBox(width: 10,),
            TextButton(
              onPressed:(){}, 
              child: Text('Hủy',style: TextStyle(color: Theme.of(context).primaryColor),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
               side: MaterialStateProperty.all(BorderSide(color: Theme.of(context).primaryColor),)
              ),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(
              onPressed:(){}, 
              child: const Text('Lưu lại',),
              
              ),
          ],
        ),
        const Divider(
           color: Colors.grey,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Danh sách danh mục',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}