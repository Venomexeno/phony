import '../../../../core/models/detailed_device.dart';
import '../models/compare_result.dart';
import '../models/compare_spec_row.dart';

extension CompareResultSpecs on CompareResult {
  /// Returns a list of comparison rows.
  /// - [requireBothValues] default true => only rows where both devices have values are returned.
  List<CompareSpecRow> get compareSpecs {
    // helper to collect title -> list of values for a device
    Map<String, List<String>> collectValues(DetailedDevice device) {
      final map = <String, List<String>>{};
      for (final spec in device.detailedSpecsList) {
        final titleRaw = spec.title.trim();
        final valueRaw = spec.value.trim();

        final title = titleRaw.toLowerCase();
        final value = valueRaw;

        // skip undefined/empty titles completely
        if (title.isEmpty || title == 'undefined') continue;

        // skip undefined/empty values
        if (value.isEmpty || value.toLowerCase() == 'undefined') continue;

        map.putIfAbsent(title, () => []);
        // avoid duplicates, keep insertion order
        if (!map[title]!.contains(value)) {
          map[title]!.add(value);
        }
      }
      return map;
    }

    final firstMap = collectValues(firstDevice);
    final secondMap = collectValues(secondDevice);

    // build ordered keys: keys from first then the rest from second
    final orderedKeys = <String>[];
    orderedKeys.addAll(firstMap.keys);
    for (final k in secondMap.keys) {
      if (!orderedKeys.contains(k)) orderedKeys.add(k);
    }

    String niceTitle(String key) {
      // Turn "network" or "technology" into "Network" or "Technology"
      return key.split(' ').map((p) {
        if (p.isEmpty) return p;
        return p[0].toUpperCase() + (p.length > 1 ? p.substring(1) : '');
      }).join(' ');
    }

    final List<CompareSpecRow> rows = [];

    for (final key in orderedKeys) {
      final vals1 = firstMap[key] ?? [];
      final vals2 = secondMap[key] ?? [];

      final joined1 = vals1.join(' / ');
      final joined2 = vals2.join(' / ');

      if (joined1.isEmpty || joined2.isEmpty) continue;

      rows.add(CompareSpecRow(
        title: niceTitle(key),
        firstValue: joined1,
        secondValue: joined2,
      ));
    }

    return rows;
  }
}
