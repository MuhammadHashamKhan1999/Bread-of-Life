/// Generated file. Do not edit.
///
/// Locales: 4
/// Strings: 1220 (305 per locale)
///
/// Built on 2022-10-13 at 11:38 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	es(languageCode: 'es', build: _StringsEs.build),
	fr(languageCode: 'fr', build: _StringsFr.build),
	pt(languageCode: 'pt', build: _StringsPt.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(
		settings: LocaleSettings.instance
		/*initLocale: LocaleSettings.instance.currentLocale,
		initTranslations: LocaleSettings.instance.currentTranslations,*/
	);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(/*locales: AppLocale.values, baseLocale: _baseLocale, */utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale) => instance.setLocale(locale);
	static AppLocale setLocaleRaw(String rawLocale) => instance.setLocaleRaw(rawLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get appname => 'Bread of Life';
	String get selectlanguage => 'Select Language';
	String get chooseapplanguage => 'Choose App Language';
	String get nightmode => 'Night Mode';
	String get initializingapp => 'initializing...';
	String get home => 'Home';
	String get branches => 'Branches';
	String get inbox => 'Inbox';
	String get downloads => 'Downloads';
	String get settings => 'Settings';
	String get events => 'Events';
	String get myplaylists => 'My Playlists';
	String get website => 'Website';
	String get hymns => 'Hymns';
	String get articles => 'Articles';
	String get notes => 'Notes';
	String get donate => 'Donate';
	String get savenotetitle => 'Note Title';
	String get nonotesfound => 'No notes found';
	String get newnote => 'New';
	String get deletenote => 'Delete Note';
	String get deletenotehint => 'Do you want to delete this note? This action cannot be reversed.';
	String get bookmarks => 'Bookmarks';
	String get socialplatforms => 'Social Platforms';
	List<String> get onboardingpagetitles => [
		'Bread of Life Ministries',
		'The Church',
		'Audio, Video \n and Live Streaming',
		'Create Account',
	];
	List<String> get onboardingpagehints => [
		'We acknowledge Jesus Christ as the sovereign Lord of our lives and believe that, by His grace, we can serve Him and turn from whatever displeases Him to a life that is pleasing to God.',
		'Is a local community of baptized believers unified through faith in Jesus Christ. It is committed to the teachings of Christ and obeying all of His commands, and it seeks to bring the Gospel to the world. The Church works together in love and unity, intent on the ultimate purpose of glorifying Christ.',
		'No matter where you are around the world, you can watch our inspiring videos, listen to audio messages and podcast, and watch live streams of our church services.',
		'Start your journey to a never-ending worship experience. Join us today!',
	];
	String get next => 'NEXT';
	String get done => 'Get Started';
	String get quitapp => 'Quit App!';
	String get quitappwarning => 'Do you wish to close the app?';
	String get quitappaudiowarning => 'You are currently playing an audio, quitting the app will stop the audio playback. If you do not wish to stop playback, just minimize the app with the center button or click the Ok button to quit app now.';
	String get ok => 'Ok';
	String get retry => 'RETRY';
	String get oops => 'Ooops!';
	String get save => 'Save';
	String get cancel => 'Cancel';
	String get error => 'Error';
	String get success => 'Success';
	String get skip => 'Skip';
	String get skiplogin => 'Skip Login';
	String get skipregister => 'Skip Registration';
	String get dataloaderror => 'Could not load requested data at the moment, check your data connection and click to retry.';
	String get suggestedforyou => 'Suggested for you';
	String get videomessages => 'Video Messages';
	String get audiomessages => 'Audio Messages';
	String get devotionals => 'Devotionals';
	String get categories => 'Categories';
	String get category => 'Category';
	String get videos => 'Videos';
	String get audios => 'Audios';
	String get biblebooks => 'Bible';
	String get audiobible => 'Audio Bible';
	String get livestreams => 'Livestreams';
	String get radio => 'Radio';
	String get allitems => 'All Items';
	String get emptyplaylist => 'No Playlists';
	String get notsupported => 'Not Supported';
	String get cleanupresources => 'Cleaning up resources';
	String get grantstoragepermission => 'Please grant accessing storage permission to continue';
	String get sharefiletitle => 'Watch or Listen to ';
	String get sharefilebody => 'Via Bread of life ministries App, Download now at ';
	String get sharetext => 'Enjoy unlimited Audio & Video streaming';
	String get sharetexthint => 'Join the Video and Audio streaming platform that lets you watch and listen to millions of files from around the world. Download now at';
	String get download => 'Download';
	String get addplaylist => 'Add to playlist';
	String get bookmark => 'Bookmark';
	String get unbookmark => 'UnBookmark';
	String get share => 'Share';
	String get deletemedia => 'Delete File';
	String get deletemediahint => 'Do you wish to delete this downloaded file? This action cannot be undone.';
	String get searchhint => 'Search Audio & Video Messages';
	String get performingsearch => 'Searching Audios and Videos';
	String get nosearchresult => 'No results Found';
	String get nosearchresulthint => 'Try input more general keyword';
	String get addtoplaylist => 'Add to playlist';
	String get newplaylist => 'New playlist';
	String get playlistitm => 'Playlist';
	String get mediaaddedtoplaylist => 'Media added to playlist.';
	String get mediaremovedfromplaylist => 'Media removed from playlist';
	String get clearplaylistmedias => 'Clear All Media';
	String get deletePlayList => 'Delete Playlist';
	String get clearplaylistmediashint => 'Go ahead and remove all media from this playlist?';
	String get deletePlayListhint => 'Go ahead and delete this playlist and clear all media?';
	String get comments => 'Comments';
	String get replies => 'Replies';
	String get reply => 'Reply';
	String get logintoaddcomment => 'Login to add a comment';
	String get logintoreply => 'Login to reply';
	String get writeamessage => 'Write a message...';
	String get nocomments => 'No Comments found \nclick to retry';
	String get errormakingcomments => 'Cannot process commenting at the moment..';
	String get errordeletingcomments => 'Cannot delete this comment at the moment..';
	String get erroreditingcomments => 'Cannot edit this comment at the moment..';
	String get errorloadingmorecomments => 'Cannot load more comments at the moment..';
	String get deletingcomment => 'Deleting comment';
	String get editingcomment => 'Editing comment';
	String get deletecommentalert => 'Delete Comment';
	String get editcommentalert => 'Edit Comment';
	String get deletecommentalerttext => 'Do you wish to delete this comment? This action cannot be undone';
	String get loadmore => 'load more';
	String get messages => 'Messages';
	String get guestuser => 'Guest User';
	String get fullname => 'Full Name';
	String get emailaddress => 'Email Address';
	String get password => 'Password';
	String get repeatpassword => 'Repeat Password';
	String get register => 'Register';
	String get login => 'Login';
	String get logout => 'Logout';
	String get logoutfromapp => 'Logout from app?';
	String get logoutfromapphint => 'You wont be able to like or comment on articles and videos if you are not logged in.';
	String get gotologin => 'Go to Login';
	String get resetpassword => 'Reset Password';
	String get logintoaccount => 'Already have an account? Login';
	String get emptyfielderrorhint => 'You need to fill all the fields';
	String get invalidemailerrorhint => 'You need to enter a valid email address';
	String get passwordsdontmatch => 'Passwords dont match';
	String get processingpleasewait => 'Processing, Please wait...';
	String get createaccount => 'Create an account';
	String get forgotpassword => 'Forgot Password?';
	String get orloginwith => 'Or Login With';
	String get facebook => 'Facebook';
	String get google => 'Google';
	String get moreoptions => 'More Options';
	String get about => 'About Us';
	String get privacy => 'Privacy Policy';
	String get terms => 'App Terms';
	String get rate => 'Rate App';
	String get version => 'Version';
	String get pulluploadmore => 'pull up load';
	String get loadfailedretry => 'Load Failed!Click retry!';
	String get releaseloadmore => 'release to load more';
	String get nomoredata => 'No more Data';
	String get errorReportingComment => 'Error Reporting Comment';
	String get reportingComment => 'Reporting Comment';
	String get reportcomment => 'Report Options';
	List<String> get reportCommentsList => [
		'Unwanted commercial content or spam',
		'Pornography or sexual explicit material',
		'Hate speech or graphic violence',
		'Harassment or bullying',
	];
	String get bookmarksMedia => 'My Bookmarks';
	String get noitemstodisplay => 'No Items To Display';
	String get loginrequired => 'Login Required';
	String get loginrequiredhint => 'To subscribe on this platform, you need to be logged in. Create a free account now or log in to your existing account.';
	String get subscriptions => 'App Subscriptions';
	String get subscribe => 'SUBSCRIBE';
	String get subscribehint => 'Subscription Required';
	String get playsubscriptionrequiredhint => 'You need to subscribe before you can listen to or watch this media.';
	String get previewsubscriptionrequiredhint => 'You have reached the allowed preview duration for this media. You need to subscribe to continue listening or watching this media.';
	String get copiedtoclipboard => 'Copied to clipboard';
	String get downloadbible => 'Download Bible';
	String get downloadversion => 'Download';
	String get downloading => 'Downloading';
	String get failedtodownload => 'Failed to download';
	String get pleaseclicktoretry => 'Please click to retry.';
	String get of => 'Of';
	String get nobibleversionshint => 'There is no bible data to display, click on the button below to download atleast one bible version.';
	String get downloaded => 'Downloaded';
	String get enteremailaddresstoresetpassword => 'Enter your email to reset your password';
	String get backtologin => 'BACK TO LOGIN';
	String get signintocontinue => 'Sign in to continue';
	String get signin => 'S I G N  I N';
	String get signinforanaccount => 'SIGN UP FOR AN ACCOUNT?';
	String get alreadyhaveanaccount => 'Already have an account?';
	String get updateprofile => 'Update Profile';
	String get updateprofilehint => 'To get started, please update your profile page, this will help us in connecting you with other people';
	String get autoplayvideos => 'AutoPlay Videos';
	String get gosocial => 'Go Social';
	String get searchbible => 'Search Bible';
	String get filtersearchoptions => 'Filter Search Options';
	String get narrowdownsearch => 'Use the filter button below to narrow down search for a more precise result.';
	String get searchbibleversion => 'Search Bible Version';
	String get searchbiblebook => 'Search Bible Book';
	String get search => 'Search';
	String get setBibleBook => 'Set Bible Book';
	String get oldtestament => 'Old Testament';
	String get newtestament => 'New Testament';
	String get limitresults => 'Limit Results';
	String get setfilters => 'Set Filters';
	String get bibletranslator => 'Bible Translator';
	String get chapter => ' Chapter ';
	String get verse => ' Verse ';
	String get translate => 'translate';
	String get bibledownloadinfo => 'Bible Download started, Please do not close this page until the download is done.';
	String get received => 'received';
	String get outoftotal => 'out of total';
	String get set => 'SET';
	String get selectColor => 'Select Color';
	String get switchbibleversion => 'Switch Bible Version';
	String get switchbiblebook => 'Switch Bible Book';
	String get gotosearch => 'Go to Chapter';
	String get changefontsize => 'Change Font Size';
	String get font => 'Font';
	String get readchapter => 'Read Chapter';
	String get showhighlightedverse => 'Show Highlighted Verses';
	String get downloadmoreversions => 'Download more versions';
	String get suggestedusers => 'Suggested users to follow';
	String get unfollow => 'UnFollow';
	String get follow => 'Follow';
	String get searchforpeople => 'Search for people';
	String get viewpost => 'View Post';
	String get viewprofile => 'View Profile';
	String get mypins => 'My Pins';
	String get viewpinnedposts => 'View Pinned Posts';
	String get personal => 'Personal';
	String get update => 'Update';
	String get phonenumber => 'Phone Number';
	String get showmyphonenumber => 'Show my phone number to users';
	String get dateofbirth => 'Date of Birth';
	String get showmyfulldateofbirth => 'Show my full date of birth to people viewing my status';
	String get notifications => 'Notifications';
	String get notifywhenuserfollowsme => 'Notify me when a user follows me';
	String get notifymewhenusercommentsonmypost => 'Notify me when users comment on my post';
	String get notifymewhenuserlikesmypost => 'Notify me when users like my post';
	String get churchsocial => 'Church Social';
	String get shareyourthoughts => 'Share your thoughts';
	String get readmore => '...Read more';
	String get less => ' Less';
	String get couldnotprocess => 'Could not process requested action.';
	String get pleaseselectprofilephoto => 'Please select a profile photo to upload';
	String get pleaseselectprofilecover => 'Please select a cover photo to upload';
	String get updateprofileerrorhint => 'You need to fill your name, date of birth, gender, phone and location before you can proceed.';
	String get gender => 'Gender';
	String get male => 'Male';
	String get female => 'Female';
	String get dob => 'Date Of Birth';
	String get location => 'Current Location';
	String get qualification => 'Qualification';
	String get aboutme => 'About Me';
	String get facebookprofilelink => 'Facebook Profile Link';
	String get twitterprofilelink => 'Twitter Profile Link';
	String get linkdln => 'Linkedln Profile Link';
	String get likes => 'Likes';
	String get likess => 'Like(s)';
	String get pinnedposts => 'My Pinned Posts';
	String get unpinpost => 'Unpin Post';
	String get unpinposthint => 'Do you wish to remove this post from your pinned posts?';
	String get postdetails => 'Post Details';
	String get posts => 'Posts';
	String get followers => 'Followers';
	String get followings => 'Followings';
	String get my => 'My';
	String get edit => 'Edit';
	String get delete => 'Delete';
	String get deletepost => 'Delete Post';
	String get deleteposthint => 'Do you wish to delete this post? Posts can still appear on some users feeds.';
	String get maximumallowedsizehint => 'Maximum allowed file upload reached';
	String get maximumuploadsizehint => 'The selected file exceeds the allowed upload file size limit.';
	String get makeposterror => 'Unable to make post at the moment, please click to retry.';
	String get makepost => 'Make Post';
	String get selectfile => 'Select File';
	String get images => 'Images';
	String get shareYourThoughtsNow => 'Share your thoughts ...';
	String get photoviewer => 'Photo Viewer';
	String get nochatsavailable => 'No Conversations available \n Click the add icon below \nto select users to chat with';
	String get typing => 'Typing...';
	String get photo => 'Photo';
	String get online => 'Online';
	String get offline => 'Offline';
	String get lastseen => 'Last Seen';
	String get deleteselectedhint => 'This action will delete the selected messages.  Please note that this only deletes your side of the conversation, \n the messages will still show on your partners device.';
	String get deleteselected => 'Delete selected';
	String get unabletofetchconversation => 'Unable to Fetch \nyour conversation with \n';
	String get loadmoreconversation => 'Load more conversations';
	String get sendyourfirstmessage => 'Send your first message to \n';
	String get unblock => 'Unblock ';
	String get block => 'Block';
	String get writeyourmessage => 'Write your message...';
	String get clearconversation => 'Clear Conversation';
	String get clearconversationhintone => 'This action will clear all your conversation with ';
	String get clearconversationhinttwo => '.\n  Please note that this only deletes your side of the conversation, the messages will still show on your partners chat.';
	String get title => 'Title';
	String get thaks_for_contacting => 'Thanks For Contacting';
	String get submit => 'Submit';
	String get prayer_request_form => 'Prayer Request Form';
	String get please_wait => 'Please Wait';
	String get photos => 'Photos';
	String get no_data => 'No Data';
	String get msg => 'Massage';
	String get ministry => 'Ministry';
	String get ministry_info => 'Ministry Information';
	String get ministries => 'Ministries';
	String get leaders => 'Leaders';
	String get leader_info => 'Leader\'s Information';
	String get prayer_request => 'Prayer Request';
	String get announcement_info => 'Announcement Information';
	String get leader_desc_json => 'Leaders Desc Json';
	String get leader => 'Leader';
	String get guestemail => 'Guest Email';
	String get gallery => 'Gallery';
	String get err_empty_your_name => 'Your Name Is Empty';
	String get err_empty_number => 'Your Number Is Empty';
	String get err_empty_message => 'Messages is empty';
	String get err_empty_email_address => 'Email Address Is Empty';
	String get documents => 'Document';
	String get description => 'Description';
	String get contact_us => 'Contact Us';
	String get contact_number => 'Contact number';
	String get announcements => 'Announcement';
}

// Path: <root>
class _StringsEs implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsEs _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Bread of Life';
	@override String get selectlanguage => 'Seleccione el idioma';
	@override String get chooseapplanguage => 'Elija el idioma de la aplicación';
	@override String get nightmode => 'Modo nocturno';
	@override String get initializingapp => 'inicializando...';
	@override String get home => 'Hogar';
	@override String get branches => 'Ramas';
	@override String get inbox => 'Bandeja de entrada';
	@override String get downloads => 'Descargas';
	@override String get settings => 'Configuraciones';
	@override String get events => 'Eventos';
	@override String get myplaylists => 'Mis listas de reproducción';
	@override String get website => 'Sitio web';
	@override String get hymns => 'Himnos';
	@override String get articles => 'Artículos';
	@override String get notes => 'Notas';
	@override String get donate => 'Donar';
	@override String get savenotetitle => 'Título de la nota';
	@override String get bookmarks => 'Marcadores';
	@override String get socialplatforms => 'Plataformas sociales';
	@override List<String> get onboardingpagetitles => [
		'Bienvenido a Bread of Life',
		'Repleto de características',
		'Audio, Video \n and Live Streaming',
		'Crear una cuenta',
	];
	@override List<String> get onboardingpagehints => [
		'Extienda más allá de las mañanas de los domingos y las cuatro paredes de su iglesia. Todo lo que necesita para comunicarse e interactuar con un mundo centrado en dispositivos móviles.',
		'Hemos reunido todas las funciones principales que debe tener la aplicación de su iglesia. Eventos, devocionales, notificaciones, notas y biblia de múltiples versiones.',
		'Permita que los usuarios de todo el mundo vean videos, escuchen mensajes de audio y vean transmisiones en vivo de los servicios de su iglesia.',
		'Comience su viaje hacia una experiencia de adoración sin fin.',
	];
	@override String get next => 'SIGUIENTE';
	@override String get done => 'EMPEZAR';
	@override String get quitapp => 'Salir de la aplicación!';
	@override String get quitappwarning => '¿Deseas cerrar la aplicación?';
	@override String get quitappaudiowarning => 'Actualmente está reproduciendo un audio, al salir de la aplicación se detendrá la reproducción del audio. Si no desea detener la reproducción, simplemente minimice la aplicación con el botón central o haga clic en el botón Aceptar para salir de la aplicación ahora.';
	@override String get deletenote => 'Borrar nota';
	@override String get deletenotehint => '¿Quieres borrar esta nota? Esta acción no se puede revertir.';
	@override String get nonotesfound => 'No se encontraron notas';
	@override String get newnote => 'Nuevo';
	@override String get ok => 'Okay';
	@override String get retry => 'REVER';
	@override String get oops => 'Vaya!';
	@override String get save => 'Salvar';
	@override String get cancel => 'Cancelar';
	@override String get error => 'Error';
	@override String get success => 'éxito';
	@override String get skip => 'Omitir';
	@override String get skiplogin => 'Omitir inicio de sesión';
	@override String get skipregister => 'Evitar el registro';
	@override String get dataloaderror => 'No se pudieron cargar los datos solicitados en este momento, verifique su conexión de datos y haga clic para volver a intentarlo.';
	@override String get suggestedforyou => 'Sugerido para ti';
	@override String get devotionals => 'Devocionales';
	@override String get categories => 'Categorías';
	@override String get category => 'Categoría';
	@override String get videos => 'Videos';
	@override String get audios => 'Audios';
	@override String get biblebooks => 'Biblia';
	@override String get audiobible => 'Biblia en audio';
	@override String get livestreams => 'Transmisiones en vivo';
	@override String get radio => 'Radio';
	@override String get allitems => 'Todos los artículos';
	@override String get emptyplaylist => 'Sin listas de reproducción';
	@override String get notsupported => 'No soportado';
	@override String get cleanupresources => 'Limpieza de recursos';
	@override String get grantstoragepermission => 'Otorgue permiso de acceso al almacenamiento para continuar';
	@override String get sharefiletitle => 'Mira o escucha ';
	@override String get sharefilebody => 'Vía Bread of Life App, Descarga ahora en ';
	@override String get sharetext => 'Disfrute de transmisión ilimitada de audio y video';
	@override String get sharetexthint => 'Únase a la plataforma de transmisión de video y audio que le permite ver y escuchar millones de archivos de todo el mundo. Descarga ahora en';
	@override String get download => 'Descargar';
	@override String get addplaylist => 'Agregar a la lista de reproducción';
	@override String get bookmark => 'Marcador';
	@override String get unbookmark => 'Desmarcar';
	@override String get share => 'Compartir';
	@override String get deletemedia => 'Borrar archivo';
	@override String get deletemediahint => '¿Desea eliminar este archivo descargado? Esta acción no se puede deshacer.';
	@override String get searchhint => 'Buscar mensajes de audio y video';
	@override String get performingsearch => 'Búsqueda de audios y videos';
	@override String get nosearchresult => 'No se han encontrado resultados';
	@override String get nosearchresulthint => 'Intente ingresar una palabra clave más general';
	@override String get addtoplaylist => 'Agregar a la lista de reproducción';
	@override String get newplaylist => 'Nueva lista de reproducción';
	@override String get playlistitm => 'Lista de reproducción';
	@override String get mediaaddedtoplaylist => 'Medios agregados a la lista de reproducción.';
	@override String get mediaremovedfromplaylist => 'Medios eliminados de la lista de reproducción';
	@override String get clearplaylistmedias => 'Borrar todos los medios';
	@override String get deletePlayList => 'Eliminar lista de reproducción';
	@override String get clearplaylistmediashint => '¿Continuar y eliminar todos los medios de esta lista de reproducción?';
	@override String get deletePlayListhint => '¿Continuar y eliminar esta lista de reproducción y borrar todos los medios?';
	@override String get videomessages => 'Mensajes de video';
	@override String get audiomessages => 'Mensajes de audio';
	@override String get comments => 'Comentarios';
	@override String get replies => 'Respuestas';
	@override String get reply => 'Respuesta';
	@override String get logintoaddcomment => 'Inicia sesión para añadir un comentario';
	@override String get logintoreply => 'Inicia sesión para responder';
	@override String get writeamessage => 'Escribe un mensaje...';
	@override String get nocomments => 'No se encontraron comentarios \nhaga clic para reintentar';
	@override String get errormakingcomments => 'No se pueden procesar los comentarios en este momento..';
	@override String get errordeletingcomments => 'No se puede eliminar este comentario en este momento..';
	@override String get erroreditingcomments => 'No se puede editar este comentario en este momento..';
	@override String get errorloadingmorecomments => 'No se pueden cargar más comentarios en este momento..';
	@override String get deletingcomment => 'Eliminando comentario';
	@override String get editingcomment => 'Editando comentario';
	@override String get deletecommentalert => 'Eliminar comentario';
	@override String get editcommentalert => 'Editar comentario';
	@override String get deletecommentalerttext => '¿Deseas borrar este comentario? Esta acción no se puede deshacer';
	@override String get loadmore => 'carga más';
	@override String get messages => 'Mensajes';
	@override String get guestuser => 'Usuario invitado';
	@override String get fullname => 'Nombre completo';
	@override String get emailaddress => 'Dirección de correo electrónico';
	@override String get password => 'Contraseña';
	@override String get repeatpassword => 'Repite la contraseña';
	@override String get register => 'Registrarse';
	@override String get login => 'Iniciar sesión';
	@override String get logout => 'Cerrar sesión';
	@override String get logoutfromapp => '¿Salir de la aplicación?';
	@override String get logoutfromapphint => 'No podrá dar me gusta o comentar artículos y videos si no ha iniciado sesión.';
	@override String get gotologin => 'Ir a Iniciar sesión';
	@override String get resetpassword => 'Restablecer la contraseña';
	@override String get logintoaccount => '¿Ya tienes una cuenta? Iniciar sesión';
	@override String get emptyfielderrorhint => 'Necesitas llenar todos los campos';
	@override String get invalidemailerrorhint => 'Debes ingresar una dirección de correo electrónico válida';
	@override String get passwordsdontmatch => 'Las contraseñas no coinciden';
	@override String get processingpleasewait => 'Procesando .. por favor espere...';
	@override String get createaccount => 'Crea una cuenta';
	@override String get forgotpassword => '¿Se te olvidó tu contraseña?';
	@override String get orloginwith => 'O inicie sesión con';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Mas opciones';
	@override String get about => 'Sobre nosotros';
	@override String get privacy => 'Privacidad';
	@override String get terms => 'Términos de la aplicación';
	@override String get rate => 'Calificar aplicacion';
	@override String get version => 'Versión';
	@override String get pulluploadmore => 'levantar la carga';
	@override String get loadfailedretry => 'Error de carga. Haga clic en reintentar!';
	@override String get releaseloadmore => 'suelte para cargar más';
	@override String get nomoredata => 'No más datos';
	@override String get errorReportingComment => 'Comentario de informe de error';
	@override String get reportingComment => 'Informe de comentario';
	@override String get reportcomment => 'Opciones de informe';
	@override List<String> get reportCommentsList => [
		'Contenido comercial no deseado o spam',
		'Pornografía o material sexual explícito',
		'Discurso de odio o violencia gráfica',
		'Acoso o intimidación',
	];
	@override String get bookmarksMedia => 'Mis marcadores';
	@override String get noitemstodisplay => 'No hay elementos para mostrar';
	@override String get loginrequired => 'Necesario iniciar sesión';
	@override String get loginrequiredhint => 'Para suscribirse en esta plataforma, debe iniciar sesión. Cree una cuenta gratuita ahora o inicie sesión en su cuenta existente.';
	@override String get subscriptions => 'Suscripciones de aplicaciones';
	@override String get subscribe => 'SUSCRIBIR';
	@override String get subscribehint => 'Se requiere suscripción';
	@override String get playsubscriptionrequiredhint => 'Debe suscribirse antes de poder escuchar o ver este medio.';
	@override String get previewsubscriptionrequiredhint => 'Ha alcanzado la duración de vista previa permitida para este medio. Debes suscribirte para seguir escuchando o viendo este medio.';
	@override String get copiedtoclipboard => 'Copiado al portapapeles';
	@override String get downloadbible => 'Descargar Biblia';
	@override String get downloadversion => 'Descargar';
	@override String get downloading => 'Descargando';
	@override String get failedtodownload => 'Error al descargar';
	@override String get pleaseclicktoretry => 'Haga clic para volver a intentarlo.';
	@override String get of => 'De';
	@override String get nobibleversionshint => 'No hay datos bíblicos para mostrar, haga clic en el botón de abajo para descargar al menos una versión bíblica.';
	@override String get downloaded => 'Descargado';
	@override String get enteremailaddresstoresetpassword => 'Ingrese su correo electrónico para restablecer su contraseña';
	@override String get backtologin => 'ATRÁS PARA INICIAR SESIÓN';
	@override String get signintocontinue => 'Regístrate para continuar';
	@override String get signin => 'REGISTRARSE';
	@override String get signinforanaccount => '¿REGÍSTRESE PARA OBTENER UNA CUENTA?';
	@override String get alreadyhaveanaccount => '¿Ya tienes una cuenta?';
	@override String get updateprofile => 'Actualización del perfil';
	@override String get updateprofilehint => 'Para comenzar, actualice su página de perfil, esto nos ayudará a conectarlo con otras personas';
	@override String get autoplayvideos => 'Reproducción automática de vídeos';
	@override String get gosocial => 'Vuélvete social';
	@override String get searchbible => 'Buscar Biblia';
	@override String get filtersearchoptions => 'Opciones de búsqueda de filtros';
	@override String get narrowdownsearch => 'Utilice el botón de filtro a continuación para reducir la búsqueda y obtener un resultado más preciso.';
	@override String get searchbibleversion => 'Buscar la versión de la Biblia';
	@override String get searchbiblebook => 'Buscar libro de la Biblia';
	@override String get search => 'Buscar';
	@override String get setBibleBook => 'Establecer libro de la Biblia';
	@override String get oldtestament => 'Viejo Testamento';
	@override String get newtestament => 'Nuevo Testamento';
	@override String get limitresults => 'Establecer filtros';
	@override String get setfilters => 'Establecer filtros';
	@override String get bibletranslator => 'Traductor de la Biblia';
	@override String get chapter => ' Capítulo ';
	@override String get verse => ' Verso ';
	@override String get translate => 'traducir';
	@override String get bibledownloadinfo => 'Se inició la descarga de la Biblia. No cierre esta página hasta que se haya realizado la descarga.';
	@override String get received => 'recibido';
	@override String get outoftotal => 'fuera del total';
	@override String get set => 'CONJUNTO';
	@override String get selectColor => 'Seleccionar el color';
	@override String get switchbibleversion => 'Cambiar versión de la Biblia';
	@override String get switchbiblebook => 'Cambiar libro de la Biblia';
	@override String get gotosearch => 'Ir al capítulo';
	@override String get changefontsize => 'Cambia tamaño de fuente';
	@override String get font => 'Font';
	@override String get readchapter => 'Leer capítulo';
	@override String get showhighlightedverse => 'Mostrar versículos destacados';
	@override String get downloadmoreversions => 'Descarga más versiones';
	@override String get suggestedusers => 'Usuarios sugeridos para seguir';
	@override String get unfollow => 'Dejar de seguir';
	@override String get follow => 'Seguir';
	@override String get searchforpeople => 'Búsqueda de personas';
	@override String get viewpost => 'Ver publicacion';
	@override String get viewprofile => 'Ver perfil';
	@override String get mypins => 'Mis Pines';
	@override String get viewpinnedposts => 'Ver publicaciones fijadas';
	@override String get personal => 'Personal';
	@override String get update => 'Actualizar';
	@override String get phonenumber => 'Número de teléfono';
	@override String get showmyphonenumber => 'Mostrar mi número de teléfono a los usuarios';
	@override String get dateofbirth => 'Fecha de nacimiento';
	@override String get showmyfulldateofbirth => 'Mostrar mi fecha de nacimiento completa a las personas que ven mi estado';
	@override String get notifications => 'Notificaciones';
	@override String get notifywhenuserfollowsme => 'Notificarme cuando un usuario me siga';
	@override String get notifymewhenusercommentsonmypost => 'Notificarme cuando los usuarios comenten en mi publicación';
	@override String get notifymewhenuserlikesmypost => 'Notificarme cuando a los usuarios les guste mi publicación';
	@override String get churchsocial => 'Iglesia Social';
	@override String get shareyourthoughts => 'Comparte tus pensamientos';
	@override String get readmore => '...Lee mas';
	@override String get less => ' Menos';
	@override String get couldnotprocess => 'No se pudo procesar la acción solicitada.';
	@override String get pleaseselectprofilephoto => 'Seleccione una foto de perfil para cargar';
	@override String get pleaseselectprofilecover => 'Seleccione una foto de portada para cargar';
	@override String get updateprofileerrorhint => 'Debe ingresar su nombre, fecha de nacimiento, sexo, teléfono y ubicación antes de poder continuar.';
	@override String get gender => 'Género';
	@override String get male => 'Masculino';
	@override String get female => 'Hembra';
	@override String get dob => 'Fecha de nacimiento';
	@override String get location => 'Ubicación actual';
	@override String get qualification => 'Calificación';
	@override String get aboutme => 'Sobre mí';
	@override String get facebookprofilelink => 'Facebook Enlace de perfil';
	@override String get twitterprofilelink => 'Twitter Enlace de perfil';
	@override String get linkdln => 'Linkedln Enlace de perfil';
	@override String get likes => 'Gustos';
	@override String get likess => 'Me gusta(s)';
	@override String get pinnedposts => 'Mis publicaciones fijadas';
	@override String get unpinpost => 'Desanclar publicación';
	@override String get unpinposthint => '¿Deseas eliminar esta publicación de tus publicaciones fijadas?';
	@override String get postdetails => 'Detalles de la publicación';
	@override String get posts => 'Publicaciones';
	@override String get followers => 'Seguidores';
	@override String get followings => 'Siguientes';
	@override String get my => 'Mi';
	@override String get edit => 'Editar';
	@override String get delete => 'Eliminar';
	@override String get deletepost => 'Eliminar mensaje';
	@override String get deleteposthint => '¿Deseas eliminar esta publicación? Las publicaciones aún pueden aparecer en los feeds de algunos usuarios.';
	@override String get maximumallowedsizehint => 'Se alcanzó la carga máxima de archivos permitida';
	@override String get maximumuploadsizehint => 'El archivo seleccionado supera el límite de tamaño de archivo de carga permitido.';
	@override String get makeposterror => 'No se puede publicar en este momento, haga clic para volver a intentarlo.';
	@override String get makepost => 'Hacer publicación';
	@override String get selectfile => 'Seleccione Archivo';
	@override String get images => 'Imagenes';
	@override String get shareYourThoughtsNow => 'Share your thoughts ...';
	@override String get photoviewer => 'Visionneuse de photos';
	@override String get nochatsavailable => 'No hay conversaciones disponibles \n Haga clic en el icono de agregar a continuación \n para seleccionar los usuarios con los que chatear';
	@override String get typing => 'Mecanografía...';
	@override String get photo => 'Photo';
	@override String get online => 'En línea';
	@override String get offline => 'Desconectado';
	@override String get lastseen => 'Ultima vez visto';
	@override String get deleteselectedhint => 'Esta acción eliminará los mensajes seleccionados. Tenga en cuenta que esto solo elimina su lado de la conversación, \n los mensajes seguirán apareciendo en el dispositivo de su socio.';
	@override String get deleteselected => 'Eliminar seleccionado';
	@override String get unabletofetchconversation => 'No se pudo recuperar \ntu conversación con \n';
	@override String get loadmoreconversation => 'Cargar más conversaciones';
	@override String get sendyourfirstmessage => 'Envía tu primer mensaje a \n';
	@override String get unblock => 'Desatascar ';
	@override String get block => 'Bloquear ';
	@override String get writeyourmessage => 'escribe tu mensaje...';
	@override String get clearconversation => 'Conversación clara';
	@override String get clearconversationhintone => 'Esta acción borrará toda su conversación con ';
	@override String get clearconversationhinttwo => '.\n  Tenga en cuenta que esto solo elimina su lado de la conversación, los mensajes aún se mostrarán en el chat de sus socios.';
	@override String get title => 'Título';
	@override String get thaks_for_contacting => 'Gracias por contactar';
	@override String get submit => 'Enviar';
	@override String get prayer_request_form => 'Formulario de solicitud de oración';
	@override String get please_wait => 'Espere por favor';
	@override String get photos => 'Fotos';
	@override String get no_data => 'Sin datos';
	@override String get msg => 'Masaje';
	@override String get ministry => 'Ministerio';
	@override String get ministry_info => 'Información del Ministerio';
	@override String get ministries => 'ministerios';
	@override String get leaders => 'Líderes';
	@override String get leader_info => 'Información del líder';
	@override String get prayer_request => 'Petición de oración';
	@override String get announcement_info => 'Información del anuncio';
	@override String get leader_desc_json => 'Leaders Desc Json';
	@override String get leader => 'Líder';
	@override String get guestemail => 'Correo electrónico de invitado';
	@override String get gallery => 'Galería';
	@override String get err_empty_your_name => 'Tu nombre está vacío';
	@override String get err_empty_number => 'Tu número está vacío';
	@override String get err_empty_message => 'Los mensajes están vacíos';
	@override String get err_empty_email_address => 'La dirección de correo electrónico está vacía';
	@override String get documents => 'Documentos';
	@override String get description => 'Descripción';
	@override String get contact_us => 'Contacta con nosotras';
	@override String get contact_number => 'Número de contacto';
	@override String get announcements => 'anuncio';
}

