
abstract class HomeLayoutStates{}

class HomeLayoutInitialState extends HomeLayoutStates{}
class HomeLayoutSuccessHomeDataState extends HomeLayoutStates{}
class HomeLayoutLoadingHomeDataState extends HomeLayoutStates{}
class HomeLayoutErrorHomeDataState extends HomeLayoutStates{
  //  String error;

  // ShopErrorHomeDataState(this.error);
}
class HomeLayoutChangeBottomNav extends HomeLayoutStates{}

class HomeLayoutChangeGroup extends HomeLayoutStates{}


class GetStudentInfoLoadingState extends HomeLayoutStates{}
class GetStudentInfoSuccessState extends HomeLayoutStates{}
class GetStudentInfoErrorState extends HomeLayoutStates{}


///// get courses

class GetCoursesLoadingState extends HomeLayoutStates{}
class GetCoursesSuccessState extends HomeLayoutStates{}
class GetCoursesErrorState extends HomeLayoutStates{}
class GetCoursesEmptyState extends HomeLayoutStates{}

/////post course
class GroupLoadingState extends HomeLayoutStates{}
class GroupSuccessState extends HomeLayoutStates{}
class GroupErrorState extends HomeLayoutStates{}

/////
class ReloadDataState extends HomeLayoutStates{}
/////schedule
class SheduleLoadingState extends HomeLayoutStates{}
class SheduleSuccessState extends HomeLayoutStates{}
class SheduleErrorState extends HomeLayoutStates{}


/////post Adv

/////view Cousre
class GetViewCoursesLoadingState extends HomeLayoutStates{}
class GetViewCoursesSuccessState extends HomeLayoutStates{}
class GetViewCoursesErrorState extends HomeLayoutStates{}


/////delet Course
class DeleteCourseDataLoadingState extends HomeLayoutStates{}
class DeleteCourseDataSuccessState extends HomeLayoutStates{}
class DeleteCourseDataErrorState extends HomeLayoutStates{}


////remove Register case
class DeleteRegisterCaseLoadingState extends HomeLayoutStates{}
class DeleteRegisterCaseSuccessState extends HomeLayoutStates{}
class DeleteRegisterCaseErrorState extends HomeLayoutStates{}



////Advisor
class AdvisorGetDataLoadingState extends HomeLayoutStates{}
class AdvisorGetDataSuccessState extends HomeLayoutStates{}
class AdvisorGetDataErrorState extends HomeLayoutStates{}


class GetCourseForAdvisorLoadingState extends HomeLayoutStates{}
class GetCourseForAdvisorSuccessState extends HomeLayoutStates{}
class GetCourseForAdvisorErrorState extends HomeLayoutStates{}


/////
//////
class GetRegisterationCoursesLoadingState extends HomeLayoutStates{}
class GetRegisterationCoursesSuccessState extends HomeLayoutStates{}
class GetRegisterationCoursesErrorState extends HomeLayoutStates{}

class ChangeRegisterationCoursesSuccessState extends HomeLayoutStates{}


class ChangeCoursesLoadingState extends HomeLayoutStates{}
class ChangeCoursesSuccessState extends HomeLayoutStates{}
class ChangeCoursesErrorState extends HomeLayoutStates{}


class SubmitRegisterationCoursesLoadingState extends HomeLayoutStates{}
class SubmitRegisterationCoursesSuccessState extends HomeLayoutStates{}
class SubmitRegisterationCoursesErrorState extends HomeLayoutStates{}



class CheckClashLoadingState extends HomeLayoutStates{}
class CheckClashSuccessState extends HomeLayoutStates{}
class CheckClashErrorState extends HomeLayoutStates{}


class ChangeForGroupState extends HomeLayoutStates{}


class RegisterCaseLoadingState extends HomeLayoutStates{}
class RegisterCaseSuccessState extends HomeLayoutStates{}
class RegisterCaseErrorState extends HomeLayoutStates{}



class WithdrawCoursesForStudentLoadingState extends HomeLayoutStates{}
class WithdrawCoursesForStudentSuccessState extends HomeLayoutStates{}
class WithdrawCoursesForStudentErrorState extends HomeLayoutStates{}


class PostWithdrawCoursesToAdvisorLoadingState extends HomeLayoutStates{}
class PostWithdrawCoursesToAdvisorSuccessState extends HomeLayoutStates{}
class PostWithdrawCoursesToAdvisorErrorState extends HomeLayoutStates{}


class WithdrawSemesterForStudentLoadingState extends HomeLayoutStates{}
class WithdrawSemesterForStudentSuccessState extends HomeLayoutStates{}
class WithdrawSemesterForStudentErrorState extends HomeLayoutStates{}


class DoneAcceptGroupSuccessState extends HomeLayoutStates{}
class DoneRejectGroupSuccessState extends HomeLayoutStates{}

class RejectWithdrawingSemState extends HomeLayoutStates{}
class AcceptWithdrawingSemState extends HomeLayoutStates{}



class ViewDegreeSuccessState1 extends HomeLayoutStates{}
class ViewDegreeErrorState1 extends HomeLayoutStates{}
class ViewDegreeLoadingState1 extends HomeLayoutStates{}


class TableLoadingState extends HomeLayoutStates{}
class TableSuccessState extends HomeLayoutStates{}
class TableErrorState extends HomeLayoutStates{}

class SunDayLoadingState extends HomeLayoutStates{}
class SunDaySuccessState extends HomeLayoutStates{}
class SunDayErrorState extends HomeLayoutStates{}


class MondayLoadingState extends HomeLayoutStates{}
class MondaySuccessState extends HomeLayoutStates{}
class MondayErrorState extends HomeLayoutStates{}

class TuesdayLoadingState extends HomeLayoutStates{}
class TuesdaySuccessState extends HomeLayoutStates{}
class TuesdayErrorState extends HomeLayoutStates{}

class WednesdayLoadingState extends HomeLayoutStates{}
class WednesdaySuccessState extends HomeLayoutStates{}
class WednesdayErrorState extends HomeLayoutStates{}

