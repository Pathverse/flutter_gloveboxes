///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final pvtrl = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsLoginEn login = TranslationsLoginEn.internal(_root);
	late final TranslationsRegisterEn register = TranslationsRegisterEn.internal(_root);
	late final TranslationsPasswordResetEn passwordReset = TranslationsPasswordResetEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCommonMessageEn message = TranslationsCommonMessageEn.internal(_root);
	late final TranslationsCommonGameEn game = TranslationsCommonGameEn.internal(_root);
	late final TranslationsCommonSocialEn social = TranslationsCommonSocialEn.internal(_root);
	late final TranslationsCommonViewsEn views = TranslationsCommonViewsEn.internal(_root);
	late final TranslationsCommonUnitsEn units = TranslationsCommonUnitsEn.internal(_root);
	late final TranslationsCommonNumbersEn numbers = TranslationsCommonNumbersEn.internal(_root);
	late final TranslationsCommonRanksEn ranks = TranslationsCommonRanksEn.internal(_root);
	late final TranslationsCommonControlEn control = TranslationsCommonControlEn.internal(_root);
	late final TranslationsCommonButtonsEn buttons = TranslationsCommonButtonsEn.internal(_root);
	late final TranslationsCommonLabelsEn labels = TranslationsCommonLabelsEn.internal(_root);
	late final TranslationsCommonResponseEn response = TranslationsCommonResponseEn.internal(_root);
	late final TranslationsCommonPriorityEn priority = TranslationsCommonPriorityEn.internal(_root);
	late final TranslationsCommonDateEn date = TranslationsCommonDateEn.internal(_root);
	late final TranslationsCommonWeekdaysEn weekdays = TranslationsCommonWeekdaysEn.internal(_root);
	late final TranslationsCommonFormRestrictionsEn formRestrictions = TranslationsCommonFormRestrictionsEn.internal(_root);
	late final TranslationsCommonTosEn tos = TranslationsCommonTosEn.internal(_root);
	late final TranslationsCommonPermissionsEn permissions = TranslationsCommonPermissionsEn.internal(_root);
	late final TranslationsCommonPromptsEn prompts = TranslationsCommonPromptsEn.internal(_root);
}

// Path: login
class TranslationsLoginEn {
	TranslationsLoginEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsLoginMessageEn message = TranslationsLoginMessageEn.internal(_root);
	late final TranslationsLoginFormEn form = TranslationsLoginFormEn.internal(_root);
	late final TranslationsLoginTooltipEn tooltip = TranslationsLoginTooltipEn.internal(_root);
	late final TranslationsLoginValidationEn validation = TranslationsLoginValidationEn.internal(_root);
}

// Path: register
class TranslationsRegisterEn {
	TranslationsRegisterEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsRegisterMessageEn message = TranslationsRegisterMessageEn.internal(_root);
	late final TranslationsRegisterFormEn form = TranslationsRegisterFormEn.internal(_root);
	late final TranslationsRegisterTooltipEn tooltip = TranslationsRegisterTooltipEn.internal(_root);
	late final TranslationsRegisterValidationEn validation = TranslationsRegisterValidationEn.internal(_root);
}

// Path: passwordReset
class TranslationsPasswordResetEn {
	TranslationsPasswordResetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPasswordResetMessageEn message = TranslationsPasswordResetMessageEn.internal(_root);
	late final TranslationsPasswordResetFormEn form = TranslationsPasswordResetFormEn.internal(_root);
	late final TranslationsPasswordResetTooltipEn tooltip = TranslationsPasswordResetTooltipEn.internal(_root);
	late final TranslationsPasswordResetValidationEn validation = TranslationsPasswordResetValidationEn.internal(_root);
}

// Path: common.message
class TranslationsCommonMessageEn {
	TranslationsCommonMessageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading'
	String get loading => 'Loading';

	/// en: 'Something went wrong'
	String get somethingWentWrong => 'Something went wrong';

	/// en: 'There is a network problem'
	String get networkProblem => 'There is a network problem';

	/// en: 'No data found'
	String get noDataFound => 'No data found';

	/// en: 'No results found'
	String get noResultsFound => 'No results found';

	/// en: 'Unsupported file type'
	String get unsupportedFileType => 'Unsupported file type';

	/// en: 'File is too large'
	String get fileTooLarge => 'File is too large';

	/// en: 'Operation timed out'
	String get operationTimedOut => 'Operation timed out';

	/// en: 'Session expired'
	String get sessionExpired => 'Session expired';

	/// en: 'Changes could not be saved'
	String get unsavableChanges => 'Changes could not be saved';

