// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

/// Represents the state of Profile in the application.
class ProfileState extends Equatable {
  ProfileState({
    this.firstNameEditTextController,
    this.lastNameEditTextController,
    this.phoneNumberEditTextController,
    this.dateOfBirthEditTextController,
    this.selectedDropDownValue,
    this.profileModelObj,
  });

  TextEditingController? firstNameEditTextController;

  TextEditingController? lastNameEditTextController;

  TextEditingController? phoneNumberEditTextController;

  TextEditingController? dateOfBirthEditTextController;

  SelectionPopupModel? selectedDropDownValue;

  ProfileModel? profileModelObj;

  @override
  List<Object?> get props => [
        firstNameEditTextController,
        lastNameEditTextController,
        phoneNumberEditTextController,
        dateOfBirthEditTextController,
        selectedDropDownValue,
        profileModelObj,
      ];
  ProfileState copyWith({
    TextEditingController? firstNameEditTextController,
    TextEditingController? lastNameEditTextController,
    TextEditingController? phoneNumberEditTextController,
    TextEditingController? dateOfBirthEditTextController,
    SelectionPopupModel? selectedDropDownValue,
    ProfileModel? profileModelObj,
  }) {
    return ProfileState(
      firstNameEditTextController:
          firstNameEditTextController ?? this.firstNameEditTextController,
      lastNameEditTextController:
          lastNameEditTextController ?? this.lastNameEditTextController,
      phoneNumberEditTextController:
          phoneNumberEditTextController ?? this.phoneNumberEditTextController,
      dateOfBirthEditTextController:
          dateOfBirthEditTextController ?? this.dateOfBirthEditTextController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      profileModelObj: profileModelObj ?? this.profileModelObj,
    );
  }
}
