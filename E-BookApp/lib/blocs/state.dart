abstract class bookstates {}

class bookinitialstate extends bookstates {}

class bookchangestate extends bookstates {}

class booksgetrecentbookssucess extends bookstates {}

class loadingstate extends bookstates {}

class booksgetrecentbookerorr extends bookstates {
  late final String error;

  booksgetrecentbookerorr(this.error);
}

class searchbookssucess extends bookstates {}

class loadingsearchstate extends bookstates {}

class searchbookerorr extends bookstates {
  late final String error;

  searchbookerorr(this.error);
}

class bookinfossucess extends bookstates {}

class bookinfostate extends bookstates {}

class bookinfoerorr extends bookstates {
  late final String error;

  bookinfoerorr(this.error);
}

class historyssucess extends bookstates {}

class loadingcategorystate extends bookstates {}

class historyerorr extends bookstates {
  late final String error;

  historyerorr(this.error);
}

class businessssucess extends bookstates {}

class loadingbusinseestate extends bookstates {}

class businesserorr extends bookstates {
  late final String error;

  businesserorr(this.error);
}

class computerssucess extends bookstates {}

class loadingcomputerstate extends bookstates {}

class computererorr extends bookstates {
  late final String error;

  computererorr(this.error);
}

class mathsucess extends bookstates {}

class loadingmathstate extends bookstates {}

class matherorr extends bookstates {
  late final String error;

  matherorr(this.error);
}
class CreateDatabaseState extends bookstates{}

class GetDatabaseState extends bookstates{}

class InsertDatabaseState extends bookstates{}

class ChangeBottomFavState extends bookstates{}