// Path: <root>
class _StringsFr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsFr _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Bread of Life';
	@override String get selectlanguage => 'Choisir la langue';
	@override String get chooseapplanguage => 'Choisissez la langue de l\'application';
	@override String get nightmode => 'Mode nuit';
	@override String get initializingapp => 'initialisation...';
	@override String get home => 'Accueil';
	@override String get branches => 'Branches';
	@override String get inbox => 'Boîte de réception';
	@override String get downloads => 'Téléchargements';
	@override String get settings => 'Paramètres';
	@override String get events => 'Événements';
	@override String get myplaylists => 'Mes listes de lecture';
	@override String get nonotesfound => 'Aucune note trouvée';
	@override String get newnote => 'Nouveau';
	@override String get website => 'Site Internet';
	@override String get hymns => 'Hymnes';
	@override String get articles => 'Des articles';
	@override String get notes => 'Remarques';
	@override String get donate => 'Faire un don';
	@override String get deletenote => 'Supprimer la note';
	@override String get deletenotehint => 'Voulez-vous supprimer cette note? Cette action ne peut pas être annulée.';
	@override String get savenotetitle => 'Titre de la note';
	@override String get bookmarks => 'Favoris';
	@override String get socialplatforms => 'Plateformes sociales';
	@override List<String> get onboardingpagetitles => [
		'Bienvenue à Bread of Life',
		'Plein de fonctionnalités',
		'Audio, Video \n et diffusion en direct',
		'Créer un compte',
	];
	@override List<String> get onboardingpagehints => [
		'Prolongez-vous au-delà des dimanches matins et des quatre murs de votre église. Tout ce dont vous avez besoin pour communiquer et interagir avec un monde axé sur le mobile.',
		'Nous avons rassemblé toutes les fonctionnalités principales que votre application d\'église doit avoir. Événements, dévotions, notifications, notes et bible multi-version.',
		'Permettez aux utilisateurs du monde entier de regarder des vidéos, d\'écouter des messages audio et de regarder des flux en direct de vos services religieux.',
		'Commencez votre voyage vers une expérience de culte sans fin.',
	];
	@override String get next => 'SUIVANT';
	@override String get done => 'COMMENCER';
	@override String get quitapp => 'Quitter l\'application!';
	@override String get quitappwarning => 'Souhaitez-vous fermer l\'application?';
	@override String get quitappaudiowarning => 'Vous êtes en train de lire un fichier audio, quitter l\'application arrêtera la lecture audio. Si vous ne souhaitez pas arrêter la lecture, réduisez simplement l\'application avec le bouton central ou cliquez sur le bouton OK pour quitter l\'application maintenant.';
	@override String get ok => 'D\'accord';
	@override String get retry => 'RECOMMENCEZ';
	@override String get oops => 'Oups!';
	@override String get save => 'sauver';
	@override String get cancel => 'Annuler';
	@override String get error => 'Erreur';
	@override String get success => 'Succès';
	@override String get skip => 'Sauter';
	@override String get skiplogin => 'Passer l\'identification';
	@override String get skipregister => 'Sauter l\'inscription';
	@override String get dataloaderror => 'Impossible de charger les données demandées pour le moment, vérifiez votre connexion de données et cliquez pour réessayer.';
	@override String get suggestedforyou => 'Suggéré pour vous';
	@override String get devotionals => 'Dévotion';
	@override String get categories => 'Catégories';
	@override String get category => 'Catégorie';
	@override String get videos => 'Vidéos';
	@override String get audios => 'Audios';
	@override String get biblebooks => 'Bible';
	@override String get audiobible => 'Bible audio';
	@override String get livestreams => 'Livestreams';
	@override String get radio => 'Radio';
	@override String get allitems => 'Tous les articles';
	@override String get emptyplaylist => 'Aucune liste de lecture';
	@override String get notsupported => 'Non supporté';
	@override String get cleanupresources => 'Nettoyage des ressources';
	@override String get grantstoragepermission => 'Veuillez accorder l\'autorisation d\'accès au stockage pour continuer';
	@override String get sharefiletitle => 'Regarder ou écouter ';
	@override String get sharefilebody => 'Via Bread of Life App, Téléchargez maintenant sur ';
	@override String get sharetext => 'Profitez d\'un streaming audio et vidéo illimité';
	@override String get sharetexthint => 'Rejoignez la plateforme de streaming vidéo et audio qui vous permet de regarder et d\'écouter des millions de fichiers du monde entier. Téléchargez maintenant sur';
	@override String get download => 'Télécharger';
	@override String get addplaylist => 'Ajouter à la playlist';
	@override String get bookmark => 'Signet';
	@override String get unbookmark => 'Supprimer les favoris';
	@override String get share => 'Partager';
	@override String get deletemedia => 'Supprimer le fichier';
	@override String get deletemediahint => 'Souhaitez-vous supprimer ce fichier téléchargé? Cette action ne peut pas être annulée.';
	@override String get searchhint => 'Rechercher des messages audio et vidéo';
	@override String get performingsearch => 'Recherche d\'audio et de vidéos';
	@override String get nosearchresult => 'Aucun résultat trouvé';
	@override String get nosearchresulthint => 'Essayez de saisir un mot clé plus général';
	@override String get addtoplaylist => 'Ajouter à la playlist';
	@override String get newplaylist => 'Nouvelle playlist';
	@override String get playlistitm => 'Playlist';
	@override String get mediaaddedtoplaylist => 'Média ajouté à la playlist.';
	@override String get mediaremovedfromplaylist => 'Média supprimé de la playlist';
	@override String get clearplaylistmedias => 'Effacer tous les médias';
	@override String get deletePlayList => 'Supprimer la playlist';
	@override String get clearplaylistmediashint => 'Voulez-vous supprimer tous les médias de cette liste de lecture?';
	@override String get deletePlayListhint => 'Voulez-vous supprimer cette liste de lecture et effacer tous les médias?';
	@override String get videomessages => 'Messages vidéo';
	@override String get audiomessages => 'Messages audio';
	@override String get comments => 'commentaires';
	@override String get replies => 'réponses';
	@override String get reply => 'Répondre';
	@override String get logintoaddcomment => 'Connectez-vous pour ajouter un commentaire';
	@override String get logintoreply => 'Connectez-vous pour répondre';
	@override String get writeamessage => 'Écrire un message...';
	@override String get nocomments => 'Aucun commentaire trouvé \ncliquez pour réessayer';
	@override String get errormakingcomments => 'Impossible de traiter les commentaires pour le moment..';
	@override String get errordeletingcomments => 'Impossible de supprimer ce commentaire pour le moment..';
	@override String get erroreditingcomments => 'Impossible de modifier ce commentaire pour le moment..';
	@override String get errorloadingmorecomments => 'Impossible de charger plus de commentaires pour le moment..';
	@override String get deletingcomment => 'Suppression du commentaire';
	@override String get editingcomment => 'Modification du commentaire';
	@override String get deletecommentalert => 'Supprimer le commentaire';
	@override String get editcommentalert => 'Modifier le commentaire';
	@override String get deletecommentalerttext => 'Souhaitez-vous supprimer ce commentaire? Cette action ne peut pas être annulée';
	@override String get loadmore => 'charger plus';
	@override String get messages => 'Messages';
	@override String get guestuser => 'Utilisateur invité';
	@override String get fullname => 'Nom complet';
	@override String get emailaddress => 'Adresse électronique';
	@override String get password => 'Mot de passe';
	@override String get repeatpassword => 'Répéter le mot de passe';
	@override String get register => 'S\'inscrire';
	@override String get login => 'S\'identifier';
	@override String get logout => 'Se déconnecter';
	@override String get logoutfromapp => 'Déconnexion de l\'application?';
	@override String get logoutfromapphint => 'Vous ne pourrez pas aimer ou commenter des articles et des vidéos si vous n\'êtes pas connecté.';
	@override String get gotologin => 'Aller à la connexion';
	@override String get resetpassword => 'réinitialiser le mot de passe';
	@override String get logintoaccount => 'Vous avez déjà un compte? S\'identifier';
	@override String get emptyfielderrorhint => 'Vous devez remplir tous les champs';
	@override String get invalidemailerrorhint => 'Vous devez saisir une adresse e-mail valide';
	@override String get passwordsdontmatch => 'Les mots de passe ne correspondent pas';
	@override String get processingpleasewait => 'Traitement, veuillez patienter...';
	@override String get createaccount => 'Créer un compte';
	@override String get forgotpassword => 'Mot de passe oublié?';
	@override String get orloginwith => 'Ou connectez-vous avec';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Plus d\'options';
	@override String get about => 'À propos de nous';
	@override String get privacy => 'confidentialité';
	@override String get terms => 'Termes de l\'application';
	@override String get rate => 'Application de taux';
	@override String get version => 'Version';
	@override String get pulluploadmore => 'tirer la charge';
	@override String get loadfailedretry => 'Échec du chargement! Cliquez sur Réessayer!';
	@override String get releaseloadmore => 'relâchez pour charger plus';
	@override String get nomoredata => 'Plus de données';
	@override String get errorReportingComment => 'Commentaire de rapport d\'erreur';
	@override String get reportingComment => 'Signaler un commentaire';
	@override String get reportcomment => 'Options de rapport';
	@override List<String> get reportCommentsList => [
		'Contenu commercial indésirable ou spam',
		'Pornographie ou matériel sexuel explicite',
		'Discours haineux ou violence graphique',
		'Harcèlement ou intimidation',
	];
	@override String get bookmarksMedia => 'Mes marque-pages';
	@override String get noitemstodisplay => 'Aucun élément à afficher';
	@override String get loginrequired => 'Connexion requise';
	@override String get loginrequiredhint => 'Pour vous abonner à cette plateforme, vous devez être connecté. Créez un compte gratuit maintenant ou connectez-vous à votre compte existant.';
	@override String get subscriptions => 'Abonnements aux applications';
	@override String get subscribe => 'SOUSCRIRE';
	@override String get subscribehint => 'Abonnement requis';
	@override String get playsubscriptionrequiredhint => 'Vous devez vous abonner avant de pouvoir écouter ou regarder ce média.';
	@override String get previewsubscriptionrequiredhint => 'Vous avez atteint la durée de prévisualisation autorisée pour ce média. Vous devez vous abonner pour continuer à écouter ou à regarder ce média.';
	@override String get copiedtoclipboard => 'Copié dans le presse-papier';
	@override String get downloadbible => 'Télécharger la Bible';
	@override String get downloadversion => 'Télécharger';
	@override String get downloading => 'Téléchargement';
	@override String get failedtodownload => 'Échec du téléchargement';
	@override String get pleaseclicktoretry => 'Veuillez cliquer pour réessayer.';
	@override String get of => 'De';
	@override String get nobibleversionshint => 'Il n\'y a pas de données bibliques à afficher, cliquez sur le bouton ci-dessous pour télécharger au moins une version biblique.';
	@override String get downloaded => 'Téléchargé';
	@override String get enteremailaddresstoresetpassword => 'Entrez votre e-mail pour réinitialiser votre mot de passe';
	@override String get backtologin => 'RETOUR CONNEXION';
	@override String get signintocontinue => 'Connectez-vous pour continuer';
	@override String get signin => 'SE CONNECTER';
	@override String get signinforanaccount => 'INSCRIVEZ-VOUS POUR UN COMPTE?';
	@override String get alreadyhaveanaccount => 'Vous avez déjà un compte?';
	@override String get updateprofile => 'Mettre à jour le profil';
	@override String get updateprofilehint => 'Pour commencer, veuillez mettre à jour votre page de profil, cela nous aidera à vous connecter avec d\'autres personnes';
	@override String get autoplayvideos => 'Vidéos de lecture automatique';
	@override String get gosocial => 'Passez aux réseaux sociaux';
	@override String get searchbible => 'Rechercher dans la Bible';
	@override String get filtersearchoptions => 'Filtrer les options de recherche';
	@override String get narrowdownsearch => 'Utilisez le bouton de filtrage ci-dessous pour affiner la recherche pour un résultat plus précis.';
	@override String get searchbibleversion => 'Rechercher la version de la Bible';
	@override String get searchbiblebook => 'Rechercher un livre biblique';
	@override String get search => 'Chercher';
	@override String get setBibleBook => 'Définir le livre de la Bible';
	@override String get oldtestament => 'L\'Ancien Testament';
	@override String get newtestament => 'Nouveau Testament';
	@override String get limitresults => 'Limiter les résultats';
	@override String get setfilters => 'Définir les filtres';
	@override String get bibletranslator => 'Traducteur de la Bible';
	@override String get chapter => ' Chapitre ';
	@override String get verse => ' Verset ';
	@override String get translate => 'traduire';
	@override String get bibledownloadinfo => 'Le téléchargement de la Bible a commencé, veuillez ne pas fermer cette page tant que le téléchargement n\'est pas terminé.';
	@override String get received => 'reçu';
	@override String get outoftotal => 'sur le total';
	@override String get set => 'ENSEMBLE';
	@override String get selectColor => 'Select Color';
	@override String get switchbibleversion => 'Changer de version de la Bible';
	@override String get switchbiblebook => 'Changer de livre biblique';
	@override String get gotosearch => 'Aller au chapitre';
	@override String get changefontsize => 'Changer la taille de la police';
	@override String get font => 'Police de caractère';
	@override String get readchapter => 'Lire le chapitre';
	@override String get showhighlightedverse => 'Afficher les versets en surbrillance';
	@override String get downloadmoreversions => 'Télécharger plus de versions';
	@override String get suggestedusers => 'Utilisateurs suggérés à suivre';
	@override String get unfollow => 'Ne pas suivre';
	@override String get follow => 'Suivre';
	@override String get searchforpeople => 'Recherche de personnes';
	@override String get viewpost => 'Voir l\'article';
	@override String get viewprofile => 'Voir le profil';
	@override String get mypins => 'Mes épingles';
	@override String get viewpinnedposts => 'Afficher les messages épinglés';
	@override String get personal => 'Personnel';
	@override String get update => 'Mettre à jour';
	@override String get phonenumber => 'Numéro de téléphone';
	@override String get showmyphonenumber => 'Afficher mon numéro de téléphone aux utilisateurs';
	@override String get dateofbirth => 'Date de naissance';
	@override String get showmyfulldateofbirth => 'Afficher ma date de naissance complète aux personnes qui consultent mon statut';
	@override String get notifications => 'Notifications';
	@override String get notifywhenuserfollowsme => 'M\'avertir lorsqu\'un utilisateur me suit';
	@override String get notifymewhenusercommentsonmypost => 'M\'avertir lorsque les utilisateurs commentent mon message';
	@override String get notifymewhenuserlikesmypost => 'M\'avertir lorsque les utilisateurs aiment mon message';
	@override String get churchsocial => 'Église sociale';
	@override String get shareyourthoughts => 'Partage tes pensées';
	@override String get readmore => '...Lire la suite';
	@override String get less => ' Moins';
	@override String get couldnotprocess => 'Impossible de traiter l\'action demandée.';
	@override String get pleaseselectprofilephoto => 'Veuillez sélectionner une photo de profil à télécharger';
	@override String get pleaseselectprofilecover => 'Veuillez sélectionner une photo de couverture à télécharger';
	@override String get updateprofileerrorhint => 'Vous devez renseigner votre nom, date de naissance, sexe, téléphone et lieu avant de pouvoir continuer.';
	@override String get gender => 'Le sexe';
	@override String get male => 'Mâle';
	@override String get female => 'Femme';
	@override String get dob => 'Date de naissance';
	@override String get location => 'Localisation actuelle';
	@override String get qualification => 'Qualification';
	@override String get aboutme => 'À propos de moi';
	@override String get facebookprofilelink => 'Lien de profil Facebook';
	@override String get twitterprofilelink => 'Lien de profil Twitter';
	@override String get linkdln => 'Lien de profil Linkedln';
	@override String get likes => 'Aime';
	@override String get likess => 'Comme';
	@override String get pinnedposts => 'Mes messages épinglés';
	@override String get unpinpost => 'Détacher le message';
	@override String get unpinposthint => 'Souhaitez-vous supprimer ce message de vos messages épinglés?';
	@override String get postdetails => 'Détails de l\'article';
	@override String get posts => 'Des postes';
	@override String get followers => 'Suiveurs';
	@override String get followings => 'Suivi';
	@override String get my => 'Mon';
	@override String get edit => 'Éditer';
	@override String get delete => 'Supprimer';
	@override String get deletepost => 'Supprimer le message';
	@override String get deleteposthint => 'Souhaitez-vous supprimer ce message? Les publications peuvent toujours apparaître sur les flux de certains utilisateurs.';
	@override String get maximumallowedsizehint => 'Téléchargement de fichier maximum autorisé atteint';
	@override String get maximumuploadsizehint => 'Le fichier sélectionné dépasse la limite de taille de fichier de téléchargement autorisée.';
	@override String get makeposterror => 'Impossible de publier un message pour le moment, veuillez cliquer pour réessayer.';
	@override String get makepost => 'Faire un message';
	@override String get selectfile => 'Choisir le dossier';
	@override String get images => 'Images';
	@override String get shareYourThoughtsNow => 'Share your thoughts ...';
	@override String get photoviewer => 'Visor de fotos';
	@override String get nochatsavailable => 'Aucune conversation disponible \n Cliquez sur l\'icône d\'ajout ci-dessous \n pour sélectionner les utilisateurs avec lesquels discuter';
	@override String get typing => 'Dactylographie...';
	@override String get photo => 'Foto';
	@override String get online => 'En ligne';
	@override String get offline => 'Hors ligne';
	@override String get lastseen => 'Dernière vue';
	@override String get deleteselectedhint => 'Cette action supprimera les messages sélectionnés. Veuillez noter que cela ne supprime que votre côté de la conversation, \n les messages s\'afficheront toujours sur votre appareil partenaire.';
	@override String get deleteselected => 'Supprimer sélectionnée';
	@override String get unabletofetchconversation => 'Impossible de récupérer \n votre conversation avec \n';
	@override String get loadmoreconversation => 'Charger plus de conversations';
	@override String get sendyourfirstmessage => 'Envoyez votre premier message à \n';
	@override String get unblock => 'Débloquer ';
	@override String get block => 'Bloquer ';
	@override String get writeyourmessage => 'Rédigez votre message...';
	@override String get clearconversation => 'Conversation claire';
	@override String get clearconversationhintone => 'Cette action effacera toute votre conversation avec ';
	@override String get clearconversationhinttwo => '.\n  Veuillez noter que cela ne supprime que votre côté de la conversation, les messages seront toujours affichés sur le chat de votre partenaire.';
	@override String get title => 'Titre';
	@override String get thaks_for_contacting => 'Merci d\'avoir contacté';
	@override String get submit => 'Soumettre';
	@override String get prayer_request_form => 'Formulaire de demande de prière';
	@override String get please_wait => 'Merci de patienter';
	@override String get photos => 'Photos';
	@override String get no_data => 'Aucune donnée';
	@override String get msg => 'Massage';
	@override String get ministry => 'Ministère';
	@override String get ministry_info => 'Informations du ministère';
	@override String get ministries => 'Ministères';
	@override String get leaders => 'Dirigeantes';
	@override String get leader_info => 'Informations du chef';
	@override String get prayer_request => 'Demande de prière';
	@override String get announcement_info => 'Informations sur l\'annonce';
	@override String get leader_desc_json => 'Description des dirigeants Json';
	@override String get leader => 'Chef';
	@override String get guestemail => 'E-mail invité';
	@override String get gallery => 'Galerie';
	@override String get err_empty_your_name => 'Votre nom est vide';
	@override String get err_empty_number => 'Votre numéro est vide';
	@override String get err_empty_message => 'Les messages sont vides';
	@override String get err_empty_email_address => 'L\'adresse e-mail est vide';
	@override String get documents => 'Document';
	@override String get description => 'La description';
	@override String get contact_us => 'Nous contacter';
	@override String get contact_number => 'Numéro de contact';
	@override String get announcements => 'Annonce';
}

