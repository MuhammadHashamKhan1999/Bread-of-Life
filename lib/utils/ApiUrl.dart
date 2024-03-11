class ApiUrl {
  static const String BASEURL = "https://bolm.churchapp.io/";
  static const String TERMS = "https://breadoflifeministries.us/terms";
  static const String PRIVACY = "https://breadoflifeministries.us/privacy";
  static const String ABOUT = "https://breadoflifeministries.us/privacy/about";

  //DO NOT EDIT THE LINES BELOW, ELSE THE APPLICATION WILL MISBEHAVE
  static const String GET_BIBLE = BASEURL + "getBibleVersions";
  static const String DONATE = BASEURL + "donate";
  static const String DISCOVER = BASEURL + "discover";
  static const String CATEGORIES = BASEURL + "fetch_categories";
  static const String LIVESTREAMS = BASEURL + "discoverLivestreams";
  static const String TRENDING = BASEURL + "discoverTrends";
  static const String FETCH_MEDIA = BASEURL + "fetch_media";
  static const String FETCH_BRANCHES = BASEURL + "church_branches";
  static const String STRIPE_DETAILS = BASEURL + "api/get_stripe_details";
  static const String PAYPAL_DETAILS = BASEURL + "api/get_paypal_details";
  static const String SAVE_DONATION = BASEURL + "api/saveDonation";
  static const String CREATE_CUSTOMER = BASEURL + "create_customer";
  static const String DEVOTIONALS = BASEURL + "devotionals";
  static const String EVENTS = BASEURL + "fetch_events";
  static const String GET_MORE_SERVICES = BASEURL + "index.php?/api/get_more_services";
  static const String ALBUMS = BASEURL + "api/get_albums";
  static const String ALBUMS_IMAGES = BASEURL + "api/get_albums_gallery?album_id=";
  static const String CONTACT_US_FORM = BASEURL + "api/contact_us_form";
  static const String LEADERS = BASEURL + "index.php?/api/get_featured_leaders";
  static const String LEADER_INFO = BASEURL + "index.php?/api/get_leader?leader_id=";
  static const String MINISTRIES = BASEURL + "index.php?/api/get_featured_ministries";
  static const String MINISTRY_INFO = BASEURL + "index.php?/api/get_ministry?ministry=";
  static const String GET_EVENTS = BASEURL + "api/get_events";
  static const String GET_ANNOUNCEMENTS = BASEURL + "api/get_announcement";
  static const String GET_DOCUMENT_FOLDERS = BASEURL + "api/get_folders";
  static const String GET_DOCUMENTS = BASEURL + "api/get_folder_files?folder_id=";
  static const String EVENTS_THUMBNAIL = BASEURL + "uploads/thumbnails/events/";
  static const String INBOX = BASEURL + "fetch_inbox";
  static const String HYMNS = BASEURL + "fetch_hymns";
  static const String FETCH_CATEGORIES_MEDIA = BASEURL + "fetch_categories_media";
  static const String SEARCH = BASEURL + "search";
  static const String REGISTER = BASEURL + "registerUser";
  static const String LOGIN = BASEURL + "loginUser";
  static const String RESETPASSWORD = BASEURL + "resetPassword";
  static const String getmediatotallikesandcommentsviews = BASEURL + "getmediatotallikesandcommentsviews";
  static const String update_media_total_views = BASEURL + "update_media_total_views";
  static const String likeunlikemedia = BASEURL + "likeunlikemedia";
  static const String editcomment = BASEURL + "editcomment";
  static const String deletecomment = BASEURL + "deletecomment";
  static const String makecomment = BASEURL + "makecomment";
  static const String loadcomments = BASEURL + "loadcomments";
  static const String editreply = BASEURL + "editreply";
  static const String deletereply = BASEURL + "deletereply";
  static const String replycomment = BASEURL + "replycomment";
  static const String loadreplies = BASEURL + "loadreplies";
  static const String reportcomment = BASEURL + "reportcomment";
  static const String storeFcmToken = BASEURL + "storefcmtoken";
  static const String PRAYER_REQUEST = BASEURL + "api/prayer_request_form_save";

  static const String getUsersToFollow = BASEURL + "get_users_to_follow";
  static const String followUnfollowUser = BASEURL + "follow_unfollow_user";
  static const String userNotifications = BASEURL + "userNotifications";
  static const String fetchUserSettings = BASEURL + "fetch_user_settings";
  static const String updateUserSettings = BASEURL + "update_user_settings";
  static const String fetchUserPosts = BASEURL + "fetch_posts_flutter";
  static const String likeunlikepost = BASEURL + "likeunlikepost";
  static const String pinunpinpost = BASEURL + "pinunpinpost";
  static const String postLikesPeople = BASEURL + "post_likes_people";
  static const String fetchUserPins = BASEURL + "fetchUserPinsFlutter";
  static const String loadpostcomments = BASEURL + "loadpostcomments";
  static const String makepostcomment = BASEURL + "makepostcomment";
  static const String editpostcomment = BASEURL + "editpostcomment";
  static const String deletepostcomment = BASEURL + "deletepostcomment";
  static const String reportpostcomment = BASEURL + "reportpostcomment";
  static const String loadpostreplies = BASEURL + "loadpostreplies";
  static const String replypostcomment = BASEURL + "replypostcomment";
  static const String editpostreply = BASEURL + "editpostreply";
  static const String deletepostreply = BASEURL + "deletepostreply";
  static const String userBioInfoFlutter = BASEURL + "userBioInfoFlutter";
  static const String fetchUserdataPosts = BASEURL + "fetchUserPostsflutter";
  static const String usersFollowPeopleList = BASEURL + "users_follow_people";
  static const String makePost = BASEURL + "make_post_flutter";
  static const String editPost = BASEURL + "editpost";
  static const String deletePost = BASEURL + "deletepost";
  static const String updateUserSocialFcmToken = BASEURL + "updateUserSocialFcmToken";

  static const String sendUserSocialFcmToken = BASEURL + "api/save_device_id"; // OUR

  static const String FETCH_USER_CHATS = BASEURL + "fetch_user_chats";
  static const String FETCH_PARTNER_CHATS = BASEURL + "fetch_user_partner_chat";
  static const String SAVE_CHAT_CONVERSATION =
      BASEURL + "save_user_conversation";
  static const String ONSEEN_USER_CONVERSATION =
      BASEURL + "on_seen_conversation";
  static const String ON_USER_TYPING = BASEURL + "on_user_typing";
  static const String UPDATE_ONLINE_PRESENCE =
      BASEURL + "update_user_online_status";
  static const String DELETE_SELECTED_CHATS =
      BASEURL + "delete_selected_chat_messages";
  static const String CLEAR_USER_CONVERSATION =
      BASEURL + "clear_user_conversation";
  static const String BLOCK_UNBLOCK_USER = BASEURL + "blockUnblockUser";
  static const String LOAD_MORE_CHATS = BASEURL + "load_more_chats";
  static const String CHECK_FOR_NEW_MESSAGES = BASEURL + "checkfornewmessages";
}
