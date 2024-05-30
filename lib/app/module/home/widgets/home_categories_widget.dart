part of '../home_page.dart';

class HomeCategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) => _CategoryItem(),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: context.primaryColorLight,
            child: const Icon(
              Icons.pets_outlined,
              size: 30,
              color: Colors.black,
            ),
          ),
          const Text("PetShop"),
        ],
      ),
    );
  }
}
