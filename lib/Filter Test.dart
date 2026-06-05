import 'package:todo_list/Models/FilterModules.dart';

void main() {
  DateTime? UserDate = DateTime(2026, DateTime.june, 14);
  print(UserDate);
  print(" is This Week  ${Filtermodules().IsWeekly(UserDate)}");
  print(" is This month ${Filtermodules().IsMonthly(UserDate)}");
}
