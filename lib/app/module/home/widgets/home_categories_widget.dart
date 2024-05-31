part of '../home_page.dart';

class HomeCategoriesWidget extends StatelessWidget {
  final HomeController _controller;

  const HomeCategoriesWidget({
    required HomeController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Observer(builder: (context) {
        return Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _controller.listCategories.length,
            itemBuilder: (context, index) {
              final category = _controller.listCategories[index];
              return _CategoryItem(category);
            },
          ),
        );
      }),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final SupplierCategoryModel _categoryModel;

  const _CategoryItem(this._categoryModel);

  static const categoriesIcons = {
    'P': Icons.pets_outlined,
    'V': Icons.local_hospital_rounded,
    'C': Icons.store_mall_directory_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: context.primaryColorLight,
            child: Icon(
              categoriesIcons[_categoryModel.type],
              size: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(_categoryModel.name),
        ],
      ),
    );
  }
}
