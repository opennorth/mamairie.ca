# coding: utf-8
module ApplicationHelper
  def title
    t "#{controller.controller_name}.#{controller.action_name}.title"
  end

  def timestamp(timestamp)
    if timestamp.utc.to_date == Date.today
      %(<span class="timeago" title="#{timestamp.iso8601}">#{timestamp.strftime '%-d %b'}</span>).html_safe
    elsif timestamp > Time.now - 31_556_926
      %(<span title="#{timestamp.iso8601}">#{timestamp.strftime '%-d %b'}</span>).html_safe
    else
      %(<span title="#{timestamp.iso8601}">#{timestamp.strftime '%-d %b %y'}</span>).html_safe
    end
  end

  def web_url_text(url)
    # @note May raise an error if regular expression doesn't match
    case url[%r{\Ahttp://(?:www\.)?([a-z0-9-]+)\.(?:com|org)\b}, 1].downcase
    when 'projetmontreal'
      'page sur ProjetMontreal.org'
    when 'unionmontreal'
      'page sur UnionMontreal.com'
    when 'visionmtl'
      'page sur VisionMTL.com'
    else
      'son site personnel'
    end
  end
end
