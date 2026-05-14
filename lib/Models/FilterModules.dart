class Filtermodules {
  // FilterModules

  bool IsToday(DateTime? Date) {
    final Now = DateTime.now();
    if (Date == null) return false;
    return Date.day == Now.day &&
        Date.month == Now.month &&
        Date.year == Now.year;
  }

  bool IsWeekly(DateTime? Date) {
    if (Date == null) return false;
    final Now = DateTime.now();
    final today = DateTime(Now.year, Now.month, Now.day);
    // week start to end (mon - sun)
    final weekStart = today.subtract(Duration(days: today.weekday));
    final weekEnd = weekStart.add(const Duration(days: 7));
    final dateOnly = DateTime(Date.year, Date.month, Date.day);
    return dateOnly.isAfter(weekStart) && dateOnly.isBefore(weekEnd);
  }

  bool IsMonthly(DateTime? Date) {
    final Now = DateTime.now();
    if (Date == null) return false;
    return Date.month == Now.month && Date.year == Now.year;
  }
}
