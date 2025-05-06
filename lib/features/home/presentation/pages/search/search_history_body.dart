import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/text_styles/urbanist_text_style.dart';
import '../../../data/data_sources/local/search_history_service.dart';

class SearchHistoryBody extends StatefulWidget {
  const SearchHistoryBody({super.key});

  @override
  State<SearchHistoryBody> createState() => _SearchHistoryBodyState();
}

class _SearchHistoryBodyState extends State<SearchHistoryBody> {
  final SearchHistoryService _service = SearchHistoryService();
  List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  void _loadHistory() {
    setState(() {
      _history = _service.getHistory();
    });
  }

  void _deleteItem(String query) {
    _service.deleteItem(query);
    _loadHistory();
  }

  void _clearAll() {
    _service.clearHistory();
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: appW(20), right: appH(14)),
      child: Column(
        children: [
          SizedBox(height: appH(24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent",
                style: UrbanistTextStyles().bold(
                  fontSize: 20,
                  color: AppColors.greyScale.grey900,
                ),
              ),
              TextButton(
                onPressed: _clearAll,
                child: Text(
                  "Clear All",
                  style: UrbanistTextStyles().bold(
                    color: AppColors.primary.blue500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: appH(10)),
          Divider(thickness: 1, color: AppColors.greyScale.grey200),
          Expanded(
            child:
                _history.isEmpty
                    ? Center(
                      child: Text(
                        "No search history",
                        style: UrbanistTextStyles().medium(
                          fontSize: 16,
                          color: AppColors.greyScale.grey400,
                        ),
                      ),
                    )
                    : ListView.builder(
                      itemCount: _history.length,
                      itemBuilder:
                          (context, index) => _searchedHistory(_history[index]),
                    ),
          ),
        ],
      ),
    );
  }

  Widget _searchedHistory(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: UrbanistTextStyles().medium(
            fontSize: 18,
            color: AppColors.greyScale.grey600,
          ),
        ),
        IconButton(
          onPressed: () => _deleteItem(title),
          icon: Icon(IconlyLight.close_square),
        ),
      ],
    );
  }
}
