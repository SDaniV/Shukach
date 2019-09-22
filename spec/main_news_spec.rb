require_relative '../parser/sportua_parser.rb'
require_relative '../parser/sportanalytic_parser.rb'

RSpec.describe 'MainNews' do
  it('takes main basketball post from SportUA') do
    sportua_parser = SportUAParser.new
    sportua_parser.load_driver
    sportua_parser.load_sportua
    sportua_parser.go_to_basketball_page
    post_title = sportua_parser.get_newest_post_title
    expect(post_title).to be_truthy
  end

  it('takes main football post from SportAnalytic') do
    sportanalytic_parser = SportAnalyticParser.new
    sportanalytic_parser.load_driver
    sportanalytic_parser.load_sportanalytic
    sportanalytic_parser.go_to_football_page
    post_title = sportanalytic_parser.get_main_football_post_title
    expect(post_title).to be_truthy
  end

  it('takes main basketball post paragraph from SportUA') do
    sportua_parser = SportUAParser.new
    sportua_parser.load_driver
    sportua_parser.load_sportua
    sportua_parser.go_to_basketball_page
    post_title = sportua_parser.get_newest_post_title
    post_first_paragraph = sportua_parser.get_first_paragraph
    link = sportua_parser.get_link_to_full_post
    puts "#{post_title} \n post_first_paragraph \n \
                 Детальніше за посиланням: \n + link"
    expect(post_title).to be_truthy
  end

end