// Path: <root>
class _StringsPt implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsPt _root = this; // ignore: unused_field

	// Translations
	@override String get appname => 'Bread of Life';
	@override String get selectlanguage => 'Selecione o idioma';
	@override String get chooseapplanguage => 'Escolha o idioma do aplicativo';
	@override String get nightmode => 'Modo noturno';
	@override String get initializingapp => 'inicializando...';
	@override String get home => 'Casa';
	@override String get branches => 'Ramos';
	@override String get inbox => 'Caixa de entrada';
	@override String get downloads => 'Transferências';
	@override String get settings => 'Configurações';
	@override String get events => 'Eventos';
	@override String get myplaylists => 'Minhas Playlists';
	@override String get website => 'Local na rede Internet';
	@override String get hymns => 'Hinos';
	@override String get articles => 'Artigos';
	@override String get notes => 'Notas';
	@override String get donate => 'Doar';
	@override String get bookmarks => 'Favoritos';
	@override String get socialplatforms => 'Plataformas Sociais';
	@override List<String> get onboardingpagetitles => [
		'Bem-vindo ao Bread of Life',
		'Repleto de recursos',
		'Áudio, vídeo \n e transmissão ao vivo',
		'Criar Conta',
	];
	@override List<String> get onboardingpagehints => [
		'Vá além das manhãs de domingo e das quatro paredes de sua igreja. Tudo que você precisa para se comunicar e interagir com um mundo focado em dispositivos móveis.',
		'Reunimos todos os principais recursos que seu aplicativo de igreja deve ter. Eventos, devocionais, notificações, notas e bíblia em várias versões.',
		'Permita que usuários de todo o mundo assistam a vídeos, ouçam mensagens de áudio e assistam a transmissões ao vivo de seus serviços religiosos.',
		'Comece sua jornada para uma experiência de adoração sem fim.',
	];
	@override String get next => 'PRÓXIMO';
	@override String get done => 'INICIAR';
	@override String get quitapp => 'Sair do aplicativo!';
	@override String get quitappwarning => 'Você deseja fechar o aplicativo?';
	@override String get quitappaudiowarning => 'No momento, você está reproduzindo um áudio. Sair do aplicativo interromperá a reprodução do áudio. Se você não deseja interromper a reprodução, apenas minimize o aplicativo com o botão central ou clique no botão Ok para encerrar o aplicativo agora.';
	@override String get ok => 'Está bem';
	@override String get retry => 'TENTAR NOVAMENTE';
	@override String get oops => 'Opa!';
	@override String get save => 'Salve ';
	@override String get cancel => 'Cancelar';
	@override String get error => 'Erro';
	@override String get success => 'Sucesso';
	@override String get skip => 'Pular';
	@override String get skiplogin => 'Pular login';
	@override String get skipregister => 'Ignorar registro';
	@override String get dataloaderror => 'Não foi possível carregar os dados solicitados no momento, verifique sua conexão de dados e clique para tentar novamente.';
	@override String get suggestedforyou => 'Sugerido para você';
	@override String get devotionals => 'Devocionais';
	@override String get categories => 'Categorias';
	@override String get category => 'Categoria';
	@override String get videos => 'Vídeos';
	@override String get audios => 'Áudios';
	@override String get biblebooks => 'Bíblia';
	@override String get audiobible => 'Bíblia em Áudio';
	@override String get livestreams => 'Transmissões ao vivo';
	@override String get radio => 'Rádio';
	@override String get allitems => 'Todos os itens';
	@override String get emptyplaylist => 'Sem listas de reprodução';
	@override String get notsupported => 'Não suportado';
	@override String get cleanupresources => 'Limpando recursos';
	@override String get grantstoragepermission => 'Conceda permissão de acesso ao armazenamento para continuar';
	@override String get sharefiletitle => 'Assistir ou ouvir ';
	@override String get sharefilebody => 'Através da Bread of Life App, Baixe agora em ';
	@override String get sharetext => 'Desfrute de streaming ilimitado de áudio e vídeo';
	@override String get sharetexthint => 'Junte-se à plataforma de streaming de vídeo e áudio que permite assistir e ouvir milhões de arquivos de todo o mundo. Baixe agora em';
	@override String get download => 'Baixar';
	@override String get addplaylist => 'Adicionar à Playlist';
	@override String get bookmark => 'marca páginas';
	@override String get unbookmark => 'Desmarcar';
	@override String get share => 'Compartilhar';
	@override String get deletemedia => 'Excluir arquivo';
	@override String get deletemediahint => 'Você deseja excluir este arquivo baixado? Essa ação não pode ser desfeita.';
	@override String get nonotesfound => 'Nenhuma nota encontrada';
	@override String get newnote => 'Novo';
	@override String get savenotetitle => 'Título da Nota';
	@override String get searchhint => 'Pesquisar mensagens de áudio e vídeo';
	@override String get performingsearch => 'Pesquisando áudios e vídeos';
	@override String get nosearchresult => 'Nenhum resultado encontrado';
	@override String get nosearchresulthint => 'Tente inserir palavras-chave mais gerais';
	@override String get deletenote => 'Excluir nota';
	@override String get deletenotehint => 'Você quer deletar esta nota? Esta ação não pode ser revertida.';
	@override String get addtoplaylist => 'Adicionar à Playlist';
	@override String get newplaylist => 'Nova Playlist';
	@override String get playlistitm => 'Lista de reprodução';
	@override String get mediaaddedtoplaylist => 'Mídia adicionada à lista de reprodução.';
	@override String get mediaremovedfromplaylist => 'Mídia removida da lista de reprodução';
	@override String get clearplaylistmedias => 'Limpar todas as mídias';
	@override String get deletePlayList => 'Excluir lista de reprodução';
	@override String get clearplaylistmediashint => 'Vá em frente e remover todas as mídias desta lista de reprodução?';
	@override String get deletePlayListhint => 'Vá em frente e exclua esta lista de reprodução e limpar todas as mídias?';
	@override String get videomessages => 'Mensagens de Vídeo';
	@override String get audiomessages => 'Mensagens de Áudio';
	@override String get comments => 'Comentários';
	@override String get replies => 'Respostas';
	@override String get reply => 'Resposta';
	@override String get logintoaddcomment => 'Faça login para adicionar um comentário';
	@override String get logintoreply => 'Entre para responder';
	@override String get writeamessage => 'Escreve uma mensagem...';
	@override String get nocomments => 'Nenhum comentário encontrado \nclique para tentar novamente';
	@override String get errormakingcomments => 'Não é possível processar comentários no momento..';
	@override String get errordeletingcomments => 'Não é possível excluir este comentário no momento..';
	@override String get erroreditingcomments => 'Não é possível editar este comentário no momento..';
	@override String get errorloadingmorecomments => 'Não é possível carregar mais comentários no momento..';
	@override String get deletingcomment => 'Excluindo comentário';
	@override String get editingcomment => 'Editando comentário';
	@override String get deletecommentalert => 'Apagar Comentário';
	@override String get editcommentalert => 'Editar Comentário';
	@override String get deletecommentalerttext => 'Você deseja deletar este comentário? Essa ação não pode ser desfeita';
	@override String get loadmore => 'Carregue mais';
	@override String get messages => 'Mensagens';
	@override String get guestuser => 'Usuário Convidado';
	@override String get fullname => 'Nome completo';
	@override String get emailaddress => 'Endereço de e-mail';
	@override String get password => 'Senha';
	@override String get repeatpassword => 'Repita a senha';
	@override String get register => 'Registro';
	@override String get login => 'Conecte-se';
	@override String get logout => 'Sair';
	@override String get logoutfromapp => 'Sair do aplicativo?';
	@override String get logoutfromapphint => 'Você não poderá curtir ou comentar em artigos e vídeos se não estiver logado.';
	@override String get gotologin => 'Vá para o Login';
	@override String get resetpassword => 'Redefinir senha';
	@override String get logintoaccount => 'já tem uma conta? Conecte-se';
	@override String get emptyfielderrorhint => 'Você precisa preencher todos os campos';
	@override String get invalidemailerrorhint => 'Você precisa inserir um endereço de e-mail válido';
	@override String get passwordsdontmatch => 'As senhas não conferem';
	@override String get processingpleasewait => 'Processando ... Por favor aguarde';
	@override String get createaccount => 'Crie a sua conta aqui';
	@override String get forgotpassword => 'Esqueceu a senha?';
	@override String get orloginwith => 'Ou faça login com';
	@override String get facebook => 'Facebook';
	@override String get google => 'Google';
	@override String get moreoptions => 'Mais opções';
	@override String get about => 'Sobre nós';
	@override String get privacy => 'Privacidade';
	@override String get terms => 'Termos do aplicativo';
	@override String get rate => 'Avaliar aplicativo';
	@override String get version => 'Versão';
	@override String get pulluploadmore => 'puxar a carga';
	@override String get loadfailedretry => 'Falha ao carregar! Clique em repetir!';
	@override String get releaseloadmore => 'solte para carregar mais';
	@override String get nomoredata => 'Sem mais dados';
	@override String get errorReportingComment => 'Comentário do Error Reporting';
	@override String get reportingComment => 'Comentário de relatório';
	@override String get reportcomment => 'Opções de relatório';
	@override List<String> get reportCommentsList => [
		'Conteúdo comercial indesejado ou spam',
		'Pornografia ou material sexual explícito',
		'Discurso de ódio ou violência gráfica',
		'Assédio ou intimidação',
	];
	@override String get bookmarksMedia => 'Meus marcadores de livro';
	@override String get noitemstodisplay => 'Nenhum item para exibir';
	@override String get loginrequired => 'Login necessário';
	@override String get loginrequiredhint => 'Para se inscrever nesta plataforma, você precisa estar logado. Crie uma conta gratuita agora ou faça login em sua conta existente.';
	@override String get subscriptions => 'Assinaturas de aplicativos';
	@override String get subscribe => 'SE INSCREVER';
	@override String get subscribehint => 'Assinatura necessária';
	@override String get playsubscriptionrequiredhint => 'Você precisa se inscrever antes de ouvir ou assistir a esta mídia.';
	@override String get previewsubscriptionrequiredhint => 'Você atingiu a duração de visualização permitida para esta mídia. Você precisa se inscrever para continuar ouvindo ou assistindo esta mídia.';
	@override String get copiedtoclipboard => 'Copiado para a área de transferência';
	@override String get downloadbible => 'Baixe a Bíblia';
	@override String get downloadversion => 'Baixar';
	@override String get downloading => 'Baixando';
	@override String get failedtodownload => 'Falhou o download';
	@override String get pleaseclicktoretry => 'Clique para tentar novamente.';
	@override String get of => 'Do';
	@override String get nobibleversionshint => 'Não há dados da Bíblia para exibir, clique no botão abaixo para baixar pelo menos uma versão da Bíblia.';
	@override String get downloaded => 'Baixado';
	@override String get enteremailaddresstoresetpassword => 'Insira seu e-mail para redefinir sua senha';
	@override String get backtologin => 'VOLTE AO LOGIN';
	@override String get signintocontinue => 'Faça login para continuar';
	@override String get signin => 'ASSINAR EM';
	@override String get signinforanaccount => 'INSCREVA-SE PRA UMA CONTA?';
	@override String get alreadyhaveanaccount => 'já tem uma conta?';
	@override String get updateprofile => 'Atualizar perfil';
	@override String get updateprofilehint => 'Para começar, atualize sua página de perfil, isso nos ajudará a conectar você com outras pessoas';
	@override String get autoplayvideos => 'Vídeos de reprodução automática';
	@override String get gosocial => 'Social';
	@override String get searchbible => 'Bíblia Pesquisa';
	@override String get filtersearchoptions => 'Opções de pesquisa de filtro';
	@override String get narrowdownsearch => 'Use o botão de filtro abaixo para restringir a busca por um resultado mais preciso.';
	@override String get searchbibleversion => 'Versão da Bíblia de pesquisa';
	@override String get searchbiblebook => 'Pesquisar livro bíblico';
	@override String get search => 'Procurar';
	@override String get setBibleBook => 'Set Bible Book';
	@override String get oldtestament => 'Antigo Testamento';
	@override String get newtestament => 'Novo Testamento';
	@override String get limitresults => 'Limite de resultados';
	@override String get setfilters => 'Definir Filtros';
	@override String get bibletranslator => 'Tradutor da bíblia';
	@override String get chapter => ' Capítulo ';
	@override String get verse => ' Versículo ';
	@override String get translate => 'traduzir';
	@override String get bibledownloadinfo => 'Download da Bíblia iniciado, por favor, não feche esta página até que o download seja concluído.';
	@override String get received => 'recebido';
	@override String get outoftotal => 'fora do total';
	@override String get set => 'CONJUNTO';
	@override String get selectColor => 'Selecione a cor';
	@override String get switchbibleversion => 'Mudar a versão da Bíblia';
	@override String get switchbiblebook => 'Trocar livro bíblico';
	@override String get gotosearch => 'Vá para o Capítulo';
	@override String get changefontsize => 'Mudar TAMANHO DA FONTE';
	@override String get font => 'Fonte';
	@override String get readchapter => 'Leia o capítulo';
	@override String get showhighlightedverse => 'Mostrar versos em destaque';
	@override String get downloadmoreversions => 'Baixe mais versões';
	@override String get suggestedusers => 'Usuários sugeridos para seguir';
	@override String get unfollow => 'Deixar de seguir';
	@override String get follow => 'Segue';
	@override String get searchforpeople => 'Procura por pessoas';
	@override String get viewpost => 'Ver postagem';
	@override String get viewprofile => 'Ver perfil';
	@override String get mypins => 'Meus Pins';
	@override String get viewpinnedposts => 'Ver postagens fixadas';
	@override String get personal => 'Pessoal';
	@override String get update => 'Atualizar';
	@override String get phonenumber => 'Número de telefone';
	@override String get showmyphonenumber => 'Mostrar meu número de telefone aos usuários';
	@override String get dateofbirth => 'Data de nascimento';
	@override String get showmyfulldateofbirth => 'Mostrar minha data de nascimento completa para as pessoas que visualizam meu status';
	@override String get notifications => 'Notificações';
	@override String get notifywhenuserfollowsme => 'Notifique-me quando um usuário me seguir';
	@override String get notifymewhenusercommentsonmypost => 'Notifique-me quando usuários comentarem em minha postagem';
	@override String get notifymewhenuserlikesmypost => 'Notifique-me quando os usuários curtirem minha postagem';
	@override String get churchsocial => 'Igreja Social';
	@override String get shareyourthoughts => 'Compartilhe seus pensamentos';
	@override String get readmore => '...Consulte Mais informação';
	@override String get less => ' Menos';
	@override String get couldnotprocess => 'Não foi possível processar a ação solicitada.';
	@override String get pleaseselectprofilephoto => 'Selecione uma foto de perfil para fazer upload';
	@override String get pleaseselectprofilecover => 'Selecione uma foto de capa para fazer upload';
	@override String get updateprofileerrorhint => 'Você precisa preencher seu nome, data de nascimento, sexo, telefone e localização antes de continuar.';
	@override String get gender => 'Gênero';
	@override String get male => 'Masculino';
	@override String get female => 'Fêmeo';
	@override String get dob => 'Data de nascimento';
	@override String get location => 'Localização atual';
	@override String get qualification => 'Qualificação';
	@override String get aboutme => 'Sobre mim';
	@override String get facebookprofilelink => 'Link do perfil do Facebook';
	@override String get twitterprofilelink => 'Link do perfil do Twitter';
	@override String get linkdln => 'Link do perfil Linkedln';
	@override String get likes => 'Gosta';
	@override String get likess => 'Gosto (s)';
	@override String get pinnedposts => 'Minhas postagens fixadas';
	@override String get unpinpost => 'Liberar postagem';
	@override String get unpinposthint => 'Você deseja remover esta postagem de suas postagens fixadas?';
	@override String get postdetails => 'Detalhes da postagem';
	@override String get posts => 'Postagens';
	@override String get followers => 'Seguidores';
	@override String get followings => 'Seguidores';
	@override String get my => 'Minhas';
	@override String get edit => 'Editar';
	@override String get delete => 'Excluir';
	@override String get deletepost => 'Apague a postagem';
	@override String get deleteposthint => 'Você deseja deletar esta postagem? As postagens ainda podem aparecer nos feeds de alguns usuários.';
	@override String get maximumallowedsizehint => 'Máximo de upload de arquivo permitido atingido';
	@override String get maximumuploadsizehint => 'O arquivo selecionado excede o limite de tamanho de arquivo para upload permitido.';
	@override String get makeposterror => 'Não é possível postar no momento, por favor clique para tentar novamente.';
	@override String get makepost => 'Fazer Postagem';
	@override String get selectfile => 'Selecione o arquivo';
	@override String get images => 'Imagens';
	@override String get shareYourThoughtsNow => 'Share your thoughts ...';
	@override String get photoviewer => 'Visualizador de fotos';
	@override String get nochatsavailable => 'Nenhuma conversa disponível \n Clique no ícone adicionar abaixo \npara selecionar usuários para bater papo';
	@override String get typing => 'Digitando...';
	@override String get photo => 'Foto';
	@override String get online => 'Conectados';
	@override String get offline => 'Desligado';
	@override String get lastseen => 'Visto pela última vez';
	@override String get deleteselectedhint => 'Esta ação excluirá as mensagens selecionadas. Observe que isso exclui apenas o seu lado da conversa, \n as mensagens ainda serão exibidas no dispositivo do seu parceiro';
	@override String get deleteselected => 'Apagar selecionado';
	@override String get unabletofetchconversation => 'Não é possível buscar \n sua conversa com \n';
	@override String get loadmoreconversation => 'Carregar mais conversas';
	@override String get sendyourfirstmessage => 'Envie sua primeira mensagem para \n';
	@override String get unblock => 'Desbloquear ';
	@override String get block => 'Quadra ';
	@override String get writeyourmessage => 'Escreva sua mensagem...';
	@override String get clearconversation => 'Conversa Clara';
	@override String get clearconversationhintone => 'Esta ação irá limpar toda a sua conversa com ';
	@override String get clearconversationhinttwo => '.\n  Observe que isso apenas exclui o seu lado da conversa, as mensagens ainda serão exibidas no bate-papo de seus parceiros.';
	@override String get title => 'Título';
	@override String get thaks_for_contacting => 'Obrigado por entrar em contato';
	@override String get submit => 'Enviar';
	@override String get prayer_request_form => 'Formulário de Pedido de Oração';
	@override String get please_wait => 'Por favor, aguarde';
	@override String get photos => 'Fotos';
	@override String get no_data => 'Sem dados';
	@override String get msg => 'Massagem';
	@override String get ministry => 'Ministério';
	@override String get ministry_info => 'Informações do Ministério';
	@override String get ministries => 'Ministérios';
	@override String get leaders => 'Líderes';
	@override String get leader_info => 'Informações do Líder';
	@override String get prayer_request => 'Pedido de oração';
	@override String get announcement_info => 'Informações do anúncio';
	@override String get leader_desc_json => 'Líderes Desc Json';
	@override String get leader => 'Líder';
	@override String get guestemail => 'E-mail do convidado';
	@override String get gallery => 'Galeria';
	@override String get err_empty_your_name => 'Seu nome está vazio';
	@override String get err_empty_number => 'Seu número está vazio';
	@override String get err_empty_message => 'Mensagens está vazio';
	@override String get err_empty_email_address => 'Endereço de e-mail vazio';
	@override String get documents => 'Documento';
	@override String get description => 'Descrição';
	@override String get contact_us => 'Contate-nos';
	@override String get contact_number => 'Número de contato';
	@override String get announcements => 'Anúncio';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appname': return 'Bread of Life';
			case 'selectlanguage': return 'Select Language';
			case 'chooseapplanguage': return 'Choose App Language';
			case 'nightmode': return 'Night Mode';
			case 'initializingapp': return 'initializing...';
			case 'home': return 'Home';
			case 'branches': return 'Branches';
			case 'inbox': return 'Inbox';
			case 'downloads': return 'Downloads';
			case 'settings': return 'Settings';
			case 'events': return 'Events';
			case 'myplaylists': return 'My Playlists';
			case 'website': return 'Website';
			case 'hymns': return 'Hymns';
			case 'articles': return 'Articles';
			case 'notes': return 'Notes';
			case 'donate': return 'Donate';
			case 'savenotetitle': return 'Note Title';
			case 'nonotesfound': return 'No notes found';
			case 'newnote': return 'New';
			case 'deletenote': return 'Delete Note';
			case 'deletenotehint': return 'Do you want to delete this note? This action cannot be reversed.';
			case 'bookmarks': return 'Bookmarks';
			case 'socialplatforms': return 'Social Platforms';
			case 'onboardingpagetitles.0': return 'Bread of Life Ministries';
			case 'onboardingpagetitles.1': return 'The Church';
			case 'onboardingpagetitles.2': return 'Audio, Video \n and Live Streaming';
			case 'onboardingpagetitles.3': return 'Create Account';
			case 'onboardingpagehints.0': return 'We acknowledge Jesus Christ as the sovereign Lord of our lives and believe that, by His grace, we can serve Him and turn from whatever displeases Him to a life that is pleasing to God.';
			case 'onboardingpagehints.1': return 'Is a local community of baptized believers unified through faith in Jesus Christ. It is committed to the teachings of Christ and obeying all of His commands, and it seeks to bring the Gospel to the world. The Church works together in love and unity, intent on the ultimate purpose of glorifying Christ.';
			case 'onboardingpagehints.2': return 'No matter where you are around the world, you can watch our inspiring videos, listen to audio messages and podcast, and watch live streams of our church services.';
			case 'onboardingpagehints.3': return 'Start your journey to a never-ending worship experience. Join us today!';
			case 'next': return 'NEXT';
			case 'done': return 'Get Started';
			case 'quitapp': return 'Quit App!';
			case 'quitappwarning': return 'Do you wish to close the app?';
			case 'quitappaudiowarning': return 'You are currently playing an audio, quitting the app will stop the audio playback. If you do not wish to stop playback, just minimize the app with the center button or click the Ok button to quit app now.';
			case 'ok': return 'Ok';
			case 'retry': return 'RETRY';
			case 'oops': return 'Ooops!';
			case 'save': return 'Save';
			case 'cancel': return 'Cancel';
			case 'error': return 'Error';
			case 'success': return 'Success';
			case 'skip': return 'Skip';
			case 'skiplogin': return 'Skip Login';
			case 'skipregister': return 'Skip Registration';
			case 'dataloaderror': return 'Could not load requested data at the moment, check your data connection and click to retry.';
			case 'suggestedforyou': return 'Suggested for you';
			case 'videomessages': return 'Video Messages';
			case 'audiomessages': return 'Audio Messages';
			case 'devotionals': return 'Devotionals';
			case 'categories': return 'Categories';
			case 'category': return 'Category';
			case 'videos': return 'Videos';
			case 'audios': return 'Audios';
			case 'biblebooks': return 'Bible';
			case 'audiobible': return 'Audio Bible';
			case 'livestreams': return 'Livestreams';
			case 'radio': return 'Radio';
			case 'allitems': return 'All Items';
			case 'emptyplaylist': return 'No Playlists';
			case 'notsupported': return 'Not Supported';
			case 'cleanupresources': return 'Cleaning up resources';
			case 'grantstoragepermission': return 'Please grant accessing storage permission to continue';
			case 'sharefiletitle': return 'Watch or Listen to ';
			case 'sharefilebody': return 'Via Bread of life ministries App, Download now at ';
			case 'sharetext': return 'Enjoy unlimited Audio & Video streaming';
			case 'sharetexthint': return 'Join the Video and Audio streaming platform that lets you watch and listen to millions of files from around the world. Download now at';
			case 'download': return 'Download';
			case 'addplaylist': return 'Add to playlist';
			case 'bookmark': return 'Bookmark';
			case 'unbookmark': return 'UnBookmark';
			case 'share': return 'Share';
			case 'deletemedia': return 'Delete File';
			case 'deletemediahint': return 'Do you wish to delete this downloaded file? This action cannot be undone.';
			case 'searchhint': return 'Search Audio & Video Messages';
			case 'performingsearch': return 'Searching Audios and Videos';
			case 'nosearchresult': return 'No results Found';
			case 'nosearchresulthint': return 'Try input more general keyword';
			case 'addtoplaylist': return 'Add to playlist';
			case 'newplaylist': return 'New playlist';
			case 'playlistitm': return 'Playlist';
			case 'mediaaddedtoplaylist': return 'Media added to playlist.';
			case 'mediaremovedfromplaylist': return 'Media removed from playlist';
			case 'clearplaylistmedias': return 'Clear All Media';
			case 'deletePlayList': return 'Delete Playlist';
			case 'clearplaylistmediashint': return 'Go ahead and remove all media from this playlist?';
			case 'deletePlayListhint': return 'Go ahead and delete this playlist and clear all media?';
			case 'comments': return 'Comments';
			case 'replies': return 'Replies';
			case 'reply': return 'Reply';
			case 'logintoaddcomment': return 'Login to add a comment';
			case 'logintoreply': return 'Login to reply';
			case 'writeamessage': return 'Write a message...';
			case 'nocomments': return 'No Comments found \nclick to retry';
			case 'errormakingcomments': return 'Cannot process commenting at the moment..';
			case 'errordeletingcomments': return 'Cannot delete this comment at the moment..';
			case 'erroreditingcomments': return 'Cannot edit this comment at the moment..';
			case 'errorloadingmorecomments': return 'Cannot load more comments at the moment..';
			case 'deletingcomment': return 'Deleting comment';
			case 'editingcomment': return 'Editing comment';
			case 'deletecommentalert': return 'Delete Comment';
			case 'editcommentalert': return 'Edit Comment';
			case 'deletecommentalerttext': return 'Do you wish to delete this comment? This action cannot be undone';
			case 'loadmore': return 'load more';
			case 'messages': return 'Messages';
			case 'guestuser': return 'Guest User';
			case 'fullname': return 'Full Name';
			case 'emailaddress': return 'Email Address';
			case 'password': return 'Password';
			case 'repeatpassword': return 'Repeat Password';
			case 'register': return 'Register';
			case 'login': return 'Login';
			case 'logout': return 'Logout';
			case 'logoutfromapp': return 'Logout from app?';
			case 'logoutfromapphint': return 'You wont be able to like or comment on articles and videos if you are not logged in.';
			case 'gotologin': return 'Go to Login';
			case 'resetpassword': return 'Reset Password';
			case 'logintoaccount': return 'Already have an account? Login';
			case 'emptyfielderrorhint': return 'You need to fill all the fields';
			case 'invalidemailerrorhint': return 'You need to enter a valid email address';
			case 'passwordsdontmatch': return 'Passwords dont match';
			case 'processingpleasewait': return 'Processing, Please wait...';
			case 'createaccount': return 'Create an account';
			case 'forgotpassword': return 'Forgot Password?';
			case 'orloginwith': return 'Or Login With';
			case 'facebook': return 'Facebook';
			case 'google': return 'Google';
			case 'moreoptions': return 'More Options';
			case 'about': return 'About Us';
			case 'privacy': return 'Privacy Policy';
			case 'terms': return 'App Terms';
			case 'rate': return 'Rate App';
			case 'version': return 'Version';
			case 'pulluploadmore': return 'pull up load';
			case 'loadfailedretry': return 'Load Failed!Click retry!';
			case 'releaseloadmore': return 'release to load more';
			case 'nomoredata': return 'No more Data';
			case 'errorReportingComment': return 'Error Reporting Comment';
			case 'reportingComment': return 'Reporting Comment';
			case 'reportcomment': return 'Report Options';
			case 'reportCommentsList.0': return 'Unwanted commercial content or spam';
			case 'reportCommentsList.1': return 'Pornography or sexual explicit material';
			case 'reportCommentsList.2': return 'Hate speech or graphic violence';
			case 'reportCommentsList.3': return 'Harassment or bullying';
			case 'bookmarksMedia': return 'My Bookmarks';
			case 'noitemstodisplay': return 'No Items To Display';
			case 'loginrequired': return 'Login Required';
			case 'loginrequiredhint': return 'To subscribe on this platform, you need to be logged in. Create a free account now or log in to your existing account.';
			case 'subscriptions': return 'App Subscriptions';
			case 'subscribe': return 'SUBSCRIBE';
			case 'subscribehint': return 'Subscription Required';
			case 'playsubscriptionrequiredhint': return 'You need to subscribe before you can listen to or watch this media.';
			case 'previewsubscriptionrequiredhint': return 'You have reached the allowed preview duration for this media. You need to subscribe to continue listening or watching this media.';
			case 'copiedtoclipboard': return 'Copied to clipboard';
			case 'downloadbible': return 'Download Bible';
			case 'downloadversion': return 'Download';
			case 'downloading': return 'Downloading';
			case 'failedtodownload': return 'Failed to download';
			case 'pleaseclicktoretry': return 'Please click to retry.';
			case 'of': return 'Of';
			case 'nobibleversionshint': return 'There is no bible data to display, click on the button below to download atleast one bible version.';
			case 'downloaded': return 'Downloaded';
			case 'enteremailaddresstoresetpassword': return 'Enter your email to reset your password';
			case 'backtologin': return 'BACK TO LOGIN';
			case 'signintocontinue': return 'Sign in to continue';
			case 'signin': return 'S I G N  I N';
			case 'signinforanaccount': return 'SIGN UP FOR AN ACCOUNT?';
			case 'alreadyhaveanaccount': return 'Already have an account?';
			case 'updateprofile': return 'Update Profile';
			case 'updateprofilehint': return 'To get started, please update your profile page, this will help us in connecting you with other people';
			case 'autoplayvideos': return 'AutoPlay Videos';
			case 'gosocial': return 'Go Social';
			case 'searchbible': return 'Search Bible';
			case 'filtersearchoptions': return 'Filter Search Options';
			case 'narrowdownsearch': return 'Use the filter button below to narrow down search for a more precise result.';
			case 'searchbibleversion': return 'Search Bible Version';
			case 'searchbiblebook': return 'Search Bible Book';
			case 'search': return 'Search';
			case 'setBibleBook': return 'Set Bible Book';
			case 'oldtestament': return 'Old Testament';
			case 'newtestament': return 'New Testament';
			case 'limitresults': return 'Limit Results';
			case 'setfilters': return 'Set Filters';
			case 'bibletranslator': return 'Bible Translator';
			case 'chapter': return ' Chapter ';
			case 'verse': return ' Verse ';
			case 'translate': return 'translate';
			case 'bibledownloadinfo': return 'Bible Download started, Please do not close this page until the download is done.';
			case 'received': return 'received';
			case 'outoftotal': return 'out of total';
			case 'set': return 'SET';
			case 'selectColor': return 'Select Color';
			case 'switchbibleversion': return 'Switch Bible Version';
			case 'switchbiblebook': return 'Switch Bible Book';
			case 'gotosearch': return 'Go to Chapter';
			case 'changefontsize': return 'Change Font Size';
			case 'font': return 'Font';
			case 'readchapter': return 'Read Chapter';
			case 'showhighlightedverse': return 'Show Highlighted Verses';
			case 'downloadmoreversions': return 'Download more versions';
			case 'suggestedusers': return 'Suggested users to follow';
			case 'unfollow': return 'UnFollow';
			case 'follow': return 'Follow';
			case 'searchforpeople': return 'Search for people';
			case 'viewpost': return 'View Post';
			case 'viewprofile': return 'View Profile';
			case 'mypins': return 'My Pins';
			case 'viewpinnedposts': return 'View Pinned Posts';
			case 'personal': return 'Personal';
			case 'update': return 'Update';
			case 'phonenumber': return 'Phone Number';
			case 'showmyphonenumber': return 'Show my phone number to users';
			case 'dateofbirth': return 'Date of Birth';
			case 'showmyfulldateofbirth': return 'Show my full date of birth to people viewing my status';
			case 'notifications': return 'Notifications';
			case 'notifywhenuserfollowsme': return 'Notify me when a user follows me';
			case 'notifymewhenusercommentsonmypost': return 'Notify me when users comment on my post';
			case 'notifymewhenuserlikesmypost': return 'Notify me when users like my post';
			case 'churchsocial': return 'Church Social';
			case 'shareyourthoughts': return 'Share your thoughts';
			case 'readmore': return '...Read more';
			case 'less': return ' Less';
			case 'couldnotprocess': return 'Could not process requested action.';
			case 'pleaseselectprofilephoto': return 'Please select a profile photo to upload';
			case 'pleaseselectprofilecover': return 'Please select a cover photo to upload';
			case 'updateprofileerrorhint': return 'You need to fill your name, date of birth, gender, phone and location before you can proceed.';
			case 'gender': return 'Gender';
			case 'male': return 'Male';
			case 'female': return 'Female';
			case 'dob': return 'Date Of Birth';
			case 'location': return 'Current Location';
			case 'qualification': return 'Qualification';
			case 'aboutme': return 'About Me';
			case 'facebookprofilelink': return 'Facebook Profile Link';
			case 'twitterprofilelink': return 'Twitter Profile Link';
			case 'linkdln': return 'Linkedln Profile Link';
			case 'likes': return 'Likes';
			case 'likess': return 'Like(s)';
			case 'pinnedposts': return 'My Pinned Posts';
			case 'unpinpost': return 'Unpin Post';
			case 'unpinposthint': return 'Do you wish to remove this post from your pinned posts?';
			case 'postdetails': return 'Post Details';
			case 'posts': return 'Posts';
			case 'followers': return 'Followers';
			case 'followings': return 'Followings';
			case 'my': return 'My';
			case 'edit': return 'Edit';
			case 'delete': return 'Delete';
			case 'deletepost': return 'Delete Post';
			case 'deleteposthint': return 'Do you wish to delete this post? Posts can still appear on some users feeds.';
			case 'maximumallowedsizehint': return 'Maximum allowed file upload reached';
			case 'maximumuploadsizehint': return 'The selected file exceeds the allowed upload file size limit.';
			case 'makeposterror': return 'Unable to make post at the moment, please click to retry.';
			case 'makepost': return 'Make Post';
			case 'selectfile': return 'Select File';
			case 'images': return 'Images';
			case 'shareYourThoughtsNow': return 'Share your thoughts ...';
			case 'photoviewer': return 'Photo Viewer';
			case 'nochatsavailable': return 'No Conversations available \n Click the add icon below \nto select users to chat with';
			case 'typing': return 'Typing...';
			case 'photo': return 'Photo';
			case 'online': return 'Online';
			case 'offline': return 'Offline';
			case 'lastseen': return 'Last Seen';
			case 'deleteselectedhint': return 'This action will delete the selected messages.  Please note that this only deletes your side of the conversation, \n the messages will still show on your partners device.';
			case 'deleteselected': return 'Delete selected';
			case 'unabletofetchconversation': return 'Unable to Fetch \nyour conversation with \n';
			case 'loadmoreconversation': return 'Load more conversations';
			case 'sendyourfirstmessage': return 'Send your first message to \n';
			case 'unblock': return 'Unblock ';
			case 'block': return 'Block';
			case 'writeyourmessage': return 'Write your message...';
			case 'clearconversation': return 'Clear Conversation';
			case 'clearconversationhintone': return 'This action will clear all your conversation with ';
			case 'clearconversationhinttwo': return '.\n  Please note that this only deletes your side of the conversation, the messages will still show on your partners chat.';
			case 'title': return 'Title';
			case 'thaks_for_contacting': return 'Thanks For Contacting';
			case 'submit': return 'Submit';
			case 'prayer_request_form': return 'Prayer Request Form';
			case 'please_wait': return 'Please Wait';
			case 'photos': return 'Photos';
			case 'no_data': return 'No Data';
			case 'msg': return 'Massage';
			case 'ministry': return 'Ministry';
			case 'ministry_info': return 'Ministry Information';
			case 'ministries': return 'Ministries';
			case 'leaders': return 'Leaders';
			case 'leader_info': return 'Leader\'s Information';
			case 'prayer_request': return 'Prayer Request';
			case 'announcement_info': return 'Announcement Information';
			case 'leader_desc_json': return 'Leaders Desc Json';
			case 'leader': return 'Leader';
			case 'guestemail': return 'Guest Email';
			case 'gallery': return 'Gallery';
			case 'err_empty_your_name': return 'Your Name Is Empty';
			case 'err_empty_number': return 'Your Number Is Empty';
			case 'err_empty_message': return 'Messages is empty';
			case 'err_empty_email_address': return 'Email Address Is Empty';
			case 'documents': return 'Document';
			case 'description': return 'Description';
			case 'contact_us': return 'Contact Us';
			case 'contact_number': return 'Contact number';
			case 'announcements': return 'Announcement';
			default: return null;
		}
	}
}

