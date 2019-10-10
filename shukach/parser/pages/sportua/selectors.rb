module SportUABasketballSelectors
  BASKETBALL_TAB = 'li.nav-list__item:nth-child(5)'.freeze
  MAIN_POST_TITLE = '.main-post__title'.freeze
  MAIN_POST_FIRST_PARAGRAPH = '.main-post > p:nth-child(4)'.freeze
  MAIL_POST_LINK = '.main-post__title > a:nth-child(1)'.freeze
  MAIN_POST_IMAGE = 'div.main-post > a:nth-child(1) > img:nth-child(1)'.freeze
end

module SportUAFootballSelectors
  FOOTBALL_TAB = '#nav-menu-collapse > nav.nav.nav-menu-collapse > ul > li:nth-child(2)'.freeze
  MAIN_POST_TITLE = '.main-post__title.main-post__title_dissc'.freeze
  MAIN_POST_FIRST_PARAGRAPH = '#top > div.cols > section > div:nth-child(1) > div > p'.freeze
  MAIL_POST_LINK = '.main-post__title.main-post__title_dissc > a'.freeze
  MAIN_POST_IMAGE = '#top > div.cols > section > div:nth-child(1) > div > a > img'.freeze

  FIRST_POPULAR_POST_TITLE = '#top_news > li:nth-child(1) > a.pop-news__title'.freeze
  FIRST_POPULAR_POST_PARAGRAPH = '#top_news > li:nth-child(1) > p'.freeze
  FIRST_POPULAR_POST_LINK = '#top_news > li:nth-child(1) > a.pop-news__title'.freeze
  FIRST_POPULAR_POST_IMAGE = '#top_news > li:nth-child(1) > a:nth-child(1) > img'.freeze
end
