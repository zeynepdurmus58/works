// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIncomeCollection on Isar {
  IsarCollection<Income> get incomes => this.collection();
}

const IncomeSchema = CollectionSchema(
  name: r'Income',
  id: -267602993667790363,
  properties: {
    r'income_amount': PropertySchema(
      id: 0,
      name: r'income_amount',
      type: IsarType.double,
    ),
    r'income_note': PropertySchema(
      id: 1,
      name: r'income_note',
      type: IsarType.string,
    ),
    r'income_source': PropertySchema(
      id: 2,
      name: r'income_source',
      type: IsarType.string,
    ),
    r'income_title': PropertySchema(
      id: 3,
      name: r'income_title',
      type: IsarType.string,
    )
  },
  estimateSize: _incomeEstimateSize,
  serialize: _incomeSerialize,
  deserialize: _incomeDeserialize,
  deserializeProp: _incomeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'expenditure': LinkSchema(
      id: 3315533506678374731,
      name: r'expenditure',
      target: r'Expenditure',
      single: true,
    ),
    r'category': LinkSchema(
      id: -3420350173737523586,
      name: r'category',
      target: r'Category',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _incomeGetId,
  getLinks: _incomeGetLinks,
  attach: _incomeAttach,
  version: '3.0.5',
);

int _incomeEstimateSize(
  Income object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.income_note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.income_source;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.income_title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _incomeSerialize(
  Income object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.income_amount);
  writer.writeString(offsets[1], object.income_note);
  writer.writeString(offsets[2], object.income_source);
  writer.writeString(offsets[3], object.income_title);
}

Income _incomeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Income();
  object.id = id;
  object.income_amount = reader.readDouble(offsets[0]);
  object.income_note = reader.readStringOrNull(offsets[1]);
  object.income_source = reader.readStringOrNull(offsets[2]);
  object.income_title = reader.readStringOrNull(offsets[3]);
  return object;
}

P _incomeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _incomeGetId(Income object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _incomeGetLinks(Income object) {
  return [object.expenditure, object.category];
}

void _incomeAttach(IsarCollection<dynamic> col, Id id, Income object) {
  object.id = id;
  object.expenditure
      .attach(col, col.isar.collection<Expenditure>(), r'expenditure', id);
  object.category.attach(col, col.isar.collection<Category>(), r'category', id);
}

extension IncomeQueryWhereSort on QueryBuilder<Income, Income, QWhere> {
  QueryBuilder<Income, Income, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IncomeQueryWhere on QueryBuilder<Income, Income, QWhereClause> {
  QueryBuilder<Income, Income, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Income, Income, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Income, Income, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Income, Income, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IncomeQueryFilter on QueryBuilder<Income, Income, QFilterCondition> {
  QueryBuilder<Income, Income, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'income_amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'income_amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'income_amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'income_amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'income_note',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'income_note',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'income_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'income_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'income_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'income_note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'income_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'income_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'income_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'income_note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'income_note',
        value: '',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'income_note',
        value: '',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'income_source',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'income_source',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'income_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'income_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'income_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'income_source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'income_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'income_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'income_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'income_source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'income_source',
        value: '',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition>
      income_sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'income_source',
        value: '',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'income_title',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'income_title',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'income_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'income_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'income_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'income_title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'income_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'income_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'income_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'income_title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'income_title',
        value: '',
      ));
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> income_titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'income_title',
        value: '',
      ));
    });
  }
}

extension IncomeQueryObject on QueryBuilder<Income, Income, QFilterCondition> {}

extension IncomeQueryLinks on QueryBuilder<Income, Income, QFilterCondition> {
  QueryBuilder<Income, Income, QAfterFilterCondition> expenditure(
      FilterQuery<Expenditure> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'expenditure');
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> expenditureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'expenditure', 0, true, 0, true);
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> category(
      FilterQuery<Category> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'category');
    });
  }

  QueryBuilder<Income, Income, QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'category', 0, true, 0, true);
    });
  }
}

extension IncomeQuerySortBy on QueryBuilder<Income, Income, QSortBy> {
  QueryBuilder<Income, Income, QAfterSortBy> sortByIncome_amount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_amount', Sort.asc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> sortByIncome_amountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_amount', Sort.desc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> sortByIncome_note() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_note', Sort.asc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> sortByIncome_noteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_note', Sort.desc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> sortByIncome_source() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_source', Sort.asc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> sortByIncome_sourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_source', Sort.desc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> sortByIncome_title() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_title', Sort.asc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> sortByIncome_titleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_title', Sort.desc);
    });
  }
}

extension IncomeQuerySortThenBy on QueryBuilder<Income, Income, QSortThenBy> {
  QueryBuilder<Income, Income, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> thenByIncome_amount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_amount', Sort.asc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> thenByIncome_amountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_amount', Sort.desc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> thenByIncome_note() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_note', Sort.asc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> thenByIncome_noteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_note', Sort.desc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> thenByIncome_source() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_source', Sort.asc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> thenByIncome_sourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_source', Sort.desc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> thenByIncome_title() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_title', Sort.asc);
    });
  }

  QueryBuilder<Income, Income, QAfterSortBy> thenByIncome_titleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'income_title', Sort.desc);
    });
  }
}