extension on _StringsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appname': return 'Bread of Life';
			case 'selectlanguage': return 'Seleccione el idioma';
			case 'chooseapplanguage': return 'Elija el idioma de la aplicación';
			case 'nightmode': return 'Modo nocturno';
			case 'initializingapp': return 'inicializando...';
			case 'home': return 'Hogar';
			case 'branches': return 'Ramas';
			case 'inbox': return 'Bandeja de entrada';
			case 'downloads': return 'Descargas';
			case 'settings': return 'Configuraciones';
			case 'events': return 'Eventos';
			case 'myplaylists': return 'Mis listas de reproducción';
			case 'website': return 'Sitio web';
			case 'hymns': return 'Himnos';
			case 'articles': return 'Artículos';
			case 'notes': return 'Notas';
			case 'donate': return 'Donar';
			case 'savenotetitle': return 'Título de la nota';
			case 'bookmarks': return 'Marcadores';
			case 'socialplatforms': return 'Plataformas sociales';
			case 'onboardingpagetitles.0': return 'Bienvenido a Bread of Life';
			case 'onboardingpagetitles.1': return 'Repleto de características';
			case 'onboardingpagetitles.2': return 'Audio, Video \n and Live Streaming';
			case 'onboardingpagetitles.3': return 'Crear una cuenta';
			case 'onboardingpagehints.0': return 'Extienda más allá de las mañanas de los domingos y las cuatro paredes de su iglesia. Todo lo que necesita para comunicarse e interactuar con un mundo centrado en dispositivos móviles.';
			case 'onboardingpagehints.1': return 'Hemos reunido todas las funciones principales que debe tener la aplicación de su iglesia. Eventos, devocionales, notificaciones, notas y biblia de múltiples versiones.';
			case 'onboardingpagehints.2': return 'Permita que los usuarios de todo el mundo vean videos, escuchen mensajes de audio y vean transmisiones en vivo de los servicios de su iglesia.';
			case 'onboardingpagehints.3': return 'Comience su viaje hacia una experiencia de adoración sin fin.';
			case 'next': return 'SIGUIENTE';
			case 'done': return 'EMPEZAR';
			case 'quitapp': return 'Salir de la aplicación!';
			case 'quitappwarning': return '¿Deseas cerrar la aplicación?';
			case 'quitappaudiowarning': return 'Actualmente está reproduciendo un audio, al salir de la aplicación se detendrá la reproducción del audio. Si no desea detener la reproducción, simplemente minimice la aplicación con el botón central o haga clic en el botón Aceptar para salir de la aplicación ahora.';
			case 'deletenote': return 'Borrar nota';
			case 'deletenotehint': return '¿Quieres borrar esta nota? Esta acción no se puede revertir.';
			case 'nonotesfound': return 'No se encontraron notas';
			case 'newnote': return 'Nuevo';
			case 'ok': return 'Okay';
			case 'retry': return 'REVER';
			case 'oops': return 'Vaya!';
			case 'save': return 'Salvar';
			case 'cancel': return 'Cancelar';
			case 'error': return 'Error';
			case 'success': return 'éxito';
			case 'skip': return 'Omitir';
			case 'skiplogin': return 'Omitir inicio de sesión';
			case 'skipregister': return 'Evitar el registro';
			case 'dataloaderror': return 'No se pudieron cargar los datos solicitados en este momento, verifique su conexión de datos y haga clic para volver a intentarlo.';
			case 'suggestedforyou': return 'Sugerido para ti';
			case 'devotionals': return 'Devocionales';
			case 'categories': return 'Categorías';
			case 'category': return 'Categoría';
			case 'videos': return 'Videos';
			case 'audios': return 'Audios';
			case 'biblebooks': return 'Biblia';
			case 'audiobible': return 'Biblia en audio';
			case 'livestreams': return 'Transmisiones en vivo';
			case 'radio': return 'Radio';
			case 'allitems': return 'Todos los artículos';
			case 'emptyplaylist': return 'Sin listas de reproducción';
			case 'notsupported': return 'No soportado';
			case 'cleanupresources': return 'Limpieza de recursos';
			case 'grantstoragepermission': return 'Otorgue permiso de acceso al almacenamiento para continuar';
			case 'sharefiletitle': return 'Mira o escucha ';
			case 'sharefilebody': return 'Vía Bread of Life App, Descarga ahora en ';
			case 'sharetext': return 'Disfrute de transmisión ilimitada de audio y video';
			case 'sharetexthint': return 'Únase a la plataforma de transmisión de video y audio que le permite ver y escuchar millones de archivos de todo el mundo. Descarga ahora en';
			case 'download': return 'Descargar';
			case 'addplaylist': return 'Agregar a la lista de reproducción';
			case 'bookmark': return 'Marcador';
			case 'unbookmark': return 'Desmarcar';
			case 'share': return 'Compartir';
			case 'deletemedia': return 'Borrar archivo';
			case 'deletemediahint': return '¿Desea eliminar este archivo descargado? Esta acción no se puede deshacer.';
			case 'searchhint': return 'Buscar mensajes de audio y video';
			case 'performingsearch': return 'Búsqueda de audios y videos';
			case 'nosearchresult': return 'No se han encontrado resultados';
			case 'nosearchresulthint': return 'Intente ingresar una palabra clave más general';
			case 'addtoplaylist': return 'Agregar a la lista de reproducción';
			case 'newplaylist': return 'Nueva lista de reproducción';
			case 'playlistitm': return 'Lista de reproducción';
			case 'mediaaddedtoplaylist': return 'Medios agregados a la lista de reproducción.';
			case 'mediaremovedfromplaylist': return 'Medios eliminados de la lista de reproducción';
			case 'clearplaylistmedias': return 'Borrar todos los medios';
			case 'deletePlayList': return 'Eliminar lista de reproducción';
			case 'clearplaylistmediashint': return '¿Continuar y eliminar todos los medios de esta lista de reproducción?';
			case 'deletePlayListhint': return '¿Continuar y eliminar esta lista de reproducción y borrar todos los medios?';
			case 'videomessages': return 'Mensajes de video';
			case 'audiomessages': return 'Mensajes de audio';
			case 'comments': return 'Comentarios';
			case 'replies': return 'Respuestas';
			case 'reply': return 'Respuesta';
			case 'logintoaddcomment': return 'Inicia sesión para añadir un comentario';
			case 'logintoreply': return 'Inicia sesión para responder';
			case 'writeamessage': return 'Escribe un mensaje...';
			case 'nocomments': return 'No se encontraron comentarios \nhaga clic para reintentar';
			case 'errormakingcomments': return 'No se pueden procesar los comentarios en este momento..';
			case 'errordeletingcomments': return 'No se puede eliminar este comentario en este momento..';
			case 'erroreditingcomments': return 'No se puede editar este comentario en este momento..';
			case 'errorloadingmorecomments': return 'No se pueden cargar más comentarios en este momento..';
			case 'deletingcomment': return 'Eliminando comentario';
			case 'editingcomment': return 'Editando comentario';
			case 'deletecommentalert': return 'Eliminar comentario';
			case 'editcommentalert': return 'Editar comentario';
			case 'deletecommentalerttext': return '¿Deseas borrar este comentario? Esta acción no se puede deshacer';
			case 'loadmore': return 'carga más';
			case 'messages': return 'Mensajes';
			case 'guestuser': return 'Usuario invitado';
			case 'fullname': return 'Nombre completo';
			case 'emailaddress': return 'Dirección de correo electrónico';
			case 'password': return 'Contraseña';
			case 'repeatpassword': return 'Repite la contraseña';
			case 'register': return 'Registrarse';
			case 'login': return 'Iniciar sesión';
			case 'logout': return 'Cerrar sesión';
			case 'logoutfromapp': return '¿Salir de la aplicación?';
			case 'logoutfromapphint': return 'No podrá dar me gusta o comentar artículos y videos si no ha iniciado sesión.';
			case 'gotologin': return 'Ir a Iniciar sesión';
			case 'resetpassword': return 'Restablecer la contraseña';
			case 'logintoaccount': return '¿Ya tienes una cuenta? Iniciar sesión';
			case 'emptyfielderrorhint': return 'Necesitas llenar todos los campos';
			case 'invalidemailerrorhint': return 'Debes ingresar una dirección de correo electrónico válida';
			case 'passwordsdontmatch': return 'Las contraseñas no coinciden';
			case 'processingpleasewait': return 'Procesando .. por favor espere...';
			case 'createaccount': return 'Crea una cuenta';
			case 'forgotpassword': return '¿Se te olvidó tu contraseña?';
			case 'orloginwith': return 'O inicie sesión con';
			case 'facebook': return 'Facebook';
			case 'google': return 'Google';
			case 'moreoptions': return 'Mas opciones';
			case 'about': return 'Sobre nosotros';
			case 'privacy': return 'Privacidad';
			case 'terms': return 'Términos de la aplicación';
			case 'rate': return 'Calificar aplicacion';
			case 'version': return 'Versión';
			case 'pulluploadmore': return 'levantar la carga';
			case 'loadfailedretry': return 'Error de carga. Haga clic en reintentar!';
			case 'releaseloadmore': return 'suelte para cargar más';
			case 'nomoredata': return 'No más datos';
			case 'errorReportingComment': return 'Comentario de informe de error';
			case 'reportingComment': return 'Informe de comentario';
			case 'reportcomment': return 'Opciones de informe';
			case 'reportCommentsList.0': return 'Contenido comercial no deseado o spam';
			case 'reportCommentsList.1': return 'Pornografía o material sexual explícito';
			case 'reportCommentsList.2': return 'Discurso de odio o violencia gráfica';
			case 'reportCommentsList.3': return 'Acoso o intimidación';
			case 'bookmarksMedia': return 'Mis marcadores';
			case 'noitemstodisplay': return 'No hay elementos para mostrar';
			case 'loginrequired': return 'Necesario iniciar sesión';
			case 'loginrequiredhint': return 'Para suscribirse en esta plataforma, debe iniciar sesión. Cree una cuenta gratuita ahora o inicie sesión en su cuenta existente.';
			case 'subscriptions': return 'Suscripciones de aplicaciones';
			case 'subscribe': return 'SUSCRIBIR';
			case 'subscribehint': return 'Se requiere suscripción';
			case 'playsubscriptionrequiredhint': return 'Debe suscribirse antes de poder escuchar o ver este medio.';
			case 'previewsubscriptionrequiredhint': return 'Ha alcanzado la duración de vista previa permitida para este medio. Debes suscribirte para seguir escuchando o viendo este medio.';
			case 'copiedtoclipboard': return 'Copiado al portapapeles';
			case 'downloadbible': return 'Descargar Biblia';
			case 'downloadversion': return 'Descargar';
			case 'downloading': return 'Descargando';
			case 'failedtodownload': return 'Error al descargar';
			case 'pleaseclicktoretry': return 'Haga clic para volver a intentarlo.';
			case 'of': return 'De';
			case 'nobibleversionshint': return 'No hay datos bíblicos para mostrar, haga clic en el botón de abajo para descargar al menos una versión bíblica.';
			case 'downloaded': return 'Descargado';
			case 'enteremailaddresstoresetpassword': return 'Ingrese su correo electrónico para restablecer su contraseña';
			case 'backtologin': return 'ATRÁS PARA INICIAR SESIÓN';
			case 'signintocontinue': return 'Regístrate para continuar';
			case 'signin': return 'REGISTRARSE';
			case 'signinforanaccount': return '¿REGÍSTRESE PARA OBTENER UNA CUENTA?';
			case 'alreadyhaveanaccount': return '¿Ya tienes una cuenta?';
			case 'updateprofile': return 'Actualización del perfil';
			case 'updateprofilehint': return 'Para comenzar, actualice su página de perfil, esto nos ayudará a conectarlo con otras personas';
			case 'autoplayvideos': return 'Reproducción automática de vídeos';
			case 'gosocial': return 'Vuélvete social';
			case 'searchbible': return 'Buscar Biblia';
			case 'filtersearchoptions': return 'Opciones de búsqueda de filtros';
			case 'narrowdownsearch': return 'Utilice el botón de filtro a continuación para reducir la búsqueda y obtener un resultado más preciso.';
			case 'searchbibleversion': return 'Buscar la versión de la Biblia';
			case 'searchbiblebook': return 'Buscar libro de la Biblia';
			case 'search': return 'Buscar';
			case 'setBibleBook': return 'Establecer libro de la Biblia';
			case 'oldtestament': return 'Viejo Testamento';
			case 'newtestament': return 'Nuevo Testamento';
			case 'limitresults': return 'Establecer filtros';
			case 'setfilters': return 'Establecer filtros';
			case 'bibletranslator': return 'Traductor de la Biblia';
			case 'chapter': return ' Capítulo ';
			case 'verse': return ' Verso ';
			case 'translate': return 'traducir';
			case 'bibledownloadinfo': return 'Se inició la descarga de la Biblia. No cierre esta página hasta que se haya realizado la descarga.';
			case 'received': return 'recibido';
			case 'outoftotal': return 'fuera del total';
			case 'set': return 'CONJUNTO';
			case 'selectColor': return 'Seleccionar el color';
			case 'switchbibleversion': return 'Cambiar versión de la Biblia';
			case 'switchbiblebook': return 'Cambiar libro de la Biblia';
			case 'gotosearch': return 'Ir al capítulo';
			case 'changefontsize': return 'Cambia tamaño de fuente';
			case 'font': return 'Font';
			case 'readchapter': return 'Leer capítulo';
			case 'showhighlightedverse': return 'Mostrar versículos destacados';
			case 'downloadmoreversions': return 'Descarga más versiones';
			case 'suggestedusers': return 'Usuarios sugeridos para seguir';
			case 'unfollow': return 'Dejar de seguir';
			case 'follow': return 'Seguir';
			case 'searchforpeople': return 'Búsqueda de personas';
			case 'viewpost': return 'Ver publicacion';
			case 'viewprofile': return 'Ver perfil';
			case 'mypins': return 'Mis Pines';
			case 'viewpinnedposts': return 'Ver publicaciones fijadas';
			case 'personal': return 'Personal';
			case 'update': return 'Actualizar';
			case 'phonenumber': return 'Número de teléfono';
			case 'showmyphonenumber': return 'Mostrar mi número de teléfono a los usuarios';
			case 'dateofbirth': return 'Fecha de nacimiento';
			case 'showmyfulldateofbirth': return 'Mostrar mi fecha de nacimiento completa a las personas que ven mi estado';
			case 'notifications': return 'Notificaciones';
			case 'notifywhenuserfollowsme': return 'Notificarme cuando un usuario me siga';
			case 'notifymewhenusercommentsonmypost': return 'Notificarme cuando los usuarios comenten en mi publicación';
			case 'notifymewhenuserlikesmypost': return 'Notificarme cuando a los usuarios les guste mi publicación';
			case 'churchsocial': return 'Iglesia Social';
			case 'shareyourthoughts': return 'Comparte tus pensamientos';
			case 'readmore': return '...Lee mas';
			case 'less': return ' Menos';
			case 'couldnotprocess': return 'No se pudo procesar la acción solicitada.';
			case 'pleaseselectprofilephoto': return 'Seleccione una foto de perfil para cargar';
			case 'pleaseselectprofilecover': return 'Seleccione una foto de portada para cargar';
			case 'updateprofileerrorhint': return 'Debe ingresar su nombre, fecha de nacimiento, sexo, teléfono y ubicación antes de poder continuar.';
			case 'gender': return 'Género';
			case 'male': return 'Masculino';
			case 'female': return 'Hembra';
			case 'dob': return 'Fecha de nacimiento';
			case 'location': return 'Ubicación actual';
			case 'qualification': return 'Calificación';
			case 'aboutme': return 'Sobre mí';
			case 'facebookprofilelink': return 'Facebook Enlace de perfil';
			case 'twitterprofilelink': return 'Twitter Enlace de perfil';
			case 'linkdln': return 'Linkedln Enlace de perfil';
			case 'likes': return 'Gustos';
			case 'likess': return 'Me gusta(s)';
			case 'pinnedposts': return 'Mis publicaciones fijadas';
			case 'unpinpost': return 'Desanclar publicación';
			case 'unpinposthint': return '¿Deseas eliminar esta publicación de tus publicaciones fijadas?';
			case 'postdetails': return 'Detalles de la publicación';
			case 'posts': return 'Publicaciones';
			case 'followers': return 'Seguidores';
			case 'followings': return 'Siguientes';
			case 'my': return 'Mi';
			case 'edit': return 'Editar';
			case 'delete': return 'Eliminar';
			case 'deletepost': return 'Eliminar mensaje';
			case 'deleteposthint': return '¿Deseas eliminar esta publicación? Las publicaciones aún pueden aparecer en los feeds de algunos usuarios.';
			case 'maximumallowedsizehint': return 'Se alcanzó la carga máxima de archivos permitida';
			case 'maximumuploadsizehint': return 'El archivo seleccionado supera el límite de tamaño de archivo de carga permitido.';
			case 'makeposterror': return 'No se puede publicar en este momento, haga clic para volver a intentarlo.';
			case 'makepost': return 'Hacer publicación';
			case 'selectfile': return 'Seleccione Archivo';
			case 'images': return 'Imagenes';
			case 'shareYourThoughtsNow': return 'Share your thoughts ...';
			case 'photoviewer': return 'Visionneuse de photos';
			case 'nochatsavailable': return 'No hay conversaciones disponibles \n Haga clic en el icono de agregar a continuación \n para seleccionar los usuarios con los que chatear';
			case 'typing': return 'Mecanografía...';
			case 'photo': return 'Photo';
			case 'online': return 'En línea';
			case 'offline': return 'Desconectado';
			case 'lastseen': return 'Ultima vez visto';
			case 'deleteselectedhint': return 'Esta acción eliminará los mensajes seleccionados. Tenga en cuenta que esto solo elimina su lado de la conversación, \n los mensajes seguirán apareciendo en el dispositivo de su socio.';
			case 'deleteselected': return 'Eliminar seleccionado';
			case 'unabletofetchconversation': return 'No se pudo recuperar \ntu conversación con \n';
			case 'loadmoreconversation': return 'Cargar más conversaciones';
			case 'sendyourfirstmessage': return 'Envía tu primer mensaje a \n';
			case 'unblock': return 'Desatascar ';
			case 'block': return 'Bloquear ';
			case 'writeyourmessage': return 'escribe tu mensaje...';
			case 'clearconversation': return 'Conversación clara';
			case 'clearconversationhintone': return 'Esta acción borrará toda su conversación con ';
			case 'clearconversationhinttwo': return '.\n  Tenga en cuenta que esto solo elimina su lado de la conversación, los mensajes aún se mostrarán en el chat de sus socios.';
			case 'title': return 'Título';
			case 'thaks_for_contacting': return 'Gracias por contactar';
			case 'submit': return 'Enviar';
			case 'prayer_request_form': return 'Formulario de solicitud de oración';
			case 'please_wait': return 'Espere por favor';
			case 'photos': return 'Fotos';
			case 'no_data': return 'Sin datos';
			case 'msg': return 'Masaje';
			case 'ministry': return 'Ministerio';
			case 'ministry_info': return 'Información del Ministerio';
			case 'ministries': return 'ministerios';
			case 'leaders': return 'Líderes';
			case 'leader_info': return 'Información del líder';
			case 'prayer_request': return 'Petición de oración';
			case 'announcement_info': return 'Información del anuncio';
			case 'leader_desc_json': return 'Leaders Desc Json';
			case 'leader': return 'Líder';
			case 'guestemail': return 'Correo electrónico de invitado';
			case 'gallery': return 'Galería';
			case 'err_empty_your_name': return 'Tu nombre está vacío';
			case 'err_empty_number': return 'Tu número está vacío';
			case 'err_empty_message': return 'Los mensajes están vacíos';
			case 'err_empty_email_address': return 'La dirección de correo electrónico está vacía';
			case 'documents': return 'Documentos';
			case 'description': return 'Descripción';
			case 'contact_us': return 'Contacta con nosotras';
			case 'contact_number': return 'Número de contacto';
			case 'announcements': return 'anuncio';
			default: return null;
		}
	}
}

