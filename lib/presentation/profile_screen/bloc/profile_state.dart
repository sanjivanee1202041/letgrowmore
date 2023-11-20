// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

/// Represents the state of Profile in the application.
class ProfileState extends Equatable {
  ProfileState({
    this.firstNameController,
    this.lastNameController,
    this.phoneNumberController,
    this.selectedDropDownValue,
    this.profileModelObj,
  });

  TextEditingController? firstNameController;

  TextEditingController? lastNameController;

  TextEditingController? phoneNumberController;

  SelectionPopupModel? selectedDropDownValue;

  ProfileModel? profileModelObj;

  @override
  List<Object?> get props => [
        firstNameController,
        lastNameController,
        phoneNumberController,
        selectedDropDownValue,
        profileModelObj,
      ];
  ProfileState copyWith({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? phoneNumberController,
    SelectionPopupModel? selectedDropDownValue,
    ProfileModel? profileModelObj,
  }) {
    return ProfileState(
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      profileModelObj: profileModelObj ?? this.profileModelObj,
    );
  }
}
