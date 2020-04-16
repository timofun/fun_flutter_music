

///登录接口
const String LOGIN = "app/ucenter/login";

///banner type:资源类型,对应以下类型,默认为 0 即PC
//0: pc
//1: android
//2: iphone
//3: ipad
const String BANNER = "banner";

///推荐歌单 可选参数 : limit: 取出数量 , 默认为 30 (不支持 offset)
const String PERSONAL = "personalized";

///调用此接口 , 可获取默认搜索关键词
const String SEARCH_DEFAULT = "search/default";

///调用此接口 , 传入搜索关键词可以搜索该音乐 / 专辑 / 歌手 / 歌单 / 用户 , 关键词可以多个 , 以空格隔开 ,
///如 " 周杰伦 搁浅 "( 不需要登录 ), 搜索获取的 mp3url 不能直接用 ,
///可通过 /song/url 接口传入歌曲 id 获取具体的播放链接
const String SEARCH = "search";




