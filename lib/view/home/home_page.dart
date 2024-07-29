import 'package:flutter/material.dart';
import 'package:food_api_application/modal/api_modal.dart';
import 'package:food_api_application/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderFalse=Provider.of<HomeProvider>(context,listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context, listen: false).fetchingApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ApiModal? apiModal = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      title: const Text(
                        'Deliver Now',
                        style: TextStyle(fontSize: 18, color: Colors.black38),
                      ),
                      subtitle: const Row(
                        children: [
                          Text(
                            'Hsr Layout',
                            style: TextStyle(
                                fontSize: 30,
                                height: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 40,
                          )
                        ],
                      ),
                      trailing: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.pink.shade100,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20,),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xF797979),
                          borderRadius: BorderRadius.circular(50)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(50)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(50)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                  Wrap(
                    children: [
                      ...List.generate(
                        apiModal!.recipes.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              homeProviderFalse.selectingMethod(index);
                              Navigator.of(context).pushNamed('/detail');
                            },
                            child: Container(
                              height: 220,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(apiModal.recipes[index].image),
                                )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(apiModal.recipes[index].name,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("rating ${apiModal.recipes[index].rating}",style: const TextStyle(color: Colors.white,),),
                                      Text("review ${apiModal.recipes[index].reviewCount}",style: const TextStyle(color: Colors.white,),),
                                      Text("Time ${apiModal.recipes[index].prepTimeMinutes}",style: const TextStyle(color: Colors.white,),),
                                    ],
                                  ),
                                      SizedBox(height: 10,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.pinkAccent,
            ));
          }
        },
      ),
    );
  }
}