extension IncomeQueryWhereDistinct on QueryBuilder<Income, Income, QDistinct> {
  QueryBuilder<Income, Income, QDistinct> distinctByIncome_amount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'income_amount');
    });
  }

  QueryBuilder<Income, Income, QDistinct> distinctByIncome_note(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'income_note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Income, Income, QDistinct> distinctByIncome_source(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'income_source',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Income, Income, QDistinct> distinctByIncome_title(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'income_title', caseSensitive: caseSensitive);
    });
  }
}

extension IncomeQueryProperty on QueryBuilder<Income, Income, QQueryProperty> {
  QueryBuilder<Income, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Income, double, QQueryOperations> income_amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'income_amount');
    });
  }

  QueryBuilder<Income, String?, QQueryOperations> income_noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'income_note');
    });
  }

  QueryBuilder<Income, String?, QQueryOperations> income_sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'income_source');
    });
  }

  QueryBuilder<Income, String?, QQueryOperations> income_titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'income_title');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetExpenditureCollection on Isar {
  IsarCollection<Expenditure> get expenditures => this.collection();
}

const ExpenditureSchema = CollectionSchema(
  name: r'Expenditure',
  id: 7148938471511735020,
  properties: {
    r'expenditure_amount': PropertySchema(
      id: 0,
      name: r'expenditure_amount',
      type: IsarType.double,
    ),
    r'expenditure_note': PropertySchema(
      id: 1,
      name: r'expenditure_note',
      type: IsarType.string,
    ),
    r'expenditure_source': PropertySchema(
      id: 2,
      name: r'expenditure_source',
      type: IsarType.string,
    ),
    r'expenditure_title': PropertySchema(
      id: 3,
      name: r'expenditure_title',
      type: IsarType.string,
    )
  },
  estimateSize: _expenditureEstimateSize,
  serialize: _expenditureSerialize,
  deserialize: _expenditureDeserialize,
  deserializeProp: _expenditureDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'category': LinkSchema(
      id: 6726020436773339375,
      name: r'category',
      target: r'Category',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _expenditureGetId,
  getLinks: _expenditureGetLinks,
  attach: _expenditureAttach,
  version: '3.0.5',
);

int _expenditureEstimateSize(
  Expenditure object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.expenditure_note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expenditure_source;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expenditure_title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _expenditureSerialize(
  Expenditure object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.expenditure_amount);
  writer.writeString(offsets[1], object.expenditure_note);
  writer.writeString(offsets[2], object.expenditure_source);
  writer.writeString(offsets[3], object.expenditure_title);
}

Expenditure _expenditureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Expenditure();
  object.expenditure_amount = reader.readDouble(offsets[0]);
  object.expenditure_note = reader.readStringOrNull(offsets[1]);
  object.expenditure_source = reader.readStringOrNull(offsets[2]);
  object.expenditure_title = reader.readStringOrNull(offsets[3]);
  object.id = id;
  return object;
}

P _expenditureDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _expenditureGetId(Expenditure object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _expenditureGetLinks(Expenditure object) {
  return [object.category];
}

void _expenditureAttach(
    IsarCollection<dynamic> col, Id id, Expenditure object) {
  object.id = id;
  object.category.attach(col, col.isar.collection<Category>(), r'category', id);
}

extension ExpenditureQueryWhereSort
    on QueryBuilder<Expenditure, Expenditure, QWhere> {
  QueryBuilder<Expenditure, Expenditure, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExpenditureQueryWhere
    on QueryBuilder<Expenditure, Expenditure, QWhereClause> {
  QueryBuilder<Expenditure, Expenditure, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExpenditureQueryFilter
    on QueryBuilder<Expenditure, Expenditure, QFilterCondition> {
  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenditure_amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenditure_amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenditure_amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenditure_amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenditure_note',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenditure_note',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenditure_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenditure_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenditure_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenditure_note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenditure_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenditure_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenditure_note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenditure_note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenditure_note',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenditure_note',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenditure_source',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenditure_source',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenditure_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenditure_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenditure_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenditure_source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenditure_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenditure_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenditure_source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenditure_source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenditure_source',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenditure_source',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenditure_title',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenditure_title',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenditure_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenditure_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenditure_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenditure_title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenditure_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenditure_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenditure_title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenditure_title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenditure_title',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      expenditure_titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenditure_title',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExpenditureQueryObject
    on QueryBuilder<Expenditure, Expenditure, QFilterCondition> {}

extension ExpenditureQueryLinks
    on QueryBuilder<Expenditure, Expenditure, QFilterCondition> {
  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition> category(
      FilterQuery<Category> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'category');
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'category', 0, true, 0, true);
    });
  }
}