	/// en: 'Could not connect to the server'
	String get noServerConnect => 'Could not connect to the server';

	/// en: 'Access denied'
	String get accessDenied => 'Access denied';
}

// Path: common.game
class TranslationsCommonGameEn {
	TranslationsCommonGameEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Start Game'
	String get start => 'Start Game';

	/// en: 'Pause Game'
	String get pause => 'Pause Game';

	/// en: 'Resume Game'
	String get resume => 'Resume Game';

	/// en: 'End Game'
	String get end => 'End Game';

	/// en: 'Level Up'
	String get levelUp => 'Level Up';

	/// en: 'Game Over'
	String get gameOver => 'Game Over';

	/// en: 'Next Level'
	String get nextLevel => 'Next Level';

	/// en: 'Previous Level'
	String get previousLevel => 'Previous Level';

	/// en: 'Restart Game'
	String get restart => 'Restart Game';
}

// Path: common.social
class TranslationsCommonSocialEn {
	TranslationsCommonSocialEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Like'
	String get like => 'Like';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Comment'
	String get comment => 'Comment';

	/// en: 'Follow'
	String get follow => 'Follow';

	/// en: 'Unfollow'
	String get unfollow => 'Unfollow';

	/// en: 'Unlike'
	String get unlike => 'Unlike';

	/// en: 'Reply'
	String get reply => 'Reply';

	/// en: 'Dislike'
	String get dislike => 'Dislike';

	/// en: 'Block'
	String get block => 'Block';

	/// en: 'Block User'
	String get blockUser => 'Block User';

	/// en: 'Report'
	String get report => 'Report';

	/// en: 'Mute'
	String get mute => 'Mute';

	/// en: 'You sent a friend request'
	String get uSentFriendRequest => 'You sent a friend request';

	/// en: 'You received a friend request'
	String get uReceivedFriendRequest => 'You received a friend request';

	/// en: 'sent a friend request'
	String get sentFriendRequest => 'sent a friend request';

	/// en: 'received a friend request'
	String get receivedFriendRequest => 'received a friend request';

	/// en: 'accepted a friend request'
	String get acceptedFriendRequest => 'accepted a friend request';

	/// en: 'You accepted a friend request'
	String get uAcceptedFriendRequest => 'You accepted a friend request';
}

// Path: common.views
class TranslationsCommonViewsEn {
	TranslationsCommonViewsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'List'
	String get list => 'List';

	/// en: 'Grid'
	String get grid => 'Grid';

	/// en: 'Table'
	String get table => 'Table';

	/// en: 'Form'
	String get form => 'Form';
}

