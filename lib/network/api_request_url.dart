

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

///说明 : 调用此接口 , 传入音乐 id 可获得对应音乐的歌词 ( 不需要登录 )
//必选参数 : id: 音乐 id
const String LYRIC ="lyric";

///说明 : 调用此接口 , 传入音乐 id 和 limit 参数 , 可获得该音乐的所有评论 ( 不需要 登录 )
//必选参数 : id: 音乐 id
//可选参数 : limit: 取出评论数量 , 默认为 20
//offset: 偏移数量 , 用于分页 , 如 :( 评论页数 -1)*20, 其中 20 为 limit 的值
//before: 分页参数,取上一页最后一项的 time 获取下一页数据(获取超过5000条评论的时候需要用到)
const String COMMENT_MUSIC ="comment/music";


///说明 : 调用此接口 , 传入音乐 id(支持多个 id, 用 , 隔开), 可获得歌曲详情(注意:歌曲封面现在需要通过专辑内容接口获取)
//必选参数 : ids: 音乐 id, 如 ids=347230
const String SONG_DETAIL ="song/detail";