extension on _StringsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appname': return 'Bread of Life';
			case 'selectlanguage': return 'Choisir la langue';
			case 'chooseapplanguage': return 'Choisissez la langue de l\'application';
			case 'nightmode': return 'Mode nuit';
			case 'initializingapp': return 'initialisation...';
			case 'home': return 'Accueil';
			case 'branches': return 'Branches';
			case 'inbox': return 'Boîte de réception';
			case 'downloads': return 'Téléchargements';
			case 'settings': return 'Paramètres';
			case 'events': return 'Événements';
			case 'myplaylists': return 'Mes listes de lecture';
			case 'nonotesfound': return 'Aucune note trouvée';
			case 'newnote': return 'Nouveau';
			case 'website': return 'Site Internet';
			case 'hymns': return 'Hymnes';
			case 'articles': return 'Des articles';
			case 'notes': return 'Remarques';
			case 'donate': return 'Faire un don';
			case 'deletenote': return 'Supprimer la note';
			case 'deletenotehint': return 'Voulez-vous supprimer cette note? Cette action ne peut pas être annulée.';
			case 'savenotetitle': return 'Titre de la note';
			case 'bookmarks': return 'Favoris';
			case 'socialplatforms': return 'Plateformes sociales';
			case 'onboardingpagetitles.0': return 'Bienvenue à Bread of Life';
			case 'onboardingpagetitles.1': return 'Plein de fonctionnalités';
			case 'onboardingpagetitles.2': return 'Audio, Video \n et diffusion en direct';
			case 'onboardingpagetitles.3': return 'Créer un compte';
			case 'onboardingpagehints.0': return 'Prolongez-vous au-delà des dimanches matins et des quatre murs de votre église. Tout ce dont vous avez besoin pour communiquer et interagir avec un monde axé sur le mobile.';
			case 'onboardingpagehints.1': return 'Nous avons rassemblé toutes les fonctionnalités principales que votre application d\'église doit avoir. Événements, dévotions, notifications, notes et bible multi-version.';
			case 'onboardingpagehints.2': return 'Permettez aux utilisateurs du monde entier de regarder des vidéos, d\'écouter des messages audio et de regarder des flux en direct de vos services religieux.';
			case 'onboardingpagehints.3': return 'Commencez votre voyage vers une expérience de culte sans fin.';
			case 'next': return 'SUIVANT';
			case 'done': return 'COMMENCER';
			case 'quitapp': return 'Quitter l\'application!';
			case 'quitappwarning': return 'Souhaitez-vous fermer l\'application?';
			case 'quitappaudiowarning': return 'Vous êtes en train de lire un fichier audio, quitter l\'application arrêtera la lecture audio. Si vous ne souhaitez pas arrêter la lecture, réduisez simplement l\'application avec le bouton central ou cliquez sur le bouton OK pour quitter l\'application maintenant.';
			case 'ok': return 'D\'accord';
			case 'retry': return 'RECOMMENCEZ';
			case 'oops': return 'Oups!';
			case 'save': return 'sauver';
			case 'cancel': return 'Annuler';
			case 'error': return 'Erreur';
			case 'success': return 'Succès';
			case 'skip': return 'Sauter';
			case 'skiplogin': return 'Passer l\'identification';
			case 'skipregister': return 'Sauter l\'inscription';
			case 'dataloaderror': return 'Impossible de charger les données demandées pour le moment, vérifiez votre connexion de données et cliquez pour réessayer.';
			case 'suggestedforyou': return 'Suggéré pour vous';
			case 'devotionals': return 'Dévotion';
			case 'categories': return 'Catégories';
			case 'category': return 'Catégorie';
			case 'videos': return 'Vidéos';
			case 'audios': return 'Audios';
			case 'biblebooks': return 'Bible';
			case 'audiobible': return 'Bible audio';
			case 'livestreams': return 'Livestreams';
			case 'radio': return 'Radio';
			case 'allitems': return 'Tous les articles';
			case 'emptyplaylist': return 'Aucune liste de lecture';
			case 'notsupported': return 'Non supporté';
			case 'cleanupresources': return 'Nettoyage des ressources';
			case 'grantstoragepermission': return 'Veuillez accorder l\'autorisation d\'accès au stockage pour continuer';
			case 'sharefiletitle': return 'Regarder ou écouter ';
			case 'sharefilebody': return 'Via Bread of Life App, Téléchargez maintenant sur ';
			case 'sharetext': return 'Profitez d\'un streaming audio et vidéo illimité';
			case 'sharetexthint': return 'Rejoignez la plateforme de streaming vidéo et audio qui vous permet de regarder et d\'écouter des millions de fichiers du monde entier. Téléchargez maintenant sur';
			case 'download': return 'Télécharger';
			case 'addplaylist': return 'Ajouter à la playlist';
			case 'bookmark': return 'Signet';
			case 'unbookmark': return 'Supprimer les favoris';
			case 'share': return 'Partager';
			case 'deletemedia': return 'Supprimer le fichier';
			case 'deletemediahint': return 'Souhaitez-vous supprimer ce fichier téléchargé? Cette action ne peut pas être annulée.';
			case 'searchhint': return 'Rechercher des messages audio et vidéo';
			case 'performingsearch': return 'Recherche d\'audio et de vidéos';
			case 'nosearchresult': return 'Aucun résultat trouvé';
			case 'nosearchresulthint': return 'Essayez de saisir un mot clé plus général';
			case 'addtoplaylist': return 'Ajouter à la playlist';
			case 'newplaylist': return 'Nouvelle playlist';
			case 'playlistitm': return 'Playlist';
			case 'mediaaddedtoplaylist': return 'Média ajouté à la playlist.';
			case 'mediaremovedfromplaylist': return 'Média supprimé de la playlist';
			case 'clearplaylistmedias': return 'Effacer tous les médias';
			case 'deletePlayList': return 'Supprimer la playlist';
			case 'clearplaylistmediashint': return 'Voulez-vous supprimer tous les médias de cette liste de lecture?';
			case 'deletePlayListhint': return 'Voulez-vous supprimer cette liste de lecture et effacer tous les médias?';
			case 'videomessages': return 'Messages vidéo';
			case 'audiomessages': return 'Messages audio';
			case 'comments': return 'commentaires';
			case 'replies': return 'réponses';
			case 'reply': return 'Répondre';
			case 'logintoaddcomment': return 'Connectez-vous pour ajouter un commentaire';
			case 'logintoreply': return 'Connectez-vous pour répondre';
			case 'writeamessage': return 'Écrire un message...';
			case 'nocomments': return 'Aucun commentaire trouvé \ncliquez pour réessayer';
			case 'errormakingcomments': return 'Impossible de traiter les commentaires pour le moment..';
			case 'errordeletingcomments': return 'Impossible de supprimer ce commentaire pour le moment..';
			case 'erroreditingcomments': return 'Impossible de modifier ce commentaire pour le moment..';
			case 'errorloadingmorecomments': return 'Impossible de charger plus de commentaires pour le moment..';
			case 'deletingcomment': return 'Suppression du commentaire';
			case 'editingcomment': return 'Modification du commentaire';
			case 'deletecommentalert': return 'Supprimer le commentaire';
			case 'editcommentalert': return 'Modifier le commentaire';
			case 'deletecommentalerttext': return 'Souhaitez-vous supprimer ce commentaire? Cette action ne peut pas être annulée';
			case 'loadmore': return 'charger plus';
			case 'messages': return 'Messages';
			case 'guestuser': return 'Utilisateur invité';
			case 'fullname': return 'Nom complet';
			case 'emailaddress': return 'Adresse électronique';
			case 'password': return 'Mot de passe';
			case 'repeatpassword': return 'Répéter le mot de passe';
			case 'register': return 'S\'inscrire';
			case 'login': return 'S\'identifier';
			case 'logout': return 'Se déconnecter';
			case 'logoutfromapp': return 'Déconnexion de l\'application?';
			case 'logoutfromapphint': return 'Vous ne pourrez pas aimer ou commenter des articles et des vidéos si vous n\'êtes pas connecté.';
			case 'gotologin': return 'Aller à la connexion';
			case 'resetpassword': return 'réinitialiser le mot de passe';
			case 'logintoaccount': return 'Vous avez déjà un compte? S\'identifier';
			case 'emptyfielderrorhint': return 'Vous devez remplir tous les champs';
			case 'invalidemailerrorhint': return 'Vous devez saisir une adresse e-mail valide';
			case 'passwordsdontmatch': return 'Les mots de passe ne correspondent pas';
			case 'processingpleasewait': return 'Traitement, veuillez patienter...';
			case 'createaccount': return 'Créer un compte';
			case 'forgotpassword': return 'Mot de passe oublié?';
			case 'orloginwith': return 'Ou connectez-vous avec';
			case 'facebook': return 'Facebook';
			case 'google': return 'Google';
			case 'moreoptions': return 'Plus d\'options';
			case 'about': return 'À propos de nous';
			case 'privacy': return 'confidentialité';
			case 'terms': return 'Termes de l\'application';
			case 'rate': return 'Application de taux';
			case 'version': return 'Version';
			case 'pulluploadmore': return 'tirer la charge';
			case 'loadfailedretry': return 'Échec du chargement! Cliquez sur Réessayer!';
			case 'releaseloadmore': return 'relâchez pour charger plus';
			case 'nomoredata': return 'Plus de données';
			case 'errorReportingComment': return 'Commentaire de rapport d\'erreur';
			case 'reportingComment': return 'Signaler un commentaire';
			case 'reportcomment': return 'Options de rapport';
			case 'reportCommentsList.0': return 'Contenu commercial indésirable ou spam';
			case 'reportCommentsList.1': return 'Pornographie ou matériel sexuel explicite';
			case 'reportCommentsList.2': return 'Discours haineux ou violence graphique';
			case 'reportCommentsList.3': return 'Harcèlement ou intimidation';
			case 'bookmarksMedia': return 'Mes marque-pages';
			case 'noitemstodisplay': return 'Aucun élément à afficher';
			case 'loginrequired': return 'Connexion requise';
			case 'loginrequiredhint': return 'Pour vous abonner à cette plateforme, vous devez être connecté. Créez un compte gratuit maintenant ou connectez-vous à votre compte existant.';
			case 'subscriptions': return 'Abonnements aux applications';
			case 'subscribe': return 'SOUSCRIRE';
			case 'subscribehint': return 'Abonnement requis';
			case 'playsubscriptionrequiredhint': return 'Vous devez vous abonner avant de pouvoir écouter ou regarder ce média.';
			case 'previewsubscriptionrequiredhint': return 'Vous avez atteint la durée de prévisualisation autorisée pour ce média. Vous devez vous abonner pour continuer à écouter ou à regarder ce média.';
			case 'copiedtoclipboard': return 'Copié dans le presse-papier';
			case 'downloadbible': return 'Télécharger la Bible';
			case 'downloadversion': return 'Télécharger';
			case 'downloading': return 'Téléchargement';
			case 'failedtodownload': return 'Échec du téléchargement';
			case 'pleaseclicktoretry': return 'Veuillez cliquer pour réessayer.';
			case 'of': return 'De';
			case 'nobibleversionshint': return 'Il n\'y a pas de données bibliques à afficher, cliquez sur le bouton ci-dessous pour télécharger au moins une version biblique.';
			case 'downloaded': return 'Téléchargé';
			case 'enteremailaddresstoresetpassword': return 'Entrez votre e-mail pour réinitialiser votre mot de passe';
			case 'backtologin': return 'RETOUR CONNEXION';
			case 'signintocontinue': return 'Connectez-vous pour continuer';
			case 'signin': return 'SE CONNECTER';
			case 'signinforanaccount': return 'INSCRIVEZ-VOUS POUR UN COMPTE?';
			case 'alreadyhaveanaccount': return 'Vous avez déjà un compte?';
			case 'updateprofile': return 'Mettre à jour le profil';
			case 'updateprofilehint': return 'Pour commencer, veuillez mettre à jour votre page de profil, cela nous aidera à vous connecter avec d\'autres personnes';
			case 'autoplayvideos': return 'Vidéos de lecture automatique';
			case 'gosocial': return 'Passez aux réseaux sociaux';
			case 'searchbible': return 'Rechercher dans la Bible';
			case 'filtersearchoptions': return 'Filtrer les options de recherche';
			case 'narrowdownsearch': return 'Utilisez le bouton de filtrage ci-dessous pour affiner la recherche pour un résultat plus précis.';
			case 'searchbibleversion': return 'Rechercher la version de la Bible';
			case 'searchbiblebook': return 'Rechercher un livre biblique';
			case 'search': return 'Chercher';
			case 'setBibleBook': return 'Définir le livre de la Bible';
			case 'oldtestament': return 'L\'Ancien Testament';
			case 'newtestament': return 'Nouveau Testament';
			case 'limitresults': return 'Limiter les résultats';
			case 'setfilters': return 'Définir les filtres';
			case 'bibletranslator': return 'Traducteur de la Bible';
			case 'chapter': return ' Chapitre ';
			case 'verse': return ' Verset ';
			case 'translate': return 'traduire';
			case 'bibledownloadinfo': return 'Le téléchargement de la Bible a commencé, veuillez ne pas fermer cette page tant que le téléchargement n\'est pas terminé.';
			case 'received': return 'reçu';
			case 'outoftotal': return 'sur le total';
			case 'set': return 'ENSEMBLE';
			case 'selectColor': return 'Select Color';
			case 'switchbibleversion': return 'Changer de version de la Bible';
			case 'switchbiblebook': return 'Changer de livre biblique';
			case 'gotosearch': return 'Aller au chapitre';
			case 'changefontsize': return 'Changer la taille de la police';
			case 'font': return 'Police de caractère';
			case 'readchapter': return 'Lire le chapitre';
			case 'showhighlightedverse': return 'Afficher les versets en surbrillance';
			case 'downloadmoreversions': return 'Télécharger plus de versions';
			case 'suggestedusers': return 'Utilisateurs suggérés à suivre';
			case 'unfollow': return 'Ne pas suivre';
			case 'follow': return 'Suivre';
			case 'searchforpeople': return 'Recherche de personnes';
			case 'viewpost': return 'Voir l\'article';
			case 'viewprofile': return 'Voir le profil';
			case 'mypins': return 'Mes épingles';
			case 'viewpinnedposts': return 'Afficher les messages épinglés';
			case 'personal': return 'Personnel';
			case 'update': return 'Mettre à jour';
			case 'phonenumber': return 'Numéro de téléphone';
			case 'showmyphonenumber': return 'Afficher mon numéro de téléphone aux utilisateurs';
			case 'dateofbirth': return 'Date de naissance';
			case 'showmyfulldateofbirth': return 'Afficher ma date de naissance complète aux personnes qui consultent mon statut';
			case 'notifications': return 'Notifications';
			case 'notifywhenuserfollowsme': return 'M\'avertir lorsqu\'un utilisateur me suit';
			case 'notifymewhenusercommentsonmypost': return 'M\'avertir lorsque les utilisateurs commentent mon message';
			case 'notifymewhenuserlikesmypost': return 'M\'avertir lorsque les utilisateurs aiment mon message';
			case 'churchsocial': return 'Église sociale';
			case 'shareyourthoughts': return 'Partage tes pensées';
			case 'readmore': return '...Lire la suite';
			case 'less': return ' Moins';
			case 'couldnotprocess': return 'Impossible de traiter l\'action demandée.';
			case 'pleaseselectprofilephoto': return 'Veuillez sélectionner une photo de profil à télécharger';
			case 'pleaseselectprofilecover': return 'Veuillez sélectionner une photo de couverture à télécharger';
			case 'updateprofileerrorhint': return 'Vous devez renseigner votre nom, date de naissance, sexe, téléphone et lieu avant de pouvoir continuer.';
			case 'gender': return 'Le sexe';
			case 'male': return 'Mâle';
			case 'female': return 'Femme';
			case 'dob': return 'Date de naissance';
			case 'location': return 'Localisation actuelle';
			case 'qualification': return 'Qualification';
			case 'aboutme': return 'À propos de moi';
			case 'facebookprofilelink': return 'Lien de profil Facebook';
			case 'twitterprofilelink': return 'Lien de profil Twitter';
			case 'linkdln': return 'Lien de profil Linkedln';
			case 'likes': return 'Aime';
			case 'likess': return 'Comme';
			case 'pinnedposts': return 'Mes messages épinglés';
			case 'unpinpost': return 'Détacher le message';
			case 'unpinposthint': return 'Souhaitez-vous supprimer ce message de vos messages épinglés?';
			case 'postdetails': return 'Détails de l\'article';
			case 'posts': return 'Des postes';
			case 'followers': return 'Suiveurs';
			case 'followings': return 'Suivi';
			case 'my': return 'Mon';
			case 'edit': return 'Éditer';
			case 'delete': return 'Supprimer';
			case 'deletepost': return 'Supprimer le message';
			case 'deleteposthint': return 'Souhaitez-vous supprimer ce message? Les publications peuvent toujours apparaître sur les flux de certains utilisateurs.';
			case 'maximumallowedsizehint': return 'Téléchargement de fichier maximum autorisé atteint';
			case 'maximumuploadsizehint': return 'Le fichier sélectionné dépasse la limite de taille de fichier de téléchargement autorisée.';
			case 'makeposterror': return 'Impossible de publier un message pour le moment, veuillez cliquer pour réessayer.';
			case 'makepost': return 'Faire un message';
			case 'selectfile': return 'Choisir le dossier';
			case 'images': return 'Images';
			case 'shareYourThoughtsNow': return 'Share your thoughts ...';
			case 'photoviewer': return 'Visor de fotos';
			case 'nochatsavailable': return 'Aucune conversation disponible \n Cliquez sur l\'icône d\'ajout ci-dessous \n pour sélectionner les utilisateurs avec lesquels discuter';
			case 'typing': return 'Dactylographie...';
			case 'photo': return 'Foto';
			case 'online': return 'En ligne';
			case 'offline': return 'Hors ligne';
			case 'lastseen': return 'Dernière vue';
			case 'deleteselectedhint': return 'Cette action supprimera les messages sélectionnés. Veuillez noter que cela ne supprime que votre côté de la conversation, \n les messages s\'afficheront toujours sur votre appareil partenaire.';
			case 'deleteselected': return 'Supprimer sélectionnée';
			case 'unabletofetchconversation': return 'Impossible de récupérer \n votre conversation avec \n';
			case 'loadmoreconversation': return 'Charger plus de conversations';
			case 'sendyourfirstmessage': return 'Envoyez votre premier message à \n';
			case 'unblock': return 'Débloquer ';
			case 'block': return 'Bloquer ';
			case 'writeyourmessage': return 'Rédigez votre message...';
			case 'clearconversation': return 'Conversation claire';
			case 'clearconversationhintone': return 'Cette action effacera toute votre conversation avec ';
			case 'clearconversationhinttwo': return '.\n  Veuillez noter que cela ne supprime que votre côté de la conversation, les messages seront toujours affichés sur le chat de votre partenaire.';
			case 'title': return 'Titre';
			case 'thaks_for_contacting': return 'Merci d\'avoir contacté';
			case 'submit': return 'Soumettre';
			case 'prayer_request_form': return 'Formulaire de demande de prière';
			case 'please_wait': return 'Merci de patienter';
			case 'photos': return 'Photos';
			case 'no_data': return 'Aucune donnée';
			case 'msg': return 'Massage';
			case 'ministry': return 'Ministère';
			case 'ministry_info': return 'Informations du ministère';
			case 'ministries': return 'Ministères';
			case 'leaders': return 'Dirigeantes';
			case 'leader_info': return 'Informations du chef';
			case 'prayer_request': return 'Demande de prière';
			case 'announcement_info': return 'Informations sur l\'annonce';
			case 'leader_desc_json': return 'Description des dirigeants Json';
			case 'leader': return 'Chef';
			case 'guestemail': return 'E-mail invité';
			case 'gallery': return 'Galerie';
			case 'err_empty_your_name': return 'Votre nom est vide';
			case 'err_empty_number': return 'Votre numéro est vide';
			case 'err_empty_message': return 'Les messages sont vides';
			case 'err_empty_email_address': return 'L\'adresse e-mail est vide';
			case 'documents': return 'Document';
			case 'description': return 'La description';
			case 'contact_us': return 'Nous contacter';
			case 'contact_number': return 'Numéro de contact';
			case 'announcements': return 'Annonce';
			default: return null;
		}
	}
}