// Path: common.units
class TranslationsCommonUnitsEn {
	TranslationsCommonUnitsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCommonUnitsLengthEn length = TranslationsCommonUnitsLengthEn.internal(_root);
	late final TranslationsCommonUnitsWeightEn weight = TranslationsCommonUnitsWeightEn.internal(_root);
	late final TranslationsCommonUnitsVolumeEn volume = TranslationsCommonUnitsVolumeEn.internal(_root);
	late final TranslationsCommonUnitsTimeEn time = TranslationsCommonUnitsTimeEn.internal(_root);
	late final TranslationsCommonUnitsAreaEn area = TranslationsCommonUnitsAreaEn.internal(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersEn {
	TranslationsCommonNumbersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'One'
	String get k1 => 'One';

	/// en: 'Two'
	String get k2 => 'Two';

	/// en: 'Three'
	String get k3 => 'Three';

	/// en: 'Four'
	String get k4 => 'Four';

	/// en: 'Five'
	String get k5 => 'Five';

	/// en: 'Six'
	String get k6 => 'Six';

	/// en: 'Seven'
	String get k7 => 'Seven';

	/// en: 'Eight'
	String get k8 => 'Eight';

	/// en: 'Nine'
	String get k9 => 'Nine';

	/// en: 'Ten'
	String get k10 => 'Ten';
}

// Path: common.ranks
class TranslationsCommonRanksEn {
	TranslationsCommonRanksEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'first'
	String get k1 => 'first';

	/// en: 'second'
	String get k2 => 'second';

	/// en: 'third'
	String get k3 => 'third';

	/// en: 'fourth'
	String get k4 => 'fourth';

	/// en: 'fifth'
	String get k5 => 'fifth';

	/// en: 'sixth'
	String get k6 => 'sixth';

	/// en: 'seventh'
	String get k7 => 'seventh';

	/// en: 'eighth'
	String get k8 => 'eighth';

	/// en: 'ninth'
	String get k9 => 'ninth';

	/// en: 'tenth'
	String get k10 => 'tenth';
}

// Path: common.control
class TranslationsCommonControlEn {
	TranslationsCommonControlEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'On'
	String get on => 'On';

	/// en: 'Off'
	String get off => 'Off';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Revert'
	String get revert => 'Revert';

	/// en: 'Save'
	String get save => 'Save';
}

// Path: common.buttons
class TranslationsCommonButtonsEn {
	TranslationsCommonButtonsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Upload'
	String get upload => 'Upload';

	/// en: 'Choose'
	String get choose => 'Choose';

	/// en: 'Select'
	String get select => 'Select';

	/// en: 'Clear'
	String get clear => 'Clear';

	/// en: 'Start'
	String get start => 'Start';
}

// Path: common.labels
class TranslationsCommonLabelsEn {
	TranslationsCommonLabelsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Required'
	String get required => 'Required';

	/// en: 'Optional'
	String get optional => 'Optional';

	/// en: 'Instructions:'
	String get instructions => 'Instructions:';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Progress'
	String get progress => 'Progress';

	/// en: 'Question'
	String get question => 'Question';

	/// en: 'Answer'
	String get answer => 'Answer';

	/// en: 'Response'
	String get response => 'Response';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Warning'
	String get warning => 'Warning';
}

// Path: common.response
class TranslationsCommonResponseEn {
	TranslationsCommonResponseEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Info'
	String get info => 'Info';

	/// en: 'Warning'
	String get warning => 'Warning';

	/// en: 'To Be Determined'
	String get tbd => 'To Be Determined';

	/// en: 'Work In Progress'
	String get wip => 'Work In Progress';
}

// Path: common.priority
class TranslationsCommonPriorityEn {
	TranslationsCommonPriorityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'High'
	String get high => 'High';

	/// en: 'Medium'
	String get medium => 'Medium';

	/// en: 'Low'
	String get low => 'Low';
}

// Path: common.date
class TranslationsCommonDateEn {
	TranslationsCommonDateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Yesterday'
	String get yesterday => 'Yesterday';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// en: 'Just now'
	String get justNow => 'Just now';

	/// en: 'A moment ago'
	String get aMomentAgo => 'A moment ago';

	/// en: 'Minutes ago'
	String get minutesAgo => 'Minutes ago';

	/// en: 'Hours ago'
	String get hoursAgo => 'Hours ago';

	/// en: '{days} days ago'
	String daysAgo({required Object days}) => '${days} days ago';

	/// en: 'Weeks ago'
	String get weeksAgo => 'Weeks ago';

	/// en: 'This week'
	String get thisWeek => 'This week';

	/// en: 'Last week'
	String get lastWeek => 'Last week';

	/// en: 'This month'
	String get thisMonth => 'This month';

	/// en: 'Last month'
	String get lastMonth => 'Last month';

	/// en: 'This year'
	String get thisYear => 'This year';

	/// en: 'Last year'
	String get lastYear => 'Last year';

	/// en: '{days} days ahead'
	String daysAhead({required Object days}) => '${days} days ahead';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCommonWeekdaysFullEn full = TranslationsCommonWeekdaysFullEn.internal(_root);
	late final TranslationsCommonWeekdaysShortEn short = TranslationsCommonWeekdaysShortEn.internal(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'This field is required.'
	String get required => 'This field is required.';

	/// en: 'Minimum length is {min} characters.'
	String minLength({required Object min}) => 'Minimum length is ${min} characters.';

	/// en: 'Maximum length is {max} characters.'
	String maxLength({required Object max}) => 'Maximum length is ${max} characters.';

	/// en: 'The format is invalid.'
	String get invalidFormat => 'The format is invalid.';

	/// en: 'This field must follow the pattern {pattern}.'
	String pattern({required Object pattern}) => 'This field must follow the pattern ${pattern}.';
}

// Path: common.tos
class TranslationsCommonTosEn {
	TranslationsCommonTosEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'I accept the Terms and Conditions'
	String get accept => 'I accept the Terms and Conditions';

	/// en: 'Please read and accept our Terms and Conditions'
	String get readAccept => 'Please read and accept our Terms and Conditions';

	/// en: 'Terms and Conditions'
	String get title => 'Terms and Conditions';

	/// en: 'Terms of Service'
	String get service => 'Terms of Service';

	/// en: 'Privacy Policy'
	String get privacy => 'Privacy Policy';

	/// en: 'By continuing, you agree to our Terms and Conditions'
	String get continueAgree => 'By continuing, you agree to our Terms and Conditions';

	/// en: 'You must accept the Terms and Conditions to proceed'
	String get mustAccept => 'You must accept the Terms and Conditions to proceed';

	/// en: 'View Terms and Conditions'
	String get view => 'View Terms and Conditions';

	/// en: 'Last updated: {date}'
	String lastUpdated({required Object date}) => 'Last updated: ${date}';

	/// en: 'Contact us for more information about our Terms and Conditions'
	String get contactInfo => 'Contact us for more information about our Terms and Conditions';
}

// Path: common.permissions
class TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Allow access to location?'
	String get allowLocation => 'Allow access to location?';

	/// en: 'Allow access to camera?'
	String get allowCamera => 'Allow access to camera?';

	/// en: 'Allow access to microphone?'
	String get allowMicrophone => 'Allow access to microphone?';

	/// en: 'Allow notifications?'
	String get allowNotifications => 'Allow notifications?';

	/// en: 'Allow access to contacts?'
	String get allowContacts => 'Allow access to contacts?';

	/// en: 'Allow access to photos?'
	String get allowPhotos => 'Allow access to photos?';

	/// en: 'Allow access to storage?'
	String get allowStorage => 'Allow access to storage?';

	/// en: 'Allow Bluetooth access?'
	String get allowBluetooth => 'Allow Bluetooth access?';

	/// en: 'We need your permission to proceed'
	String get needPermission => 'We need your permission to proceed';

	/// en: 'Permission denied'
	String get permissionDenied => 'Permission denied';

	/// en: 'This permission is required'
	String get permissionRequired => 'This permission is required';

	/// en: 'Please enable in Settings'
	String get enableInSettings => 'Please enable in Settings';
}

// Path: common.prompts
class TranslationsCommonPromptsEn {
	TranslationsCommonPromptsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your session has expired'
	String get sessionExpired => 'Your session has expired';

	/// en: 'Are you sure?'
	String get areYouSure => 'Are you sure?';

	/// en: 'This action cannot be undone'
	String get cannotBeUndone => 'This action cannot be undone';

	/// en: 'You have unsaved changes'
	String get unsavedChanges => 'You have unsaved changes';

	/// en: 'Discard changes?'
	String get discardChanges => 'Discard changes?';

	/// en: 'Location services are disabled'
	String get locationDisabled => 'Location services are disabled';

	/// en: 'Network connection required'
	String get networkRequired => 'Network connection required';

	/// en: 'Login required to continue'
	String get loginRequired => 'Login required to continue';

	/// en: 'Are you sure you want to delete this?'
	String get confirmDelete => 'Are you sure you want to delete this?';

	/// en: 'Are you sure you want to logout?'
	String get confirmLogout => 'Are you sure you want to logout?';

	/// en: 'Do you want to save before exiting?'
	String get saveBeforeExit => 'Do you want to save before exiting?';

	/// en: 'Would you like to reload the page?'
	String get reloadPage => 'Would you like to reload the page?';

	/// en: 'An update is available'
	String get updateAvailable => 'An update is available';

	/// en: 'Restart required to apply changes'
	String get restartRequired => 'Restart required to apply changes';
}

// Path: login.message
class TranslationsLoginMessageEn {
	TranslationsLoginMessageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login successful.'
	String get success => 'Login successful.';

	/// en: 'Login failed. Please try again.'
	String get error => 'Login failed. Please try again.';

	/// en: 'Please verify your credentials.'
	String get wrongPassword => 'Please verify your credentials.';
}

// Path: login.form
class TranslationsLoginFormEn {
	TranslationsLoginFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Login'
	String get submit => 'Login';

	/// en: 'Create new account'
	String get createAccount => 'Create new account';

	/// en: 'Forgot password'
	String get forgotPassword => 'Forgot password';
}

// Path: login.tooltip
class TranslationsLoginTooltipEn {
	TranslationsLoginTooltipEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enter your username'
	String get username => 'Enter your username';

	/// en: 'Enter your password'
	String get password => 'Enter your password';

	/// en: 'Click to login'
	String get submit => 'Click to login';
}

// Path: login.validation
class TranslationsLoginValidationEn {
	TranslationsLoginValidationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsLoginValidationUsernameEn username = TranslationsLoginValidationUsernameEn.internal(_root);
	late final TranslationsLoginValidationPasswordEn password = TranslationsLoginValidationPasswordEn.internal(_root);
}

// Path: register.message
class TranslationsRegisterMessageEn {
	TranslationsRegisterMessageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Registration successful.'
	String get success => 'Registration successful.';

	/// en: 'Registration failed. Please try again.'
	String get error => 'Registration failed. Please try again.';
}

// Path: register.form
class TranslationsRegisterFormEn {
	TranslationsRegisterFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Register'
	String get submit => 'Register';

	/// en: 'I accept the Terms of Service'
	String get acceptTos => 'I accept the Terms of Service';
}

// Path: register.tooltip
class TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enter your username'
	String get username => 'Enter your username';

	/// en: 'Enter your email'
	String get email => 'Enter your email';

	/// en: 'Enter your password'
	String get password => 'Enter your password';

	/// en: 'Click to register'
	String get submit => 'Click to register';
}

// Path: register.validation
class TranslationsRegisterValidationEn {
	TranslationsRegisterValidationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsRegisterValidationUsernameEn username = TranslationsRegisterValidationUsernameEn.internal(_root);
	late final TranslationsRegisterValidationEmailEn email = TranslationsRegisterValidationEmailEn.internal(_root);
	late final TranslationsRegisterValidationPasswordEn password = TranslationsRegisterValidationPasswordEn.internal(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Password reset email sent.'
	String get success => 'Password reset email sent.';

	/// en: 'Password reset failed. Please try again.'
	String get error => 'Password reset failed. Please try again.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Reset Password'
	String get submit => 'Reset Password';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enter your email'
	String get email => 'Enter your email';

	/// en: 'Click to reset password'
	String get submit => 'Click to reset password';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPasswordResetValidationEmailEn email = TranslationsPasswordResetValidationEmailEn.internal(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Kilometer'
	String get kilometer => 'Kilometer';

	/// en: 'Meter'
	String get meter => 'Meter';

	/// en: 'Centimeter'
	String get centimeter => 'Centimeter';

	/// en: 'Millimeter'
	String get millimeter => 'Millimeter';

	/// en: 'Micrometer'
	String get micrometer => 'Micrometer';

	/// en: 'Nanometer'
	String get nanometer => 'Nanometer';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Kilogram'
	String get kilogram => 'Kilogram';

	/// en: 'Gram'
	String get gram => 'Gram';

	/// en: 'Milligram'
	String get milligram => 'Milligram';

	/// en: 'Ton'
	String get ton => 'Ton';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Liter'
	String get liter => 'Liter';

	/// en: 'Milliliter'
	String get milliliter => 'Milliliter';

	/// en: 'Cubic Meter'
	String get cubicMeter => 'Cubic Meter';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Second'
	String get second => 'Second';

	/// en: 'Minute'
	String get minute => 'Minute';

	/// en: 'Hour'
	String get hour => 'Hour';

	/// en: 'Day'
	String get day => 'Day';

	/// en: 'Week'
	String get week => 'Week';

	/// en: 'Month'
	String get month => 'Month';

	/// en: 'Year'
	String get year => 'Year';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Square Meter'
	String get squareMeter => 'Square Meter';

	/// en: 'Hectare'
	String get hectare => 'Hectare';

	/// en: 'Acre'
	String get acre => 'Acre';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sunday'
	String get sunday => 'Sunday';

	/// en: 'Monday'
	String get monday => 'Monday';

	/// en: 'Tuesday'
	String get tuesday => 'Tuesday';

	/// en: 'Wednesday'
	String get wednesday => 'Wednesday';

	/// en: 'Thursday'
	String get thursday => 'Thursday';

	/// en: 'Friday'
	String get friday => 'Friday';

	/// en: 'Saturday'
	String get saturday => 'Saturday';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sun'
	String get sunday => 'Sun';

	/// en: 'Mon'
	String get monday => 'Mon';

	/// en: 'Tue'
	String get tuesday => 'Tue';

	/// en: 'Wed'
	String get wednesday => 'Wed';

	/// en: 'Thu'
	String get thursday => 'Thu';

	/// en: 'Fri'
	String get friday => 'Fri';

	/// en: 'Sat'
	String get saturday => 'Sat';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Username is required.'
	String get required => 'Username is required.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Password is required.'
	String get required => 'Password is required.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Username is required.'
	String get required => 'Username is required.';

	/// en: 'Username must be at least {min} characters long.'
	String minLength({required Object min}) => 'Username must be at least ${min} characters long.';

	/// en: 'Username must be at most {max} characters long.'
	String maxLength({required Object max}) => 'Username must be at most ${max} characters long.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Email is required.'
	String get required => 'Email is required.';

	/// en: 'Email is not valid.'
	String get invalid => 'Email is not valid.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Password is required.'
	String get required => 'Password is required.';

	/// en: 'Password must be at least {min} characters long.'
	String minLength({required Object min}) => 'Password must be at least ${min} characters long.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Email is required.'
	String get required => 'Email is required.';

	/// en: 'Email is not valid.'
	String get invalid => 'Email is not valid.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'Loading';
			case 'common.message.somethingWentWrong': return 'Something went wrong';
			case 'common.message.networkProblem': return 'There is a network problem';
			case 'common.message.noDataFound': return 'No data found';
			case 'common.message.noResultsFound': return 'No results found';
			case 'common.message.unsupportedFileType': return 'Unsupported file type';
			case 'common.message.fileTooLarge': return 'File is too large';
			case 'common.message.operationTimedOut': return 'Operation timed out';
			case 'common.message.sessionExpired': return 'Session expired';
			case 'common.message.unsavableChanges': return 'Changes could not be saved';
			case 'common.message.noServerConnect': return 'Could not connect to the server';
			case 'common.message.accessDenied': return 'Access denied';
			case 'common.game.start': return 'Start Game';
			case 'common.game.pause': return 'Pause Game';
			case 'common.game.resume': return 'Resume Game';
			case 'common.game.end': return 'End Game';
			case 'common.game.levelUp': return 'Level Up';
			case 'common.game.gameOver': return 'Game Over';
			case 'common.game.nextLevel': return 'Next Level';
			case 'common.game.previousLevel': return 'Previous Level';
			case 'common.game.restart': return 'Restart Game';
			case 'common.social.like': return 'Like';
			case 'common.social.share': return 'Share';
			case 'common.social.comment': return 'Comment';
			case 'common.social.follow': return 'Follow';
			case 'common.social.unfollow': return 'Unfollow';
			case 'common.social.unlike': return 'Unlike';
			case 'common.social.reply': return 'Reply';
			case 'common.social.dislike': return 'Dislike';
			case 'common.social.block': return 'Block';
			case 'common.social.blockUser': return 'Block User';
			case 'common.social.report': return 'Report';
			case 'common.social.mute': return 'Mute';
			case 'common.social.uSentFriendRequest': return 'You sent a friend request';
			case 'common.social.uReceivedFriendRequest': return 'You received a friend request';
			case 'common.social.sentFriendRequest': return 'sent a friend request';
			case 'common.social.receivedFriendRequest': return 'received a friend request';
			case 'common.social.acceptedFriendRequest': return 'accepted a friend request';
			case 'common.social.uAcceptedFriendRequest': return 'You accepted a friend request';
			case 'common.views.list': return 'List';
			case 'common.views.grid': return 'Grid';
			case 'common.views.table': return 'Table';
			case 'common.views.form': return 'Form';
			case 'common.units.length.kilometer': return 'Kilometer';
			case 'common.units.length.meter': return 'Meter';
			case 'common.units.length.centimeter': return 'Centimeter';
			case 'common.units.length.millimeter': return 'Millimeter';
			case 'common.units.length.micrometer': return 'Micrometer';
			case 'common.units.length.nanometer': return 'Nanometer';
			case 'common.units.weight.kilogram': return 'Kilogram';
			case 'common.units.weight.gram': return 'Gram';
			case 'common.units.weight.milligram': return 'Milligram';
			case 'common.units.weight.ton': return 'Ton';
			case 'common.units.volume.liter': return 'Liter';
			case 'common.units.volume.milliliter': return 'Milliliter';
			case 'common.units.volume.cubicMeter': return 'Cubic Meter';
			case 'common.units.time.second': return 'Second';
			case 'common.units.time.minute': return 'Minute';
			case 'common.units.time.hour': return 'Hour';
			case 'common.units.time.day': return 'Day';
			case 'common.units.time.week': return 'Week';
			case 'common.units.time.month': return 'Month';
			case 'common.units.time.year': return 'Year';
			case 'common.units.area.squareMeter': return 'Square Meter';
			case 'common.units.area.hectare': return 'Hectare';
			case 'common.units.area.acre': return 'Acre';
			case 'common.numbers.k1': return 'One';
			case 'common.numbers.k2': return 'Two';
			case 'common.numbers.k3': return 'Three';
			case 'common.numbers.k4': return 'Four';
			case 'common.numbers.k5': return 'Five';
			case 'common.numbers.k6': return 'Six';
			case 'common.numbers.k7': return 'Seven';
			case 'common.numbers.k8': return 'Eight';
			case 'common.numbers.k9': return 'Nine';
			case 'common.numbers.k10': return 'Ten';
			case 'common.ranks.k1': return 'first';
			case 'common.ranks.k2': return 'second';
			case 'common.ranks.k3': return 'third';
			case 'common.ranks.k4': return 'fourth';
			case 'common.ranks.k5': return 'fifth';
			case 'common.ranks.k6': return 'sixth';
			case 'common.ranks.k7': return 'seventh';
			case 'common.ranks.k8': return 'eighth';
			case 'common.ranks.k9': return 'ninth';
			case 'common.ranks.k10': return 'tenth';
			case 'common.control.on': return 'On';
			case 'common.control.off': return 'Off';
			case 'common.control.yes': return 'Yes';
			case 'common.control.no': return 'No';
			case 'common.control.confirm': return 'Confirm';
			case 'common.control.cancel': return 'Cancel';
			case 'common.control.retry': return 'Retry';
			case 'common.control.logout': return 'Logout';
			case 'common.control.edit': return 'Edit';
			case 'common.control.delete': return 'Delete';
			case 'common.control.revert': return 'Revert';
			case 'common.control.save': return 'Save';
			case 'common.buttons.submit': return 'Submit';
			case 'common.buttons.close': return 'Close';
			case 'common.buttons.reset': return 'Reset';
			case 'common.buttons.cancel': return 'Cancel';
			case 'common.buttons.kContinue': return 'Continue';
			case 'common.buttons.back': return 'Back';
			case 'common.buttons.next': return 'Next';
			case 'common.buttons.done': return 'Done';
			case 'common.buttons.upload': return 'Upload';
			case 'common.buttons.choose': return 'Choose';
			case 'common.buttons.select': return 'Select';
			case 'common.buttons.clear': return 'Clear';
			case 'common.buttons.start': return 'Start';
			case 'common.labels.required': return 'Required';
			case 'common.labels.optional': return 'Optional';
			case 'common.labels.instructions': return 'Instructions:';
			case 'common.labels.status': return 'Status';
			case 'common.labels.progress': return 'Progress';
			case 'common.labels.question': return 'Question';
			case 'common.labels.answer': return 'Answer';
			case 'common.labels.response': return 'Response';
			case 'common.labels.loading': return 'Loading...';
			case 'common.labels.error': return 'Error';
			case 'common.labels.success': return 'Success';
			case 'common.labels.warning': return 'Warning';
			case 'common.response.success': return 'Success';
			case 'common.response.error': return 'Error';
			case 'common.response.info': return 'Info';
			case 'common.response.warning': return 'Warning';
			case 'common.response.tbd': return 'To Be Determined';
			case 'common.response.wip': return 'Work In Progress';
			case 'common.priority.high': return 'High';
			case 'common.priority.medium': return 'Medium';
			case 'common.priority.low': return 'Low';
			case 'common.date.today': return 'Today';
			case 'common.date.yesterday': return 'Yesterday';
			case 'common.date.tomorrow': return 'Tomorrow';
			case 'common.date.justNow': return 'Just now';
			case 'common.date.aMomentAgo': return 'A moment ago';
			case 'common.date.minutesAgo': return 'Minutes ago';
			case 'common.date.hoursAgo': return 'Hours ago';
			case 'common.date.daysAgo': return ({required Object days}) => '${days} days ago';
			case 'common.date.weeksAgo': return 'Weeks ago';
			case 'common.date.thisWeek': return 'This week';
			case 'common.date.lastWeek': return 'Last week';
			case 'common.date.thisMonth': return 'This month';
			case 'common.date.lastMonth': return 'Last month';
			case 'common.date.thisYear': return 'This year';
			case 'common.date.lastYear': return 'Last year';
			case 'common.date.daysAhead': return ({required Object days}) => '${days} days ahead';
			case 'common.weekdays.full.sunday': return 'Sunday';
			case 'common.weekdays.full.monday': return 'Monday';
			case 'common.weekdays.full.tuesday': return 'Tuesday';
			case 'common.weekdays.full.wednesday': return 'Wednesday';
			case 'common.weekdays.full.thursday': return 'Thursday';
			case 'common.weekdays.full.friday': return 'Friday';
			case 'common.weekdays.full.saturday': return 'Saturday';
			case 'common.weekdays.short.sunday': return 'Sun';
			case 'common.weekdays.short.monday': return 'Mon';
			case 'common.weekdays.short.tuesday': return 'Tue';
			case 'common.weekdays.short.wednesday': return 'Wed';
			case 'common.weekdays.short.thursday': return 'Thu';
			case 'common.weekdays.short.friday': return 'Fri';
			case 'common.weekdays.short.saturday': return 'Sat';
			case 'common.formRestrictions.required': return 'This field is required.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'Minimum length is ${min} characters.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'Maximum length is ${max} characters.';
			case 'common.formRestrictions.invalidFormat': return 'The format is invalid.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'This field must follow the pattern ${pattern}.';
			case 'common.tos.accept': return 'I accept the Terms and Conditions';
			case 'common.tos.readAccept': return 'Please read and accept our Terms and Conditions';
			case 'common.tos.title': return 'Terms and Conditions';
			case 'common.tos.service': return 'Terms of Service';
			case 'common.tos.privacy': return 'Privacy Policy';
			case 'common.tos.continueAgree': return 'By continuing, you agree to our Terms and Conditions';
			case 'common.tos.mustAccept': return 'You must accept the Terms and Conditions to proceed';
			case 'common.tos.view': return 'View Terms and Conditions';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'Last updated: ${date}';
			case 'common.tos.contactInfo': return 'Contact us for more information about our Terms and Conditions';
			case 'common.permissions.allowLocation': return 'Allow access to location?';
			case 'common.permissions.allowCamera': return 'Allow access to camera?';
			case 'common.permissions.allowMicrophone': return 'Allow access to microphone?';
			case 'common.permissions.allowNotifications': return 'Allow notifications?';
			case 'common.permissions.allowContacts': return 'Allow access to contacts?';
			case 'common.permissions.allowPhotos': return 'Allow access to photos?';
			case 'common.permissions.allowStorage': return 'Allow access to storage?';
			case 'common.permissions.allowBluetooth': return 'Allow Bluetooth access?';
			case 'common.permissions.needPermission': return 'We need your permission to proceed';
			case 'common.permissions.permissionDenied': return 'Permission denied';
			case 'common.permissions.permissionRequired': return 'This permission is required';
			case 'common.permissions.enableInSettings': return 'Please enable in Settings';
			case 'common.prompts.sessionExpired': return 'Your session has expired';
			case 'common.prompts.areYouSure': return 'Are you sure?';
			case 'common.prompts.cannotBeUndone': return 'This action cannot be undone';
			case 'common.prompts.unsavedChanges': return 'You have unsaved changes';
			case 'common.prompts.discardChanges': return 'Discard changes?';
			case 'common.prompts.locationDisabled': return 'Location services are disabled';
			case 'common.prompts.networkRequired': return 'Network connection required';
			case 'common.prompts.loginRequired': return 'Login required to continue';
			case 'common.prompts.confirmDelete': return 'Are you sure you want to delete this?';
			case 'common.prompts.confirmLogout': return 'Are you sure you want to logout?';
			case 'common.prompts.saveBeforeExit': return 'Do you want to save before exiting?';
			case 'common.prompts.reloadPage': return 'Would you like to reload the page?';
			case 'common.prompts.updateAvailable': return 'An update is available';
			case 'common.prompts.restartRequired': return 'Restart required to apply changes';
			case 'login.message.success': return 'Login successful.';
			case 'login.message.error': return 'Login failed. Please try again.';
			case 'login.message.wrongPassword': return 'Please verify your credentials.';
			case 'login.form.username': return 'Username';
			case 'login.form.password': return 'Password';
			case 'login.form.submit': return 'Login';
			case 'login.form.createAccount': return 'Create new account';
			case 'login.form.forgotPassword': return 'Forgot password';
			case 'login.tooltip.username': return 'Enter your username';
			case 'login.tooltip.password': return 'Enter your password';
			case 'login.tooltip.submit': return 'Click to login';
			case 'login.validation.username.required': return 'Username is required.';
			case 'login.validation.password.required': return 'Password is required.';
			case 'register.message.success': return 'Registration successful.';
			case 'register.message.error': return 'Registration failed. Please try again.';
			case 'register.form.username': return 'Username';
			case 'register.form.email': return 'Email';
			case 'register.form.password': return 'Password';
			case 'register.form.submit': return 'Register';
			case 'register.form.acceptTos': return 'I accept the Terms of Service';
			case 'register.tooltip.username': return 'Enter your username';
			case 'register.tooltip.email': return 'Enter your email';
			case 'register.tooltip.password': return 'Enter your password';
			case 'register.tooltip.submit': return 'Click to register';
			case 'register.validation.username.required': return 'Username is required.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'Username must be at least ${min} characters long.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'Username must be at most ${max} characters long.';
			case 'register.validation.email.required': return 'Email is required.';
			case 'register.validation.email.invalid': return 'Email is not valid.';
			case 'register.validation.password.required': return 'Password is required.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'Password must be at least ${min} characters long.';
			case 'passwordReset.message.success': return 'Password reset email sent.';
			case 'passwordReset.message.error': return 'Password reset failed. Please try again.';
			case 'passwordReset.form.email': return 'Email';
			case 'passwordReset.form.submit': return 'Reset Password';
			case 'passwordReset.tooltip.email': return 'Enter your email';
			case 'passwordReset.tooltip.submit': return 'Click to reset password';
			case 'passwordReset.validation.email.required': return 'Email is required.';
			case 'passwordReset.validation.email.invalid': return 'Email is not valid.';
			default: return null;
		}
	}
}

