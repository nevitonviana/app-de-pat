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
              return _CategoryItem(category, _controller);
            },
          ),
        );
      }),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final SupplierCategoryModel _categoryModel;
  final HomeController _homeController;

  const _CategoryItem(this._categoryModel, this._homeController);

  static const categoriesIcons = {
    'P': Icons.pets_outlined,
    'V': Icons.local_hospital_rounded,
    'C': Icons.store_mall_directory_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _homeController.filterSupplierCategory(_categoryModel);
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Observer(builder: (context) {
              return CircleAvatar(
                radius: 30,
                backgroundColor: _homeController.supplierCategoryFilterSelected?.id == _categoryModel.id
                    ? context.primaryColor
                    : context.primaryColorLight,
                child: Icon(
                  categoriesIcons[_categoryModel.type],
                  size: 30,
                  color: Colors.black,
                ),
              );
            }),
            const SizedBox(height: 10),
            Text(_categoryModel.name),
          ],
        ),
      ),
    );
  }
}
