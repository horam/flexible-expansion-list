class DataHelper {
  DataHelper() {
    _createData();
  }

  late final List<Data> _data = [];

  List<Data> get data => _data;

  _createData() {
    _data
      ..add(
        const Data(
          title: 'category A',
          subtitle: 'category A subtitle',
          id: 1,
          fields: DataField(
            title: 'title field A',
            value: 'value field A',
            description: 'description field A',
          ),
        ),
      )
      ..add(
        const Data(
          title: 'category B',
          subtitle: 'category B subtitle',
          id: 2,
          fields: DataField(
            title: 'title field B',
            value: 'value field B',
            description: 'description field B',
          ),
        ),
      )
      ..add(
        const Data(
          title: 'category C',
          subtitle: 'category c subtitle',
          id: 3,
          fields: DataField(
            title: 'title field C',
            value: 'value field C',
            description: 'description field C',
          ),
        ),
      );
  }
}

class Data {
  final String title;
  final String subtitle;
  final int id;

  final DataField fields;

  const Data({
    required this.title,
    required this.subtitle,
    required this.id,
    required this.fields,
  });
}

class DataField {
  final String title;
  final String value;
  final String description;

  const DataField({
    required this.title,
    required this.description,
    required this.value,
  });
}