extension ExpenditureQuerySortBy
    on QueryBuilder<Expenditure, Expenditure, QSortBy> {
  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      sortByExpenditure_amount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_amount', Sort.asc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      sortByExpenditure_amountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_amount', Sort.desc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      sortByExpenditure_note() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_note', Sort.asc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      sortByExpenditure_noteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_note', Sort.desc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      sortByExpenditure_source() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_source', Sort.asc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      sortByExpenditure_sourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_source', Sort.desc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      sortByExpenditure_title() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_title', Sort.asc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      sortByExpenditure_titleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_title', Sort.desc);
    });
  }
}

extension ExpenditureQuerySortThenBy
    on QueryBuilder<Expenditure, Expenditure, QSortThenBy> {
  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      thenByExpenditure_amount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_amount', Sort.asc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      thenByExpenditure_amountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_amount', Sort.desc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      thenByExpenditure_note() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_note', Sort.asc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      thenByExpenditure_noteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_note', Sort.desc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      thenByExpenditure_source() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_source', Sort.asc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      thenByExpenditure_sourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_source', Sort.desc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      thenByExpenditure_title() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_title', Sort.asc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy>
      thenByExpenditure_titleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenditure_title', Sort.desc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ExpenditureQueryWhereDistinct
    on QueryBuilder<Expenditure, Expenditure, QDistinct> {
  QueryBuilder<Expenditure, Expenditure, QDistinct>
      distinctByExpenditure_amount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenditure_amount');
    });
  }

  QueryBuilder<Expenditure, Expenditure, QDistinct> distinctByExpenditure_note(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenditure_note',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QDistinct>
      distinctByExpenditure_source({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenditure_source',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Expenditure, Expenditure, QDistinct> distinctByExpenditure_title(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenditure_title',
          caseSensitive: caseSensitive);
    });
  }
}

extension ExpenditureQueryProperty
    on QueryBuilder<Expenditure, Expenditure, QQueryProperty> {
  QueryBuilder<Expenditure, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Expenditure, double, QQueryOperations>
      expenditure_amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenditure_amount');
    });
  }

  QueryBuilder<Expenditure, String?, QQueryOperations>
      expenditure_noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenditure_note');
    });
  }

  QueryBuilder<Expenditure, String?, QQueryOperations>
      expenditure_sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenditure_source');
    });
  }

  QueryBuilder<Expenditure, String?, QQueryOperations>
      expenditure_titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenditure_title');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCategoryCollection on Isar {
  IsarCollection<Category> get categorys => this.collection();
}

const CategorySchema = CollectionSchema(
  name: r'Category',
  id: 5751694338128944171,
  properties: {
    r'categoryName': PropertySchema(
      id: 0,
      name: r'categoryName',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 1,
      name: r'order',
      type: IsarType.long,
    )
  },
  estimateSize: _categoryEstimateSize,
  serialize: _categorySerialize,
  deserialize: _categoryDeserialize,
  deserializeProp: _categoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _categoryGetId,
  getLinks: _categoryGetLinks,
  attach: _categoryAttach,
  version: '3.0.5',
);

int _categoryEstimateSize(
  Category object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.categoryName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _categorySerialize(
  Category object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoryName);
  writer.writeLong(offsets[1], object.order);
}

Category _categoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Category();
  object.categoryName = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.order = reader.readLong(offsets[1]);
  return object;
}

P _categoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _categoryGetId(Category object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _categoryGetLinks(Category object) {
  return [];
}

void _categoryAttach(IsarCollection<dynamic> col, Id id, Category object) {
  object.id = id;
}

extension CategoryQueryWhereSort on QueryBuilder<Category, Category, QWhere> {
  QueryBuilder<Category, Category, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CategoryQueryWhere on QueryBuilder<Category, Category, QWhereClause> {
  QueryBuilder<Category, Category, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Category, Category, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Category, Category, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Category, Category, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CategoryQueryFilter
    on QueryBuilder<Category, Category, QFilterCondition> {
  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoryName',
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      categoryNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoryName',
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      categoryNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      categoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> categoryNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      categoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition>
      categoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> orderEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> orderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> orderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Category, Category, QAfterFilterCondition> orderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CategoryQueryObject
    on QueryBuilder<Category, Category, QFilterCondition> {}

extension CategoryQueryLinks
    on QueryBuilder<Category, Category, QFilterCondition> {}

extension CategoryQuerySortBy on QueryBuilder<Category, Category, QSortBy> {
  QueryBuilder<Category, Category, QAfterSortBy> sortByCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.asc);
    });
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.desc);
    });
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<Category, Category, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension CategoryQuerySortThenBy
    on QueryBuilder<Category, Category, QSortThenBy> {
  QueryBuilder<Category, Category, QAfterSortBy> thenByCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.asc);
    });
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.desc);
    });
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<Category, Category, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension CategoryQueryWhereDistinct
    on QueryBuilder<Category, Category, QDistinct> {
  QueryBuilder<Category, Category, QDistinct> distinctByCategoryName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Category, Category, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }
}

extension CategoryQueryProperty
    on QueryBuilder<Category, Category, QQueryProperty> {
  QueryBuilder<Category, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Category, String?, QQueryOperations> categoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryName');
    });
  }

  QueryBuilder<Category, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }
}