extension on _StringsPt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appname': return 'Bread of Life';
			case 'selectlanguage': return 'Selecione o idioma';
			case 'chooseapplanguage': return 'Escolha o idioma do aplicativo';
			case 'nightmode': return 'Modo noturno';
			case 'initializingapp': return 'inicializando...';
			case 'home': return 'Casa';
			case 'branches': return 'Ramos';
			case 'inbox': return 'Caixa de entrada';
			case 'downloads': return 'Transferências';
			case 'settings': return 'Configurações';
			case 'events': return 'Eventos';
			case 'myplaylists': return 'Minhas Playlists';
			case 'website': return 'Local na rede Internet';
			case 'hymns': return 'Hinos';
			case 'articles': return 'Artigos';
			case 'notes': return 'Notas';
			case 'donate': return 'Doar';
			case 'bookmarks': return 'Favoritos';
			case 'socialplatforms': return 'Plataformas Sociais';
			case 'onboardingpagetitles.0': return 'Bem-vindo ao Bread of Life';
			case 'onboardingpagetitles.1': return 'Repleto de recursos';
			case 'onboardingpagetitles.2': return 'Áudio, vídeo \n e transmissão ao vivo';
			case 'onboardingpagetitles.3': return 'Criar Conta';
			case 'onboardingpagehints.0': return 'Vá além das manhãs de domingo e das quatro paredes de sua igreja. Tudo que você precisa para se comunicar e interagir com um mundo focado em dispositivos móveis.';
			case 'onboardingpagehints.1': return 'Reunimos todos os principais recursos que seu aplicativo de igreja deve ter. Eventos, devocionais, notificações, notas e bíblia em várias versões.';
			case 'onboardingpagehints.2': return 'Permita que usuários de todo o mundo assistam a vídeos, ouçam mensagens de áudio e assistam a transmissões ao vivo de seus serviços religiosos.';
			case 'onboardingpagehints.3': return 'Comece sua jornada para uma experiência de adoração sem fim.';
			case 'next': return 'PRÓXIMO';
			case 'done': return 'INICIAR';
			case 'quitapp': return 'Sair do aplicativo!';
			case 'quitappwarning': return 'Você deseja fechar o aplicativo?';
			case 'quitappaudiowarning': return 'No momento, você está reproduzindo um áudio. Sair do aplicativo interromperá a reprodução do áudio. Se você não deseja interromper a reprodução, apenas minimize o aplicativo com o botão central ou clique no botão Ok para encerrar o aplicativo agora.';
			case 'ok': return 'Está bem';
			case 'retry': return 'TENTAR NOVAMENTE';
			case 'oops': return 'Opa!';
			case 'save': return 'Salve ';
			case 'cancel': return 'Cancelar';
			case 'error': return 'Erro';
			case 'success': return 'Sucesso';
			case 'skip': return 'Pular';
			case 'skiplogin': return 'Pular login';
			case 'skipregister': return 'Ignorar registro';
			case 'dataloaderror': return 'Não foi possível carregar os dados solicitados no momento, verifique sua conexão de dados e clique para tentar novamente.';
			case 'suggestedforyou': return 'Sugerido para você';
			case 'devotionals': return 'Devocionais';
			case 'categories': return 'Categorias';
			case 'category': return 'Categoria';
			case 'videos': return 'Vídeos';
			case 'audios': return 'Áudios';
			case 'biblebooks': return 'Bíblia';
			case 'audiobible': return 'Bíblia em Áudio';
			case 'livestreams': return 'Transmissões ao vivo';
			case 'radio': return 'Rádio';
			case 'allitems': return 'Todos os itens';
			case 'emptyplaylist': return 'Sem listas de reprodução';
			case 'notsupported': return 'Não suportado';
			case 'cleanupresources': return 'Limpando recursos';
			case 'grantstoragepermission': return 'Conceda permissão de acesso ao armazenamento para continuar';
			case 'sharefiletitle': return 'Assistir ou ouvir ';
			case 'sharefilebody': return 'Através da Bread of Life App, Baixe agora em ';
			case 'sharetext': return 'Desfrute de streaming ilimitado de áudio e vídeo';
			case 'sharetexthint': return 'Junte-se à plataforma de streaming de vídeo e áudio que permite assistir e ouvir milhões de arquivos de todo o mundo. Baixe agora em';
			case 'download': return 'Baixar';
			case 'addplaylist': return 'Adicionar à Playlist';
			case 'bookmark': return 'marca páginas';
			case 'unbookmark': return 'Desmarcar';
			case 'share': return 'Compartilhar';
			case 'deletemedia': return 'Excluir arquivo';
			case 'deletemediahint': return 'Você deseja excluir este arquivo baixado? Essa ação não pode ser desfeita.';
			case 'nonotesfound': return 'Nenhuma nota encontrada';
			case 'newnote': return 'Novo';
			case 'savenotetitle': return 'Título da Nota';
			case 'searchhint': return 'Pesquisar mensagens de áudio e vídeo';
			case 'performingsearch': return 'Pesquisando áudios e vídeos';
			case 'nosearchresult': return 'Nenhum resultado encontrado';
			case 'nosearchresulthint': return 'Tente inserir palavras-chave mais gerais';
			case 'deletenote': return 'Excluir nota';
			case 'deletenotehint': return 'Você quer deletar esta nota? Esta ação não pode ser revertida.';
			case 'addtoplaylist': return 'Adicionar à Playlist';
			case 'newplaylist': return 'Nova Playlist';
			case 'playlistitm': return 'Lista de reprodução';
			case 'mediaaddedtoplaylist': return 'Mídia adicionada à lista de reprodução.';
			case 'mediaremovedfromplaylist': return 'Mídia removida da lista de reprodução';
			case 'clearplaylistmedias': return 'Limpar todas as mídias';
			case 'deletePlayList': return 'Excluir lista de reprodução';
			case 'clearplaylistmediashint': return 'Vá em frente e remover todas as mídias desta lista de reprodução?';
			case 'deletePlayListhint': return 'Vá em frente e exclua esta lista de reprodução e limpar todas as mídias?';
			case 'videomessages': return 'Mensagens de Vídeo';
			case 'audiomessages': return 'Mensagens de Áudio';
			case 'comments': return 'Comentários';
			case 'replies': return 'Respostas';
			case 'reply': return 'Resposta';
			case 'logintoaddcomment': return 'Faça login para adicionar um comentário';
			case 'logintoreply': return 'Entre para responder';
			case 'writeamessage': return 'Escreve uma mensagem...';
			case 'nocomments': return 'Nenhum comentário encontrado \nclique para tentar novamente';
			case 'errormakingcomments': return 'Não é possível processar comentários no momento..';
			case 'errordeletingcomments': return 'Não é possível excluir este comentário no momento..';
			case 'erroreditingcomments': return 'Não é possível editar este comentário no momento..';
			case 'errorloadingmorecomments': return 'Não é possível carregar mais comentários no momento..';
			case 'deletingcomment': return 'Excluindo comentário';
			case 'editingcomment': return 'Editando comentário';
			case 'deletecommentalert': return 'Apagar Comentário';
			case 'editcommentalert': return 'Editar Comentário';
			case 'deletecommentalerttext': return 'Você deseja deletar este comentário? Essa ação não pode ser desfeita';
			case 'loadmore': return 'Carregue mais';
			case 'messages': return 'Mensagens';
			case 'guestuser': return 'Usuário Convidado';
			case 'fullname': return 'Nome completo';
			case 'emailaddress': return 'Endereço de e-mail';
			case 'password': return 'Senha';
			case 'repeatpassword': return 'Repita a senha';
			case 'register': return 'Registro';
			case 'login': return 'Conecte-se';
			case 'logout': return 'Sair';
			case 'logoutfromapp': return 'Sair do aplicativo?';
			case 'logoutfromapphint': return 'Você não poderá curtir ou comentar em artigos e vídeos se não estiver logado.';
			case 'gotologin': return 'Vá para o Login';
			case 'resetpassword': return 'Redefinir senha';
			case 'logintoaccount': return 'já tem uma conta? Conecte-se';
			case 'emptyfielderrorhint': return 'Você precisa preencher todos os campos';
			case 'invalidemailerrorhint': return 'Você precisa inserir um endereço de e-mail válido';
			case 'passwordsdontmatch': return 'As senhas não conferem';
			case 'processingpleasewait': return 'Processando ... Por favor aguarde';
			case 'createaccount': return 'Crie a sua conta aqui';
			case 'forgotpassword': return 'Esqueceu a senha?';
			case 'orloginwith': return 'Ou faça login com';
			case 'facebook': return 'Facebook';
			case 'google': return 'Google';
			case 'moreoptions': return 'Mais opções';
			case 'about': return 'Sobre nós';
			case 'privacy': return 'Privacidade';
			case 'terms': return 'Termos do aplicativo';
			case 'rate': return 'Avaliar aplicativo';
			case 'version': return 'Versão';
			case 'pulluploadmore': return 'puxar a carga';
			case 'loadfailedretry': return 'Falha ao carregar! Clique em repetir!';
			case 'releaseloadmore': return 'solte para carregar mais';
			case 'nomoredata': return 'Sem mais dados';
			case 'errorReportingComment': return 'Comentário do Error Reporting';
			case 'reportingComment': return 'Comentário de relatório';
			case 'reportcomment': return 'Opções de relatório';
			case 'reportCommentsList.0': return 'Conteúdo comercial indesejado ou spam';
			case 'reportCommentsList.1': return 'Pornografia ou material sexual explícito';
			case 'reportCommentsList.2': return 'Discurso de ódio ou violência gráfica';
			case 'reportCommentsList.3': return 'Assédio ou intimidação';
			case 'bookmarksMedia': return 'Meus marcadores de livro';
			case 'noitemstodisplay': return 'Nenhum item para exibir';
			case 'loginrequired': return 'Login necessário';
			case 'loginrequiredhint': return 'Para se inscrever nesta plataforma, você precisa estar logado. Crie uma conta gratuita agora ou faça login em sua conta existente.';
			case 'subscriptions': return 'Assinaturas de aplicativos';
			case 'subscribe': return 'SE INSCREVER';
			case 'subscribehint': return 'Assinatura necessária';
			case 'playsubscriptionrequiredhint': return 'Você precisa se inscrever antes de ouvir ou assistir a esta mídia.';
			case 'previewsubscriptionrequiredhint': return 'Você atingiu a duração de visualização permitida para esta mídia. Você precisa se inscrever para continuar ouvindo ou assistindo esta mídia.';
			case 'copiedtoclipboard': return 'Copiado para a área de transferência';
			case 'downloadbible': return 'Baixe a Bíblia';
			case 'downloadversion': return 'Baixar';
			case 'downloading': return 'Baixando';
			case 'failedtodownload': return 'Falhou o download';
			case 'pleaseclicktoretry': return 'Clique para tentar novamente.';
			case 'of': return 'Do';
			case 'nobibleversionshint': return 'Não há dados da Bíblia para exibir, clique no botão abaixo para baixar pelo menos uma versão da Bíblia.';
			case 'downloaded': return 'Baixado';
			case 'enteremailaddresstoresetpassword': return 'Insira seu e-mail para redefinir sua senha';
			case 'backtologin': return 'VOLTE AO LOGIN';
			case 'signintocontinue': return 'Faça login para continuar';
			case 'signin': return 'ASSINAR EM';
			case 'signinforanaccount': return 'INSCREVA-SE PRA UMA CONTA?';
			case 'alreadyhaveanaccount': return 'já tem uma conta?';
			case 'updateprofile': return 'Atualizar perfil';
			case 'updateprofilehint': return 'Para começar, atualize sua página de perfil, isso nos ajudará a conectar você com outras pessoas';
			case 'autoplayvideos': return 'Vídeos de reprodução automática';
			case 'gosocial': return 'Social';
			case 'searchbible': return 'Bíblia Pesquisa';
			case 'filtersearchoptions': return 'Opções de pesquisa de filtro';
			case 'narrowdownsearch': return 'Use o botão de filtro abaixo para restringir a busca por um resultado mais preciso.';
			case 'searchbibleversion': return 'Versão da Bíblia de pesquisa';
			case 'searchbiblebook': return 'Pesquisar livro bíblico';
			case 'search': return 'Procurar';
			case 'setBibleBook': return 'Set Bible Book';
			case 'oldtestament': return 'Antigo Testamento';
			case 'newtestament': return 'Novo Testamento';
			case 'limitresults': return 'Limite de resultados';
			case 'setfilters': return 'Definir Filtros';
			case 'bibletranslator': return 'Tradutor da bíblia';
			case 'chapter': return ' Capítulo ';
			case 'verse': return ' Versículo ';
			case 'translate': return 'traduzir';
			case 'bibledownloadinfo': return 'Download da Bíblia iniciado, por favor, não feche esta página até que o download seja concluído.';
			case 'received': return 'recebido';
			case 'outoftotal': return 'fora do total';
			case 'set': return 'CONJUNTO';
			case 'selectColor': return 'Selecione a cor';
			case 'switchbibleversion': return 'Mudar a versão da Bíblia';
			case 'switchbiblebook': return 'Trocar livro bíblico';
			case 'gotosearch': return 'Vá para o Capítulo';
			case 'changefontsize': return 'Mudar TAMANHO DA FONTE';
			case 'font': return 'Fonte';
			case 'readchapter': return 'Leia o capítulo';
			case 'showhighlightedverse': return 'Mostrar versos em destaque';
			case 'downloadmoreversions': return 'Baixe mais versões';
			case 'suggestedusers': return 'Usuários sugeridos para seguir';
			case 'unfollow': return 'Deixar de seguir';
			case 'follow': return 'Segue';
			case 'searchforpeople': return 'Procura por pessoas';
			case 'viewpost': return 'Ver postagem';
			case 'viewprofile': return 'Ver perfil';
			case 'mypins': return 'Meus Pins';
			case 'viewpinnedposts': return 'Ver postagens fixadas';
			case 'personal': return 'Pessoal';
			case 'update': return 'Atualizar';
			case 'phonenumber': return 'Número de telefone';
			case 'showmyphonenumber': return 'Mostrar meu número de telefone aos usuários';
			case 'dateofbirth': return 'Data de nascimento';
			case 'showmyfulldateofbirth': return 'Mostrar minha data de nascimento completa para as pessoas que visualizam meu status';
			case 'notifications': return 'Notificações';
			case 'notifywhenuserfollowsme': return 'Notifique-me quando um usuário me seguir';
			case 'notifymewhenusercommentsonmypost': return 'Notifique-me quando usuários comentarem em minha postagem';
			case 'notifymewhenuserlikesmypost': return 'Notifique-me quando os usuários curtirem minha postagem';
			case 'churchsocial': return 'Igreja Social';
			case 'shareyourthoughts': return 'Compartilhe seus pensamentos';
			case 'readmore': return '...Consulte Mais informação';
			case 'less': return ' Menos';
			case 'couldnotprocess': return 'Não foi possível processar a ação solicitada.';
			case 'pleaseselectprofilephoto': return 'Selecione uma foto de perfil para fazer upload';
			case 'pleaseselectprofilecover': return 'Selecione uma foto de capa para fazer upload';
			case 'updateprofileerrorhint': return 'Você precisa preencher seu nome, data de nascimento, sexo, telefone e localização antes de continuar.';
			case 'gender': return 'Gênero';
			case 'male': return 'Masculino';
			case 'female': return 'Fêmeo';
			case 'dob': return 'Data de nascimento';
			case 'location': return 'Localização atual';
			case 'qualification': return 'Qualificação';
			case 'aboutme': return 'Sobre mim';
			case 'facebookprofilelink': return 'Link do perfil do Facebook';
			case 'twitterprofilelink': return 'Link do perfil do Twitter';
			case 'linkdln': return 'Link do perfil Linkedln';
			case 'likes': return 'Gosta';
			case 'likess': return 'Gosto (s)';
			case 'pinnedposts': return 'Minhas postagens fixadas';
			case 'unpinpost': return 'Liberar postagem';
			case 'unpinposthint': return 'Você deseja remover esta postagem de suas postagens fixadas?';
			case 'postdetails': return 'Detalhes da postagem';
			case 'posts': return 'Postagens';
			case 'followers': return 'Seguidores';
			case 'followings': return 'Seguidores';
			case 'my': return 'Minhas';
			case 'edit': return 'Editar';
			case 'delete': return 'Excluir';
			case 'deletepost': return 'Apague a postagem';
			case 'deleteposthint': return 'Você deseja deletar esta postagem? As postagens ainda podem aparecer nos feeds de alguns usuários.';
			case 'maximumallowedsizehint': return 'Máximo de upload de arquivo permitido atingido';
			case 'maximumuploadsizehint': return 'O arquivo selecionado excede o limite de tamanho de arquivo para upload permitido.';
			case 'makeposterror': return 'Não é possível postar no momento, por favor clique para tentar novamente.';
			case 'makepost': return 'Fazer Postagem';
			case 'selectfile': return 'Selecione o arquivo';
			case 'images': return 'Imagens';
			case 'shareYourThoughtsNow': return 'Share your thoughts ...';
			case 'photoviewer': return 'Visualizador de fotos';
			case 'nochatsavailable': return 'Nenhuma conversa disponível \n Clique no ícone adicionar abaixo \npara selecionar usuários para bater papo';
			case 'typing': return 'Digitando...';
			case 'photo': return 'Foto';
			case 'online': return 'Conectados';
			case 'offline': return 'Desligado';
			case 'lastseen': return 'Visto pela última vez';
			case 'deleteselectedhint': return 'Esta ação excluirá as mensagens selecionadas. Observe que isso exclui apenas o seu lado da conversa, \n as mensagens ainda serão exibidas no dispositivo do seu parceiro';
			case 'deleteselected': return 'Apagar selecionado';
			case 'unabletofetchconversation': return 'Não é possível buscar \n sua conversa com \n';
			case 'loadmoreconversation': return 'Carregar mais conversas';
			case 'sendyourfirstmessage': return 'Envie sua primeira mensagem para \n';
			case 'unblock': return 'Desbloquear ';
			case 'block': return 'Quadra ';
			case 'writeyourmessage': return 'Escreva sua mensagem...';
			case 'clearconversation': return 'Conversa Clara';
			case 'clearconversationhintone': return 'Esta ação irá limpar toda a sua conversa com ';
			case 'clearconversationhinttwo': return '.\n  Observe que isso apenas exclui o seu lado da conversa, as mensagens ainda serão exibidas no bate-papo de seus parceiros.';
			case 'title': return 'Título';
			case 'thaks_for_contacting': return 'Obrigado por entrar em contato';
			case 'submit': return 'Enviar';
			case 'prayer_request_form': return 'Formulário de Pedido de Oração';
			case 'please_wait': return 'Por favor, aguarde';
			case 'photos': return 'Fotos';
			case 'no_data': return 'Sem dados';
			case 'msg': return 'Massagem';
			case 'ministry': return 'Ministério';
			case 'ministry_info': return 'Informações do Ministério';
			case 'ministries': return 'Ministérios';
			case 'leaders': return 'Líderes';
			case 'leader_info': return 'Informações do Líder';
			case 'prayer_request': return 'Pedido de oração';
			case 'announcement_info': return 'Informações do anúncio';
			case 'leader_desc_json': return 'Líderes Desc Json';
			case 'leader': return 'Líder';
			case 'guestemail': return 'E-mail do convidado';
			case 'gallery': return 'Galeria';
			case 'err_empty_your_name': return 'Seu nome está vazio';
			case 'err_empty_number': return 'Seu número está vazio';
			case 'err_empty_message': return 'Mensagens está vazio';
			case 'err_empty_email_address': return 'Endereço de e-mail vazio';
			case 'documents': return 'Documento';
			case 'description': return 'Descrição';
			case 'contact_us': return 'Contate-nos';
			case 'contact_number': return 'Número de contato';
			case 'announcements': return 'Anúncio';
			default: return null;
		}
	}
}
