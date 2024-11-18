import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/congviec_entity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../bloc/congviec_choduyet_cubit.dart';
import '../bloc/congviec_choduyet_state.dart';

class CongViecChoDuyetList extends StatefulWidget {
  @override
  _CongViecChoDuyetListState createState() => _CongViecChoDuyetListState();
}

class _CongViecChoDuyetListState extends State<CongViecChoDuyetList> {
  int _pageIndex = 0;
  final int _pageSize = 3;
  late CongViecDataSource _dataSource;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CongViecChoDuyetCubit, CongViecChoDuyetState>(
      builder: (context, state) {
        if (state is CongViecChoDuyetLoading) {
          return _buildLoadingState();
        } else if (state is CongViecChoDuyetLoadFailure) {
          return _buildFailureState();
        } else if (state is CongViecChoDuyetLoaded) {
          _dataSource = CongViecDataSource(state.choduyets,
              pageIndex: _pageIndex, pageSize: _pageSize);
          return _buildLoadedState(context, state);
        } else {
          return const SizedBox
              .shrink(); // Return an empty box if no state matches
        }
      },
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildFailureState() {
    return const Center(child: Text('Tải danh sách công việc thất bại.'));
  }

  Widget _buildLoadedState(BuildContext context, CongViecChoDuyetLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          state.choduyets.isEmpty
              ? const Center(child: Text('Không có dữ liệu công việc'))
              : SizedBox(
                  height: _calculateTableHeight(state.choduyets.length + 1),
                  child: SfDataGrid(
                    source: _dataSource,
                    columns: _buildColumns(),
                    allowSorting: true,
                    sortingGestureType: SortingGestureType.tap,
                  ),
                ),
          _buildPaginationControls(),
        ],
      ),
    );
  }

  double _calculateTableHeight(int rowCount) {
    if (rowCount > 4) rowCount = 4;
    const double rowHeight = 55.0;
    return rowHeight * rowCount.toDouble();
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      'Công việc chờ duyệt',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blueAccent,
          ),
    );
  }

  List<GridColumn> _buildColumns() {
    return [
      GridColumn(
        columnName: 'Loai',
        columnWidthMode: ColumnWidthMode.auto,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: const Text(
            'Loại',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Ma',
        columnWidthMode: ColumnWidthMode.auto,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: const Text(
            'Mã',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      GridColumn(
        columnName: 'TrangThai',
        columnWidthMode: ColumnWidthMode.auto,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: const Text(
            'Trạng Thái',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      GridColumn(
        columnName: 'TenCongViec',
        columnWidthMode: ColumnWidthMode.auto,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: const Text(
            'Tên Công Việc',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      GridColumn(
        columnName: 'NguoiTao',
        columnWidthMode: ColumnWidthMode.auto,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: const Text(
            'Người Tạo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      GridColumn(
        columnName: 'NguoiThucHien',
        columnWidthMode: ColumnWidthMode.auto,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: const Text(
            'Người Thực Hiện',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      GridColumn(
        columnName: 'MucDo',
        columnWidthMode: ColumnWidthMode.auto,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: const Text(
            'Mức Độ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
      GridColumn(
        columnName: 'HanXuLy',
        columnWidthMode: ColumnWidthMode.auto,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: const Text(
            'Hạn Xử lý',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    ];
  }

  Widget _buildPaginationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _pageIndex > 0
              ? () {
                  setState(() {
                    _pageIndex--;
                  });
                }
              : null,
        ),
        Text('${_pageIndex + 1}'),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: _dataSource.hasNextPage()
              ? () {
                  setState(() {
                    _pageIndex++;
                  });
                }
              : null,
        ),
      ],
    );
  }
}

class CongViecDataSource extends DataGridSource {
  final List<CongViecEntity> _congViecs;
  final int pageIndex;
  final int pageSize;

  CongViecDataSource(this._congViecs,
      {required this.pageIndex, required this.pageSize});

  @override
  List<DataGridRow> get rows {
    int start = pageIndex * pageSize;
    int end = start + pageSize;
    List<CongViecEntity> pageItems = _congViecs.sublist(
        start, end > _congViecs.length ? _congViecs.length : end);

    return pageItems.map((congViec) {
      return DataGridRow(cells: [
        DataGridCell<String>(
            columnName: 'Loai', value: congViec.tenLoaiCv ?? ''),
        DataGridCell<String>(columnName: 'Ma', value: congViec.maCv ?? ''),
        DataGridCell<String>(
            columnName: 'TrangThai', value: congViec.tenTrangThai ?? ''),
        DataGridCell<String>(
            columnName: 'TenCongViec', value: congViec.tenCv ?? ''),
        DataGridCell<String>(
            columnName: 'NguoiTao', value: congViec.nguoiTao ?? ''),
        DataGridCell<String>(
            columnName: 'NguoiThucHien', value: congViec.nguoiThucHien ?? ''),
        DataGridCell<String>(
            columnName: 'MucDo', value: congViec.tenMucDo ?? ''),
        DataGridCell<String>(
            columnName: 'HanXuLy', value: congViec.hanXl ?? ''),
      ]);
    }).toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(cell.value),
        );
      }).toList(),
    );
  }

  bool hasNextPage() {
    return (pageIndex + 1) * pageSize < _congViecs.length;
  }
}
