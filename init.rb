Redmine::Plugin.register :redmine_roadmap_wiki do
  name 'Redmine Roadmap Wiki plugin'
  author 'Florent Solt'
  description 'A simple roadmap wiki macro'
  version '0.0.1'
  url 'https://github.com/florentsolt/redmine_roadmap_wiki'
end

Redmine::WikiFormatting::Macros.macro :roadmap do |obj, args, text|
  ("<div class='roadmap'>\n#{text}\n</div>" +
    "<script>if (document.readyState === 'complete') { Roadmap.init(); }</script>"
    ).html_safe
end

class RoadmapWikiViewListener < Redmine::Hook::ViewListener
  # Adds javascript and stylesheet tags
  def view_layouts_base_html_head(context)
    javascript_include_tag("roadmap.min.js", :plugin => "redmine_roadmap_wiki") +
    javascript_include_tag("d3.min.js", :plugin => "redmine_roadmap_wiki")
  end
end

module Redmine::WikiFormatting::Textile::Helper
  def heads_for_wiki_formatter_with_roadmap
    heads_for_wiki_formatter_without_roadmap
    unless @heads_for_wiki_formatter_with_roadmap_included
      content_for :header_tags do
        javascript_include_tag('jstoolbar', :plugin => 'redmine_roadmap_wiki')
      end
      @heads_for_wiki_formatter_with_roadmap_included = true
    end
  end

  alias_method_chain :heads_for_wiki_formatter, :roadmap
end