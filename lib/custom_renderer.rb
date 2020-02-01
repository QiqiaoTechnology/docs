require 'middleman-core/renderers/redcarpet'

# Monkey patching middleman's markdown renderer

module RedcarpetExtensions
  def table_cell(content, alignment)
    if content && content[0] == '*'
      content[0] = ''
      "<td class=\"optional\">#{content}</td>"
    else
      "<td>#{content}</td>"
    end
  end
end

module Middleman
  module Renderers
    class MiddlemanRedcarpetHTML
      prepend RedcarpetExtensions
    end
  end
end