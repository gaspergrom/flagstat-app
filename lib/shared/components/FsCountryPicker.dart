import 'package:flagstat_app/shared/components/FsButton.dart';
import 'package:flagstat_app/shared/components/FsSearch.dart';
import 'package:flagstat_app/shared/components/FsText.dart';
import 'package:flagstat_app/shared/components/shared/FsCheck.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsIcons.dart';
import 'package:flagstat_app/shared/constants/FsStatic.dart';
import 'package:flagstat_app/shared/controllers/global.controller.dart';
import 'package:flagstat_app/shared/models/Country.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FsCountryPicker<T> extends ReactiveFormField<T, T> {
  FsCountryPicker(
      {Key? key,
      String? formControlName,
      FormControl<T>? formControl,
      String placeholder = ''})
      : super(
          key: key,
          formControl: formControl,
          formControlName: formControlName,
          builder: (ReactiveFormFieldState<T, T> field) {
            return GestureDetector(
              onTap: () {
                Get.bottomSheet(
                        FsCountryPickerModal(
                          country: field.value as String,
                        ),
                        isScrollControlled: true)
                    .then((data) {
                  field.didChange(data);
                });
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 22, top: 17, bottom: 17),
                decoration: BoxDecoration(
                  border: Border.all(color: FsColors.gray, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FsText(placeholder,
                        size: FsTextSize.size16, color: FsColors.grayDark),
                    const Icon(FsIcons.chevron_down, size: 11)
                  ],
                ),
              ),
            );
          },
        );

  @override
  ReactiveFormFieldState<T, T> createState() => ReactiveFormFieldState<T, T>();
}

class FsCountryPickerModal extends StatefulWidget {
  final String country;

  const FsCountryPickerModal({Key? key, this.country = ''}) : super(key: key);

  @override
  State<FsCountryPickerModal> createState() => _FsCountryPickerModalState();
}

class _FsCountryPickerModalState extends State<FsCountryPickerModal> {
  String selectedLetter = '';
  String searchQuery = '';

  final GlobalController globalController = Get.find<GlobalController>();

  final List<String> alphabet = FsStatic.getAlphabet();

  @override
  void initState() {
    super.initState();
    if (globalController.countries.value.isEmpty) {
      globalController.getCountries();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CountryModel> countries = globalController.countries.value;
    var filteredCountries = filterCountries(countries);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: FractionallySizedBox(
        heightFactor: 0.92,
        child: Container(
          decoration: const BoxDecoration(
              color: FsColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 32,
                    ),
                    const FsText(
                      'Select your country',
                      size: FsTextSize.size16,
                      weight: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(FsIcons.delete, size: 32),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: FsColors.gray),
                  ),
                ),
                child: FsSearch(
                  label: 'Search',
                  onChange: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
              filteredCountries.isNotEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 74,
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: FsColors.gray, width: 1))),
                          child: ListView.builder(
                            itemCount: alphabet.length,
                            itemBuilder: (BuildContext context, int index) {
                              return letterBox(alphabet[index]);
                            },
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.92 - 250,
                          child: ListView.builder(
                            itemCount: alphabet.length,
                            itemBuilder: (BuildContext context, int index) {
                              return letterCountries(alphabet[index], filteredCountries);
                            },
                          ),
                        )
                      ],
                    )
                  : (countries.isEmpty ? Container() : emptySearch())
            ],
          ),
        ),
      ),
    );
  }

  letterBox(String letter) {
    return Container(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () => setState(() {
          selectedLetter = (selectedLetter == letter ? '' : letter);
        }),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              border: Border.all(
                  color: selectedLetter == letter
                      ? FsColors.primary
                      : FsColors.gray,
                  width: 2),
              borderRadius: BorderRadius.circular(6),
              color:
                  selectedLetter == letter ? FsColors.primary : FsColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FsText(
                letter,
                size: FsTextSize.size16,
                weight: FontWeight.bold,
                color: selectedLetter == letter
                    ? FsColors.white
                    : FsColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }

  letterCountries(String letter, List<CountryModel> countries) {
    if (selectedLetter != letter && selectedLetter != '') {
      return Container();
    }
    var letterCountries = countries.where((c) => c.englishName.startsWith(letter));
    if(letterCountries.isEmpty){
      return Container();
    }
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: FsColors.grayLight,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: FsText(
            letter,
            size: FsTextSize.size16,
            weight: FontWeight.w500,
          ),
        ),
        ...letterCountries.map((c){
          return Container(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () => Get.back(result: c),
              child: Container(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 24),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: FsColors.gray),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.network(
                          "https://hatscripts.github.io/circle-flags/flags/${c.iso2}.svg",
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        FsText(
                          c.englishName,
                          size: FsTextSize.size16,
                          weight: FontWeight.w500,
                        )
                      ],
                    ),
                    FsCheck(
                      enabled: false,
                      circular: true,
                    )
                  ],
                ),
              ),
            ),
          );
        })

      ],
    );
  }

  emptySearch(){
    return Container(
      padding: const EdgeInsets.only(top: 58),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/global/no_results.svg',
            width: 120,
            height: 120,
          ),
          const SizedBox(
            height: 16,
          ),
          const FsText(
            "No results for",
            size: FsTextSize.size18,
            textAlign: TextAlign.center,
          ),
          FsText(
            "“$searchQuery”",
            size: FsTextSize.size18,
            textAlign: TextAlign.center,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  List<CountryModel> filterCountries(List<CountryModel> countries) {
    return countries
        .where((country) => country.englishName
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();
  }
}
