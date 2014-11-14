module ApplicationHelper
  # markdown
  class SyntaxHighlight < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(line_numbers: :inline, line_number_anchors: false, span: :div)
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(
      SyntaxHighlight,
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      tables: true,
      strikethrough: true,
      superscript: true
    )
    markdown.render(text).html_safe
  end
end
