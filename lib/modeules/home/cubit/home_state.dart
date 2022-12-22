
abstract class StudentInfoStates{}

class StudentInfoCubitInitialState extends StudentInfoStates{}
class StudentInfoSuccessHomeDataState extends StudentInfoStates{}
class StudentInfoLoadingHomeDataState extends StudentInfoStates{}
class StudentInfoErrorHomeDataState extends StudentInfoStates{}


class UpdateProfileLoadingState extends StudentInfoStates{}
class UpdateProfileSuccessState extends StudentInfoStates{}
class UpdateProfileErrorState extends StudentInfoStates{}

class ReloadUpdateProfileState extends StudentInfoStates{}



